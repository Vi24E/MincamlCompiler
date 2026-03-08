mod adhoc;
mod analysis;
mod codegen;
mod coloring;
mod input;
mod peephole;
mod peephole_lite;
mod program;

use std::env;
use std::fs::File;
use std::io::Write;
use std::process;

mod spilling;

mod finalize;
mod long_gap_spill;
mod reordering;
mod regalloc2_compare;
mod petgraph_alloc;

use std::collections::BTreeMap;
use std::collections::BTreeSet;
use std::collections::HashMap;
use std::collections::HashSet;

fn call_debug_enabled() -> bool {
    std::env::var("BACKEND_DEBUG_CALL")
        .map(|v| v != "0")
        .unwrap_or(false)
}

fn live_stats_enabled() -> bool {
    std::env::var("BACKEND_LIVE_STATS")
        .map(|v| v != "0")
        .unwrap_or(false)
}

fn live_dump_indices() -> Vec<usize> {
    let Some(raw) = std::env::var("BACKEND_LIVE_DUMP_IDX").ok() else {
        return Vec::new();
    };
    raw.split(',')
        .filter_map(|s| s.trim().parse::<usize>().ok())
        .collect()
}

fn live_dump_limit() -> usize {
    std::env::var("BACKEND_LIVE_DUMP_LIMIT")
        .ok()
        .and_then(|v| v.parse::<usize>().ok())
        .unwrap_or(64)
}

fn dump_liveness_at_indices(analyzed: &[analysis::AnalyzedInstruction]) {
    let idxs = live_dump_indices();
    if idxs.is_empty() {
        return;
    }
    let limit = live_dump_limit();
    for idx in idxs {
        let Some(inst) = analyzed.get(idx) else {
            println!("[live-dump] idx={} out_of_range(len={})", idx, analyzed.len());
            continue;
        };
        let mnem = inst.instruction.mnemonic.as_deref().unwrap_or("");
        let mut live_in: Vec<String> = inst.live_in.iter().cloned().collect();
        let mut live_out: Vec<String> = inst.live_out.iter().cloned().collect();
        live_in.sort();
        live_out.sort();
        let in_show = live_in.iter().take(limit).cloned().collect::<Vec<_>>();
        let out_show = live_out.iter().take(limit).cloned().collect::<Vec<_>>();
        println!(
            "[live-dump] idx={} mnem={} ops={:?} defs={} uses={} live_in={} live_out={}",
            idx,
            mnem,
            inst.instruction.operands,
            inst.defs.len(),
            inst.uses.len(),
            live_in.len(),
            live_out.len()
        );
        let mut defs: Vec<String> = inst.defs.iter().cloned().collect();
        let mut uses: Vec<String> = inst.uses.iter().cloned().collect();
        defs.sort();
        uses.sort();
        println!("[live-dump]   defs={:?}", defs);
        println!("[live-dump]   uses={:?}", uses);
        println!("[live-dump]   live_in(first {} sorted)={:?}", limit, in_show);
        println!("[live-dump]   live_out(first {} sorted)={:?}", limit, out_show);
    }
}

fn stop_after_analyze_enabled() -> bool {
    std::env::var("BACKEND_STOP_AFTER_ANALYZE")
        .map(|v| v != "0")
        .unwrap_or(false)
}

fn dump_live_all_enabled() -> bool {
    std::env::var("BACKEND_DUMP_LIVE_ALL")
        .map(|v| v != "0")
        .unwrap_or(false)
}

fn dump_live_all_path() -> String {
    std::env::var("BACKEND_DUMP_LIVE_PATH")
        .unwrap_or_else(|_| "../test/minrt.live_all.txt".to_string())
}

fn format_instruction_line(inst: &input::Instruction) -> String {
    let mut s = String::new();
    if let Some(label) = &inst.label {
        s.push_str(label);
        s.push(':');
        if inst.mnemonic.is_some() {
            s.push(' ');
        }
    }
    if let Some(mnemonic) = &inst.mnemonic {
        s.push_str(mnemonic);
        if !inst.operands.is_empty() {
            s.push(' ');
            s.push_str(&inst.operands.join(", "));
        }
    }
    if s.is_empty() {
        "<empty>".to_string()
    } else {
        s
    }
}

fn dump_liveness_full(analyzed: &[analysis::AnalyzedInstruction]) {
    if !dump_live_all_enabled() {
        return;
    }
    let path = dump_live_all_path();
    let mut file = File::create(&path)
        .unwrap_or_else(|e| panic!("failed to create liveness dump '{}': {}", path, e));
    for (idx, inst) in analyzed.iter().enumerate() {
        let line = format_instruction_line(&inst.instruction);
        let live_in = inst.live_in.iter().cloned().collect::<Vec<_>>().join(", ");
        let live_out = inst.live_out.iter().cloned().collect::<Vec<_>>().join(", ");
        writeln!(
            file,
            "{:06}: {}\t# live_in=[{}] live_out=[{}]",
            idx, line, live_in, live_out
        )
        .unwrap_or_else(|e| panic!("failed to write liveness dump '{}': {}", path, e));
    }
    println!("Liveness full dump written to {}", path);
}

fn print_liveness_stats(analyzed: &[analysis::AnalyzedInstruction]) {
    let n = analyzed.len();
    if n == 0 {
        println!("Liveness stats: empty");
        return;
    }
    let mut total_in = 0usize;
    let mut total_out = 0usize;
    let mut max_in = 0usize;
    let mut max_out = 0usize;
    let mut max_in_idx = 0usize;
    let mut max_out_idx = 0usize;
    let mut all_regs: BTreeSet<String> = BTreeSet::new();

    for (i, inst) in analyzed.iter().enumerate() {
        let li = inst.live_in.len();
        let lo = inst.live_out.len();
        total_in += li;
        total_out += lo;
        if li > max_in {
            max_in = li;
            max_in_idx = i;
        }
        if lo > max_out {
            max_out = lo;
            max_out_idx = i;
        }
        for r in &inst.live_in {
            all_regs.insert(r.clone());
        }
        for r in &inst.live_out {
            all_regs.insert(r.clone());
        }
    }
    let avg_in = total_in as f64 / n as f64;
    let avg_out = total_out as f64 / n as f64;
    println!(
        "Liveness stats: insts={} avg_live_in={:.2} avg_live_out={:.2} max_live_in={}@{} max_live_out={}@{} unique_live_regs={}",
        n,
        avg_in,
        avg_out,
        max_in,
        max_in_idx,
        max_out,
        max_out_idx,
        all_regs.len()
    );
    if let Some(inst) = analyzed.get(max_in_idx) {
        let mnem = inst.instruction.mnemonic.as_deref().unwrap_or("");
        println!(
            "  max_live_in_inst idx={} mnem={} ops={:?}",
            max_in_idx, mnem, inst.instruction.operands
        );
        let mut sample: Vec<String> = inst.live_in.iter().take(16).cloned().collect();
        sample.sort();
        println!("  max_live_in_sample(first16_sorted)={:?}", sample);
    }
    if let Some(inst) = analyzed.get(max_out_idx) {
        let mnem = inst.instruction.mnemonic.as_deref().unwrap_or("");
        println!(
            "  max_live_out_inst idx={} mnem={} ops={:?}",
            max_out_idx, mnem, inst.instruction.operands
        );
        let mut sample: Vec<String> = inst.live_out.iter().take(16).cloned().collect();
        sample.sort();
        println!("  max_live_out_sample(first16_sorted)={:?}", sample);
    }
}

fn print_liveness_dominance_sanity(analyzed: &[analysis::AnalyzedInstruction]) {
    let mut first_def: BTreeMap<String, usize> = BTreeMap::new();
    for (idx, inst) in analyzed.iter().enumerate() {
        for r in &inst.defs {
            if (r.starts_with("%vi") || r.starts_with("%vf")) && !first_def.contains_key(r) {
                first_def.insert(r.clone(), idx);
            }
        }
    }
    let mut bad: Vec<(usize, String, usize)> = Vec::new(); // (idx, reg, def_idx)
    for (idx, inst) in analyzed.iter().enumerate() {
        for r in &inst.live_in {
            if !(r.starts_with("%vi") || r.starts_with("%vf")) {
                continue;
            }
            if let Some(&didx) = first_def.get(r) {
                if idx < didx {
                    bad.push((idx, r.clone(), didx));
                }
            }
        }
    }
    println!(
        "Liveness sanity: virtual_regs_with_def={} live_before_first_def_pairs={}",
        first_def.len(),
        bad.len()
    );
    for (idx, reg, didx) in bad.into_iter().take(12) {
        println!(
            "  live-before-def: reg={} live_in_at={} first_def_at={}",
            reg, idx, didx
        );
    }
}

fn call_debug_limit() -> usize {
    std::env::var("BACKEND_DEBUG_CALL_LIMIT")
        .ok()
        .and_then(|v| v.parse::<usize>().ok())
        .unwrap_or(200)
}

fn debug_call_liveness(
    analyzed: &[analysis::AnalyzedInstruction],
    allocation: &coloring::Allocation,
) {
    if !call_debug_enabled() {
        return;
    }

    let limit = call_debug_limit();
    let mut printed = 0usize;
    let mut total_calls = 0usize;
    let mut total_bad = 0usize;

    for (idx, inst) in analyzed.iter().enumerate() {
        let Some(mnem) = inst.instruction.mnemonic.as_deref() else {
            continue;
        };
        if mnem != "call_dir" && mnem != "call_cls" {
            continue;
        }
        total_calls += 1;

        let mut live_virtual: Vec<String> = inst
            .live_out
            .iter()
            .filter(|r| r.starts_with("%vi") || r.starts_with("%vf"))
            .cloned()
            .collect();
        live_virtual.sort();

        let mut live_allocated = Vec::new();
        let mut live_spilled = Vec::new();
        let mut live_unknown = Vec::new();
        for v in &live_virtual {
            match allocation.get(v) {
                Some(Ok(c)) => live_allocated.push(format!("{}=>{}", v, c)),
                Some(Err(())) => live_spilled.push(v.clone()),
                None => live_unknown.push(v.clone()),
            }
        }

        if !live_allocated.is_empty() {
            total_bad += 1;
        }

        if printed < limit {
            eprintln!(
                "[call-debug] idx={} mnem={} ops={:?} defs={} uses={} live_out_v={} alloc={} spill={} unknown={}",
                idx,
                mnem,
                inst.instruction.operands,
                inst.defs.len(),
                inst.uses.len(),
                live_virtual.len(),
                live_allocated.len(),
                live_spilled.len(),
                live_unknown.len()
            );
            if !live_allocated.is_empty() {
                eprintln!("[call-debug]   live_out_allocated={:?}", live_allocated);
            }
            printed += 1;
        }
    }

    eprintln!(
        "[call-debug] summary calls={} suspicious_live_out_allocated_calls={}",
        total_calls, total_bad
    );
}

fn is_int_arg_reg(reg: &str) -> bool {
    if let Some(rest) = reg.strip_prefix("%i") {
        if let Ok(idx) = rest.parse::<usize>() {
            // TKA/asm.ml: integer argument registers are %i4..%i15.
            return (4..=15).contains(&idx);
        }
    }
    false
}

fn is_float_arg_reg(reg: &str) -> bool {
    if let Some(rest) = reg.strip_prefix("%f") {
        if let Ok(idx) = rest.parse::<usize>() {
            // TKA/asm.ml: float argument registers are %f1..%f15.
            return (1..=15).contains(&idx);
        }
    }
    false
}

fn shuffle_moves(scratch: &str, pairs: Vec<(String, String)>) -> Vec<(String, String)> {
    fn rec(scratch: &str, pairs: Vec<(String, String)>) -> Vec<(String, String)> {
        let xys: Vec<(String, String)> = pairs.into_iter().filter(|(x, y)| x != y).collect();
        if xys.is_empty() {
            return Vec::new();
        }

        let sources: HashSet<String> = xys.iter().map(|(x, _)| x.clone()).collect();
        let (acyclic, cyclic): (Vec<(String, String)>, Vec<(String, String)>) =
            xys.into_iter().partition(|(_, y)| !sources.contains(y));

        if !acyclic.is_empty() {
            let mut out = acyclic;
            out.extend(rec(scratch, cyclic));
            return out;
        }

        let (x, y) = cyclic[0].clone();
        let rest: Vec<(String, String)> = cyclic.into_iter().skip(1).collect();
        let mut replaced = Vec::new();
        for (s, d) in rest {
            if s == y {
                replaced.push((scratch.to_string(), d));
            } else {
                replaced.push((s, d));
            }
        }
        let mut out = vec![(y.clone(), scratch.to_string()), (x, y)];
        out.extend(rec(scratch, replaced));
        out
    }

    rec(scratch, pairs)
}

fn normalize_entry_arg_moves(instructions: Vec<input::Instruction>) -> Vec<input::Instruction> {
    let mut out = Vec::with_capacity(instructions.len());
    let mut i = 0;

    while i < instructions.len() {
        let inst = instructions[i].clone();
        if inst.mnemonic.as_deref() != Some(".func_entry") {
            out.push(inst);
            i += 1;
            continue;
        }

        out.push(inst);
        i += 1;

        if i < instructions.len()
            && instructions[i].label.is_some()
            && instructions[i].mnemonic.is_none()
        {
            out.push(instructions[i].clone());
            i += 1;
        }

        let mut int_pairs = Vec::new();
        let mut float_pairs = Vec::new();
        while i < instructions.len() {
            let cur = &instructions[i];
            if cur.label.is_some() {
                break;
            }
            if cur.mnemonic.as_deref() == Some("mov")
                && cur.operands.len() == 2
                && is_int_arg_reg(&cur.operands[1])
            {
                int_pairs.push((cur.operands[1].clone(), cur.operands[0].clone()));
                i += 1;
                continue;
            }
            if cur.mnemonic.as_deref() == Some("fmov")
                && cur.operands.len() == 2
                && is_float_arg_reg(&cur.operands[1])
            {
                float_pairs.push((cur.operands[1].clone(), cur.operands[0].clone()));
                i += 1;
                continue;
            }
            break;
        }

        for (src, dst) in shuffle_moves("%i31", int_pairs) {
            out.push(input::Instruction {
                label: None,
                mnemonic: Some("mov".to_string()),
                operands: vec![dst, src],
            });
        }
        for (src, dst) in shuffle_moves("%f31", float_pairs) {
            out.push(input::Instruction {
                label: None,
                mnemonic: Some("fmov".to_string()),
                operands: vec![dst, src],
            });
        }
    }

    out
}

fn normalize_call_arg_moves(instructions: Vec<input::Instruction>) -> Vec<input::Instruction> {
    let mut out = Vec::with_capacity(instructions.len());

    for inst in instructions {
        let is_call = matches!(
            inst.mnemonic.as_deref(),
            Some("call_dir") | Some("call_cls")
        );
        if !is_call {
            out.push(inst);
            continue;
        }

        let mut int_pairs = Vec::new();
        let mut float_pairs = Vec::new();

        while let Some(prev) = out.last() {
            let mnem = prev.mnemonic.as_deref();
            let is_int_move = mnem == Some("mov")
                && prev.operands.len() == 2
                && prev.label.is_none()
                && is_int_arg_reg(&prev.operands[0]);
            let is_float_move = mnem == Some("fmov")
                && prev.operands.len() == 2
                && prev.label.is_none()
                && is_float_arg_reg(&prev.operands[0]);

            if is_int_move {
                let mv = out.pop().unwrap();
                int_pairs.push((mv.operands[1].clone(), mv.operands[0].clone()));
            } else if is_float_move {
                let mv = out.pop().unwrap();
                float_pairs.push((mv.operands[1].clone(), mv.operands[0].clone()));
            } else {
                break;
            }
        }

        int_pairs.reverse();
        float_pairs.reverse();

        for (src, dst) in shuffle_moves("%i31", int_pairs) {
            out.push(input::Instruction {
                label: None,
                mnemonic: Some("mov".to_string()),
                operands: vec![dst, src],
            });
        }
        for (src, dst) in shuffle_moves("%f31", float_pairs) {
            out.push(input::Instruction {
                label: None,
                mnemonic: Some("fmov".to_string()),
                operands: vec![dst, src],
            });
        }

        out.push(inst);
    }

    out
}

fn normalize_parallel_moves(instructions: Vec<input::Instruction>) -> Vec<input::Instruction> {
    let after_entry = normalize_entry_arg_moves(instructions);
    normalize_call_arg_moves(after_entry)
}

fn normalize_movui_addi_to_ori(
    mut instructions: Vec<input::Instruction>,
) -> Vec<input::Instruction> {
    if instructions.len() < 2 {
        return instructions;
    }

    for i in 0..(instructions.len() - 1) {
        let (left, right) = instructions.split_at_mut(i + 1);
        let movui = &mut left[i];
        let addi = &mut right[0];

        if movui.mnemonic.as_deref() != Some("movui") || addi.mnemonic.as_deref() != Some("addi") {
            continue;
        }
        if movui.operands.len() != 2 || addi.operands.len() != 3 {
            continue;
        }

        let rd = movui.operands[0].clone();
        if addi.operands[0] != rd || addi.operands[1] != rd {
            continue;
        }

        let Ok(upper) = movui.operands[1].parse::<u32>() else {
            continue;
        };
        let Ok(imm) = addi.operands[2].parse::<i32>() else {
            continue;
        };

        let base = (upper & 0x000f_ffff) << 12;
        let value = base.wrapping_add(imm as u32);
        let new_upper = (value >> 12) & 0x000f_ffff;
        let lower = value & 0x0000_0fff;
        let lower_imm = if lower >= 2048 {
            lower as i32 - 4096
        } else {
            lower as i32
        };

        movui.operands[1] = new_upper.to_string();
        addi.mnemonic = Some("ori".to_string());
        addi.operands[2] = lower_imm.to_string();
    }

    instructions
}

fn mnemonic_defines_first_operand(mnemonic: &str, rd: &str) -> bool {
    match mnemonic {
        "add" | "sub" | "sll" | "sar" | "xor" | "ceq" | "cleq" | "clt" | "feq" | "fneq"
        | "fleq" | "flt"
        | "fadd" | "fsub" | "fmul" | "fma" | "fdiv" | "addi" | "subi" | "slli" | "sari" | "ori"
        | "xori" | "ceqi" | "cleqi" | "clti" | "mov" | "neg" | "fmov" | "fneg" | "finv"
        | "frsqrt" | "ffloor" | "fabs" | "ftoi" | "itof" | "movi" | "movui" | "mif" | "lw"
        | "lf" | "lb"
        | "set_label" | "tern" | "ftern" => true,
        "jmp" => rd != "%i0",
        _ => false,
    }
}

fn replace_reg_in_operand(op: &str, from: &str, to: &str) -> String {
    if op == from {
        return to.to_string();
    }
    let from_mem = format!("({})", from);
    if op.contains(&from_mem) {
        return op.replace(&from_mem, &format!("({})", to));
    }
    op.to_string()
}

fn normalize_call_result_moves(instructions: Vec<input::Instruction>) -> Vec<input::Instruction> {
    let mut out = Vec::with_capacity(instructions.len());
    let mut int_alias_active = false;
    let mut float_alias_active = false;

    for mut inst in instructions {
        // New basic block starts at labels.
        if inst.label.is_some() {
            int_alias_active = false;
            float_alias_active = false;
        }

        if let Some(mnemonic) = inst.mnemonic.as_deref() {
            let rd = inst.operands.first().cloned().unwrap_or_default();
            let def_first = mnemonic_defines_first_operand(mnemonic, &rd);

            for (idx, op) in inst.operands.iter_mut().enumerate() {
                let is_def = idx == 0 && def_first;
                if !is_def {
                    if int_alias_active {
                        *op = replace_reg_in_operand(op, "%i4", "%i30");
                    }
                    if float_alias_active {
                        *op = replace_reg_in_operand(op, "%f1", "%f30");
                    }
                }
            }

            // call_* produces return values in %i30/%f30.
            if mnemonic == "call_dir" || mnemonic == "call_cls" {
                int_alias_active = true;
                float_alias_active = true;
            }

            // If %i4/%f1 are explicitly redefined, stop aliasing.
            if def_first && rd == "%i4" {
                int_alias_active = false;
            }
            if def_first && rd == "%f1" {
                float_alias_active = false;
            }

            // Alias information does not cross explicit control-flow boundaries.
            if matches!(mnemonic, "jmp" | "jzero" | "jeq" | "jlt" | "jleq" | "ret") {
                int_alias_active = false;
                float_alias_active = false;
            }
        }

        out.push(inst);
    }

    out
}

fn normalize_backend_conventions(instructions: Vec<input::Instruction>) -> Vec<input::Instruction> {
    let canonical_imm = normalize_movui_addi_to_ori(instructions);
    let moved = normalize_parallel_moves(canonical_imm);
    normalize_call_result_moves(moved)
}

fn is_library_label(label: &str) -> bool {
    matches!(
        label,
        "min_caml_print_newline"
            | "min_caml_print_char"
            | "min_caml_read_char"
            | "min_caml_create_array"
            | "min_caml_create_float_array"
            | "min_caml_rsqrt"
            | "min_caml_floor"
            | "min_caml_fabs"
    )
}

fn split_library_tail(
    instructions: Vec<input::Instruction>,
) -> (Vec<input::Instruction>, Vec<input::Instruction>) {
    if let Some(idx) = instructions
        .iter()
        .position(|inst| inst.label.as_deref().map(is_library_label).unwrap_or(false))
    {
        (instructions[..idx].to_vec(), instructions[idx..].to_vec())
    } else {
        (instructions, Vec::new())
    }
}

fn env_enabled(name: &str, default: bool) -> bool {
    match env::var(name) {
        Ok(v) => {
            let s = v.trim().to_ascii_lowercase();
            !(s == "0" || s == "false" || s == "off" || s == "no")
        }
        Err(_) => default,
    }
}

fn env_i32(name: &str, default: i32) -> i32 {
    env::var(name)
        .ok()
        .and_then(|v| v.trim().parse::<i32>().ok())
        .unwrap_or(default)
}

fn env_usize(name: &str, default: usize) -> usize {
    env::var(name)
        .ok()
        .and_then(|v| v.trim().parse::<usize>().ok())
        .unwrap_or(default)
}

fn is_virtual_int_reg(reg: &str) -> bool {
    reg.starts_with("%vi")
}

fn is_virtual_float_reg(reg: &str) -> bool {
    reg.starts_with("%vf")
}

fn is_virtual_reg(reg: &str) -> bool {
    is_virtual_int_reg(reg) || is_virtual_float_reg(reg)
}

fn is_caller_color_idx(color: usize, is_int: bool) -> bool {
    if is_int {
        color <= 11
    } else {
        color <= 14
    }
}

fn is_callee_color_idx(color: usize, is_int: bool) -> bool {
    if is_int {
        (12..=25).contains(&color)
    } else {
        (15..=28).contains(&color)
    }
}

fn color_to_phys(color: usize, is_int: bool) -> String {
    if is_int {
        format!("%i{}", color + 4)
    } else {
        format!("%f{}", color + 1)
    }
}

fn build_preference_map(
    work_program: &[program::FunctionProg],
    work_instructions: &[input::Instruction],
    analyzed: &[analysis::AnalyzedInstruction],
) -> coloring::PreferenceMap {
    let ranges = program::partition_function_ranges(work_instructions);
    let mut inst_to_func = vec![0usize; analyzed.len()];
    for (fi, range) in ranges.iter().enumerate() {
        for idx in range.clone() {
            if idx < inst_to_func.len() {
                inst_to_func[idx] = fi;
            }
        }
    }

    let mut call_crossings: BTreeMap<String, usize> = BTreeMap::new();
    let mut reg_to_func: BTreeMap<String, usize> = BTreeMap::new();
    let mut all_virtual: BTreeSet<String> = BTreeSet::new();

    for (idx, info) in analyzed.iter().enumerate() {
        for r in info.defs.iter().chain(info.uses.iter()) {
            if is_virtual_reg(r) {
                all_virtual.insert(r.clone());
                reg_to_func.entry(r.clone()).or_insert(inst_to_func[idx]);
            }
        }
        let is_call = matches!(
            info.instruction.mnemonic.as_deref(),
            Some("call_dir") | Some("call_cls")
        );
        if is_call {
            for r in &info.live_out {
                if is_virtual_reg(r) {
                    *call_crossings.entry(r.clone()).or_insert(0) += 1;
                }
            }
        }
    }

    let all_caller_save = std::env::var("BACKEND_ALL_CALLER_SAVE")
        .map(|v| v != "0")
        .unwrap_or(true);

    let mut prefs: coloring::PreferenceMap = BTreeMap::new();
    for reg in all_virtual {
        let func_idx = reg_to_func.get(&reg).copied().unwrap_or(0);
        if func_idx >= work_program.len() {
            continue;
        }
        let func = &work_program[func_idx];
        let crossings = call_crossings.get(&reg).copied().unwrap_or(0);
        let mut pref = coloring::NodePreference::default();

        // Arg index bonus is always available (decoupled from prefer_caller).
        if is_virtual_int_reg(&reg) {
            if let Some(&idx) = func.entry_int_args.get(&reg) {
                pref.arg_index = Some(idx);
            }
        } else if is_virtual_float_reg(&reg) {
            if let Some(&idx) = func.entry_float_args.get(&reg) {
                pref.arg_index = Some(idx);
            }
        }

        let is_int = is_virtual_int_reg(&reg);
        let k = if is_int { 26 } else { 29 };
        let entry_arg_color = if is_int {
            func.entry_int_args.get(&reg).copied()
        } else {
            func.entry_float_args.get(&reg).copied()
        };

        if all_caller_save {
            // ---- ALL CALLER-SAVE mode: offspring-aware preference ----
            // Use crossing-based clustering (same as traditional mode) PLUS
            // offspring clobber penalty. The crossing split still provides
            // useful clustering even though all regs are caller-save in finalize.
            const PENALTY_CROSSING_MISMATCH: i32 = 8_000;
            const PENALTY_OFFSPRING_CLOBBER: i32 = 2_000;
            const PENALTY_ENTRY_ARG_MISS: i32 = 10_000;

            let crossing_threshold: usize = std::env::var("BACKEND_CROSSING_THRESHOLD")
                .ok()
                .and_then(|v| v.parse().ok())
                .unwrap_or(4);
            if crossings >= crossing_threshold {
                pref.prefer_callee = true;
            } else {
                pref.prefer_caller = true;
            }

            for c in 0..k {
                let is_caller = is_caller_color_idx(c, is_int);
                let is_callee = is_callee_color_idx(c, is_int);
                let phys = color_to_phys(c, is_int);
                let mut penalty = 0i32;

                // Entry argument vregs should stay on ABI arg colors
                // to avoid function-entry mov chains.
                if let Some(arg_c) = entry_arg_color {
                    if c != arg_c {
                        penalty += PENALTY_ENTRY_ARG_MISS;
                    }
                }

                // 1) crossing mismatch (cluster crossing vars into callee range)
                if crossings < crossing_threshold && is_callee {
                    penalty += PENALTY_CROSSING_MISMATCH;
                }
                if crossings >= crossing_threshold && is_caller {
                    penalty += PENALTY_CROSSING_MISMATCH;
                }

                // 2) offspring clobber: cross-call vars should avoid colors
                //    that callees will clobber (requires save at call site).
                if crossings > 0 && func.callee_clobber_union.contains(&phys) {
                    penalty += PENALTY_OFFSPRING_CLOBBER;
                }

                if penalty > 0 {
                    let entry = pref.color_penalty.entry(c).or_insert(0);
                    *entry += penalty;
                }
            }
        } else {
            // ---- Traditional caller/callee split mode ----
            let crossing_threshold: usize = std::env::var("BACKEND_CROSSING_THRESHOLD")
                .ok()
                .and_then(|v| v.parse().ok())
                .unwrap_or(4);
            if crossings >= crossing_threshold {
                pref.prefer_callee = true;
            } else {
                pref.prefer_caller = true;
            }

            const PENALTY_CROSSING_MISMATCH: i32 = 8_000;
            const PENALTY_DIRECT_CALLEE_CLOBBER_CALLER: i32 = 2_000;
            const PENALTY_OFFSPRING_USED_CALLEE: i32 = 2_000;
            const PENALTY_ENTRY_ARG_MISS: i32 = 10_000;

            for c in 0..k {
                let is_caller = is_caller_color_idx(c, is_int);
                let is_callee = is_callee_color_idx(c, is_int);
                let phys = color_to_phys(c, is_int);
                let mut penalty = 0i32;

                // Entry argument vregs should stay on ABI arg colors
                // to avoid function-entry mov chains.
                if let Some(arg_c) = entry_arg_color {
                    if c != arg_c {
                        penalty += PENALTY_ENTRY_ARG_MISS;
                    }
                }

                // 1) crossing mismatch (largest penalty)
                if crossings < crossing_threshold && is_callee {
                    penalty += PENALTY_CROSSING_MISMATCH;
                }
                if crossings >= crossing_threshold && is_caller {
                    penalty += PENALTY_CROSSING_MISMATCH;
                }

                // 2-a) direct callee may clobber caller-save colors
                if is_caller && func.callee_clobber_union.contains(&phys) {
                    penalty += PENALTY_DIRECT_CALLEE_CLOBBER_CALLER;
                }

                // 2-b) descendants already use this callee-save color heavily
                if is_callee && func.callee_used_regs.contains(&phys) {
                    penalty += PENALTY_OFFSPRING_USED_CALLEE;
                }

                if penalty > 0 {
                    let entry = pref.color_penalty.entry(c).or_insert(0);
                    *entry += penalty;
                }
            }
        }

        prefs.insert(reg, pref);
    }

    prefs
}

fn build_call_arity_map(functions: &[program::FunctionProg]) -> HashMap<String, (usize, usize)> {
    let mut map = HashMap::new();
    for f in functions {
        map.insert(f.name.clone(), (f.int_arity, f.float_arity));
    }
    map
}

#[derive(Default)]
struct AllocationStats {
    total_virtual: usize,
    total_int_virtual: usize,
    total_float_virtual: usize,
    colored_virtual: usize,
    spilled_virtual: usize,
    colored_int: usize,
    colored_float: usize,
    spilled_int: usize,
    spilled_float: usize,
    used_int_colors: BTreeSet<usize>,
    used_float_colors: BTreeSet<usize>,
}

#[derive(Default)]
struct ConstraintStats {
    int_nodes: usize,
    float_nodes: usize,
    int_forbidden_any: usize,
    float_forbidden_any: usize,
    int_forbidden_all: usize,
    float_forbidden_all: usize,
    spilled_int_forbidden_all: usize,
    spilled_float_forbidden_all: usize,
}

struct FunctionColorStats {
    name: String,
    kind: program::FunctionKind,
    total_virtual: usize,
    total_int_virtual: usize,
    total_float_virtual: usize,
    colored_virtual: usize,
    spilled_virtual: usize,
    used_int_colors: BTreeSet<usize>,
    used_float_colors: BTreeSet<usize>,
    peak_live_virtual: usize,
    peak_live_int: usize,
    peak_live_float: usize,
}

impl Default for FunctionColorStats {
    fn default() -> Self {
        Self {
            name: String::new(),
            kind: program::FunctionKind::Unknown,
            total_virtual: 0,
            total_int_virtual: 0,
            total_float_virtual: 0,
            colored_virtual: 0,
            spilled_virtual: 0,
            used_int_colors: BTreeSet::new(),
            used_float_colors: BTreeSet::new(),
            peak_live_virtual: 0,
            peak_live_int: 0,
            peak_live_float: 0,
        }
    }
}

fn function_kind_name(kind: program::FunctionKind) -> &'static str {
    match kind {
        program::FunctionKind::MainRegion => "main",
        program::FunctionKind::UserFunction => "user",
        program::FunctionKind::LibraryFunction => "lib",
        program::FunctionKind::Unknown => "unknown",
    }
}

fn color_range_string(colors: &BTreeSet<usize>) -> String {
    if colors.is_empty() {
        "-".to_string()
    } else {
        let min_c = colors.first().copied().unwrap_or(0);
        let max_c = colors.last().copied().unwrap_or(0);
        format!("{}..{}", min_c, max_c)
    }
}

fn collect_function_color_stats(
    work_program: &[program::FunctionProg],
    work_instructions: &[input::Instruction],
    analyzed: &[analysis::AnalyzedInstruction],
    allocation: &coloring::Allocation,
) -> Vec<FunctionColorStats> {
    let mut stats: Vec<FunctionColorStats> = work_program
        .iter()
        .map(|f| FunctionColorStats {
            name: f.name.clone(),
            kind: f.kind,
            ..FunctionColorStats::default()
        })
        .collect();

    for (fi, func) in work_program.iter().enumerate() {
        let mut regs = BTreeSet::new();
        for r in func.used_regs.iter().chain(func.def_regs.iter()) {
            if is_virtual_reg(r) {
                regs.insert(r.clone());
            }
        }
        let s = &mut stats[fi];
        s.total_virtual = regs.len();
        for r in regs {
            if is_virtual_int_reg(&r) {
                s.total_int_virtual += 1;
            } else if is_virtual_float_reg(&r) {
                s.total_float_virtual += 1;
            }
            match allocation.get(&r) {
                Some(Ok(c)) => {
                    s.colored_virtual += 1;
                    if is_virtual_int_reg(&r) {
                        s.used_int_colors.insert(*c);
                    } else if is_virtual_float_reg(&r) {
                        s.used_float_colors.insert(*c);
                    }
                }
                Some(Err(())) => {
                    s.spilled_virtual += 1;
                }
                None => {}
            }
        }
    }

    let ranges = program::partition_function_ranges(work_instructions);
    for (fi, range) in ranges.iter().enumerate() {
        if fi >= stats.len() {
            break;
        }
        for idx in range.clone() {
            if idx >= analyzed.len() {
                break;
            }
            let inst = &analyzed[idx];
            for live in [&inst.live_in, &inst.live_out] {
                let mut live_int = 0usize;
                let mut live_float = 0usize;
                for r in live {
                    if is_virtual_int_reg(r) {
                        live_int += 1;
                    } else if is_virtual_float_reg(r) {
                        live_float += 1;
                    }
                }
                let live_total = live_int + live_float;
                let s = &mut stats[fi];
                s.peak_live_int = s.peak_live_int.max(live_int);
                s.peak_live_float = s.peak_live_float.max(live_float);
                s.peak_live_virtual = s.peak_live_virtual.max(live_total);
            }
        }
    }

    stats
}

fn print_function_color_stats(stats: &[FunctionColorStats]) {
    println!("Function coloring report:");
    println!(
        "  {:<34} {:<6} {:>6} {:>6} {:>6} {:>8} {:>10} {:>10} {:>9} {:>10}",
        "name",
        "kind",
        "vregs",
        "intv",
        "fltv",
        "spills",
        "int_col",
        "flt_col",
        "live_pk",
        "live_i/f"
    );
    for s in stats {
        println!(
            "  {:<34} {:<6} {:>6} {:>6} {:>6} {:>8} {:>10} {:>10} {:>9} {:>4}/{:<4}",
            s.name,
            function_kind_name(s.kind),
            s.total_virtual,
            s.total_int_virtual,
            s.total_float_virtual,
            s.spilled_virtual,
            format!("{}({})", s.used_int_colors.len(), color_range_string(&s.used_int_colors)),
            format!(
                "{}({})",
                s.used_float_colors.len(),
                color_range_string(&s.used_float_colors)
            ),
            s.peak_live_virtual,
            s.peak_live_int,
            s.peak_live_float
        );
    }
}

fn collect_allocation_stats(allocation: &coloring::Allocation) -> AllocationStats {
    let mut stats = AllocationStats::default();

    for (reg, alloc) in allocation {
        let is_int = reg.starts_with("%vi");
        let is_float = reg.starts_with("%vf");
        if !is_int && !is_float {
            continue;
        }

        stats.total_virtual += 1;
        if is_int {
            stats.total_int_virtual += 1;
        } else {
            stats.total_float_virtual += 1;
        }

        match alloc {
            Ok(c) => {
                stats.colored_virtual += 1;
                if is_int {
                    stats.colored_int += 1;
                    stats.used_int_colors.insert(*c);
                } else {
                    stats.colored_float += 1;
                    stats.used_float_colors.insert(*c);
                }
            }
            Err(()) => {
                stats.spilled_virtual += 1;
                if is_int {
                    stats.spilled_int += 1;
                } else {
                    stats.spilled_float += 1;
                }
            }
        }
    }

    stats
}

fn print_allocation_stats(stats: &AllocationStats) {
    let spill_rate = if stats.total_virtual == 0 {
        0.0
    } else {
        stats.spilled_virtual as f64 * 100.0 / stats.total_virtual as f64
    };

    println!(
        "Allocation stats: virtual_total={} colored={} spilled={} spill_rate={:.2}%",
        stats.total_virtual, stats.colored_virtual, stats.spilled_virtual, spill_rate
    );
    println!(
        "  int: total={} colored={} spilled={} used_colors={}/26",
        stats.total_int_virtual,
        stats.colored_int,
        stats.spilled_int,
        stats.used_int_colors.len()
    );
    println!(
        "  float: total={} colored={} spilled={} used_colors={}/29",
        stats.total_float_virtual,
        stats.colored_float,
        stats.spilled_float,
        stats.used_float_colors.len()
    );
    if !stats.used_int_colors.is_empty() {
        let min_c = stats.used_int_colors.first().unwrap();
        let max_c = stats.used_int_colors.last().unwrap();
        println!("  int: color_range={}..{}", min_c, max_c);
    }
    if !stats.used_float_colors.is_empty() {
        let min_c = stats.used_float_colors.first().unwrap();
        let max_c = stats.used_float_colors.last().unwrap();
        println!("  float: color_range={}..{}", min_c, max_c);
    }
}

fn collect_constraint_stats(
    graph: &analysis::InterferenceGraph,
    allocation: &coloring::Allocation,
) -> ConstraintStats {
    let mut stats = ConstraintStats::default();
    for node in graph.adj.keys() {
        let is_int = node.starts_with("%vi");
        let is_float = node.starts_with("%vf");
        if !is_int && !is_float {
            continue;
        }
        let forbidden = graph.forbidden.get(node).map(|s| s.len()).unwrap_or(0);
        let spilled = matches!(allocation.get(node), Some(Err(())));
        if is_int {
            stats.int_nodes += 1;
            if forbidden > 0 {
                stats.int_forbidden_any += 1;
            }
            if forbidden >= 26 {
                stats.int_forbidden_all += 1;
                if spilled {
                    stats.spilled_int_forbidden_all += 1;
                }
            }
        } else {
            stats.float_nodes += 1;
            if forbidden > 0 {
                stats.float_forbidden_any += 1;
            }
            if forbidden >= 29 {
                stats.float_forbidden_all += 1;
                if spilled {
                    stats.spilled_float_forbidden_all += 1;
                }
            }
        }
    }
    stats
}

fn print_constraint_stats(stats: &ConstraintStats) {
    println!(
        "Constraint stats: int_nodes={} forbidden_any={} forbidden_all={} spilled_forbidden_all={}",
        stats.int_nodes,
        stats.int_forbidden_any,
        stats.int_forbidden_all,
        stats.spilled_int_forbidden_all
    );
    println!(
        "  float_nodes={} forbidden_any={} forbidden_all={} spilled_forbidden_all={}",
        stats.float_nodes,
        stats.float_forbidden_any,
        stats.float_forbidden_all,
        stats.spilled_float_forbidden_all
    );
}

fn main() {
    let args: Vec<String> = env::args().collect();
    if args.len() < 2 {
        eprintln!("Usage: {} <assembly_file>", args[0]);
        process::exit(1);
    }

    let filename = &args[1];
    match input::read_assembly_file(filename) {
        Ok(initial_instructions) => {
            let mut current_program = program::from_instructions(initial_instructions);
            let rules_path =
                env::var("BACKEND_RULES_PATH").unwrap_or_else(|_| "rules.txt".to_string());
            let rules_path_stage1 =
                env::var("BACKEND_RULES_PATH_STAGE1").unwrap_or_else(|_| rules_path.clone());
            let rules_path_stage2 =
                env::var("BACKEND_RULES_PATH_STAGE2").unwrap_or_else(|_| rules_path.clone());
            let rules_path_stage3 =
                env::var("BACKEND_RULES_PATH_STAGE3").unwrap_or_else(|_| rules_path.clone());
            let enable_stage1 = env_enabled("BACKEND_PEEPHOLE_STAGE1", true);
            let enable_stage2 = env_enabled("BACKEND_PEEPHOLE_STAGE2", false);
            // let enable_stage3 = env_enabled("BACKEND_PEEPHOLE_STAGE3", true);
            let enable_stage3 = env_enabled("BACKEND_PEEPHOLE_STAGE3", false);
            let enable_preference = env_enabled("BACKEND_COLOR_PREFERENCE", true);
            let enable_reorder = env_enabled("BACKEND_REORDER", false);
            let reorder_seed = env::var("BACKEND_REORDER_SEED")
                .ok()
                .and_then(|v| v.parse::<u64>().ok());
            let reorder_cost_default = reordering::ReorderCostConfig::default();
            let reorder_cost_cfg = reordering::ReorderCostConfig {
                def_cost: env_i32("BACKEND_REORDER_DEF_COST", reorder_cost_default.def_cost),
                load_cost: env_i32("BACKEND_REORDER_LOAD_COST", reorder_cost_default.load_cost),
                raw_cost: env_i32("BACKEND_REORDER_RAW_COST", reorder_cost_default.raw_cost),
                war_cost: env_i32("BACKEND_REORDER_WAR_COST", reorder_cost_default.war_cost),
                waw_cost: env_i32("BACKEND_REORDER_WAW_COST", reorder_cost_default.waw_cost),
                live_end_bonus: env_i32(
                    "BACKEND_REORDER_LIVE_END_BONUS",
                    reorder_cost_default.live_end_bonus,
                ),
            };
            let verbose_stats = env_enabled("BACKEND_VERBOSE_STATS", false);
            let function_color_report = env_enabled("BACKEND_FUNC_COLOR_REPORT", false);
            let function_color_filter = env::var("BACKEND_FUNC_COLOR_FILTER").ok();
            let function_color_limit = env::var("BACKEND_FUNC_COLOR_LIMIT")
                .ok()
                .and_then(|v| v.parse::<usize>().ok())
                .unwrap_or(usize::MAX);
            let long_gap_threshold_alive = env_usize(
                "BACKEND_LONG_GAP_THRESHOLD_ALIVE",
                long_gap_spill::THRESHOLD_ALIVE_DEFAULT,
            );
            let long_gap_exclude_loop_vars =
                env_enabled("BACKEND_LONG_GAP_EXCLUDE_LOOP_VARS", false);
            let long_gap_retry_on_spill =
                env_enabled("BACKEND_LONG_GAP_RETRY_ON_SPILL", false);
            let mut long_gap_chunk_max = env_usize(
                "BACKEND_LONG_GAP_CHUNK_MAX_INIT",
                long_gap_spill::CHUNK_MAX_INIT_DEFAULT,
            )
            .max(2);
            let long_gap_chunk_max_limit = env_usize(
                "BACKEND_LONG_GAP_CHUNK_MAX_LIMIT",
                long_gap_spill::CHUNK_MAX_LIMIT_DEFAULT,
            )
            .max(long_gap_chunk_max);
            let allocator_kind =
                env::var("BACKEND_ALLOCATOR").unwrap_or_else(|_| "chaitin".to_string());
            println!(
                "Peephole config: stage1={} stage2={} stage3={} preference={} reorder={} rules={}/{}/{} verbose_stats={} func_color_report={} allocator={}",
                enable_stage1,
                enable_stage2,
                enable_stage3,
                enable_preference,
                enable_reorder,
                rules_path_stage1,
                rules_path_stage2,
                rules_path_stage3,
                verbose_stats,
                function_color_report,
                allocator_kind
            );

            if enable_stage1 {
                let stage1_lite = peephole_lite::optimize(program::flatten(&current_program), "stage1");
                println!(
                    "Peephole stage1 (frontend-like regs) rewrites: {} (replaced by peephole_lite)",
                    0
                );
                println!(
                    "Peephole_lite stage1 (fma only) rewrites: {}",
                    stage1_lite.rewrites
                );
                current_program = program::from_instructions(stage1_lite.instructions);
            } else {
                println!("Peephole stage1 (frontend-like regs) rewrites: 0 (disabled)");
                println!("Peephole_lite stage1 (fma only) rewrites: 0 (disabled)");
            }
            if enable_reorder {
                let reordered = reordering::reorder_with_config(
                    program::flatten(&current_program),
                    reorder_seed,
                    reorder_cost_cfg,
                );
                println!(
                    "Reordering priority sort: windows={} swaps={} seed={} cost(def/load/raw/war/waw/live_end_bonus)={}/{}/{}/{}/{}/{}",
                    reordered.windows,
                    reordered.swaps,
                    reordered.seed,
                    reorder_cost_cfg.def_cost,
                    reorder_cost_cfg.load_cost,
                    reorder_cost_cfg.raw_cost,
                    reorder_cost_cfg.war_cost,
                    reorder_cost_cfg.waw_cost,
                    reorder_cost_cfg.live_end_bonus
                );
                current_program = program::from_instructions(reordered.instructions);
            } else {
                println!("Reordering priority sort: 0 (disabled)");
            }
            let pre_long_gap_program = current_program.clone();
            {
                let cfg = long_gap_spill::LongGapSpillConfig {
                    threshold_alive: long_gap_threshold_alive,
                    chunk_max: long_gap_chunk_max,
                    exclude_loop_vars: long_gap_exclude_loop_vars,
                };
                let split = long_gap_spill::apply_with_config(
                    program::flatten(&current_program),
                    cfg,
                );
                println!(
                    "LongGap spill split: funcs={} vregs={} candidates={} applied={} loads={} stores={} skipped_loop_vars={} threshold_alive={} chunk_max={} exclude_loop_vars={} retry_on_spill={} chunk_max_limit={}",
                    split.stats.functions,
                    split.stats.virtual_regs_seen,
                    split.stats.candidates,
                    split.stats.applied,
                    split.stats.inserted_loads,
                    split.stats.inserted_stores,
                    split.stats.skipped_loop_vars,
                    cfg.threshold_alive,
                    cfg.chunk_max,
                    cfg.exclude_loop_vars,
                    long_gap_retry_on_spill,
                    long_gap_chunk_max_limit
                );
                current_program = program::from_instructions(split.instructions);
            }
            let mut iteration = 0;
            const MAX_ITERATIONS: usize = 20;

            loop {
                iteration += 1;
                let normalized = normalize_backend_conventions(program::flatten(&current_program));
                let mut work_program = program::from_instructions(normalized);
                program::annotate_interprocedural(&mut work_program);
                let work_instructions = program::flatten(&work_program);
                let main_regions = work_program
                    .iter()
                    .filter(|f| matches!(f.kind, program::FunctionKind::MainRegion))
                    .count();
                let user_functions = work_program
                    .iter()
                    .filter(|f| matches!(f.kind, program::FunctionKind::UserFunction))
                    .count();
                let library_functions = work_program
                    .iter()
                    .filter(|f| matches!(f.kind, program::FunctionKind::LibraryFunction))
                    .count();
                println!("--- Iteration {} ---", iteration);
                println!(
                    "Function count: {} (main={}, user={}, library={})",
                    work_program.len(),
                    main_regions,
                    user_functions,
                    library_functions
                );
                println!("Instruction count: {}", work_instructions.len());

                // 1. Analyze
                let t_analyze = std::time::Instant::now();
                let analyzed = analysis::analyze(&work_instructions);
                println!("Analyze time: {:.3}s", t_analyze.elapsed().as_secs_f64());
                if live_stats_enabled() {
                    print_liveness_stats(&analyzed);
                    print_liveness_dominance_sanity(&analyzed);
                }
                adhoc::print_loop_invariant_stats(&work_instructions, &analyzed);
                dump_liveness_at_indices(&analyzed);
                dump_liveness_full(&analyzed);
                if stop_after_analyze_enabled() {
                    println!("Stopped after analyze by BACKEND_STOP_AFTER_ANALYZE=1");
                    process::exit(0);
                }
                let t_pref = std::time::Instant::now();
                let mut preferences =
                    build_preference_map(&work_program, &work_instructions, &analyzed);
                println!("Preference time: {:.3}s", t_pref.elapsed().as_secs_f64());

                // 2. Build Graph
                let t_graph = std::time::Instant::now();
                let graph = analysis::InterferenceGraph::build(&analyzed);
                println!("Graph build time: {:.3}s", t_graph.elapsed().as_secs_f64());
                println!("Interference Graph Stats:");
                println!("Nodes: {}", graph.adj.len());
                // Edges count not strictly needed for logic, skipping for brevity

                // 3. Color
                // Use full allocatable registers.
                // Int: %i4..%i29 (26 regs), Float: %f1..%f29 (29 regs).
                // %i30/%f30 are dedicated return-preservation registers.
                // %i31/%f31 are dedicated scratch registers for spill expansion.
                let k = 26;
                println!("Coloring (K={})...", k);
                let t_color = std::time::Instant::now();
                let mut coloring = coloring::Coloring::new(k, graph);
                if allocator_kind == "regalloc2" {
                    match regalloc2_compare::seed_color_hints(&analyzed) {
                        Ok(hints) => {
                            for (v, c) in hints {
                                let e = preferences.entry(v).or_default();
                                e.color_penalty.insert(c, -10_000);
                            }
                        }
                        Err(e) => {
                            println!("regalloc2 seed hint failed ({}), continue without seed", e);
                        }
                    }
                }
                let allocation = if allocator_kind == "petgraph" {
                    petgraph_alloc::allocate(coloring.graph(), &preferences, k)
                } else {
                    if enable_preference || allocator_kind == "regalloc2" {
                        coloring.set_preferences(preferences);
                    }
                    coloring.color()
                };
                println!("Coloring time: {:.3}s", t_color.elapsed().as_secs_f64());
                if iteration == 1 {
                    let current_spills = allocation.values().filter(|r| r.is_err()).count();
                    let t_cmp = std::time::Instant::now();
                    match regalloc2_compare::compare_spills(&analyzed) {
                        Ok(c) => {
                            println!(
                                "Spill compare (iter=1): current={} regalloc2={} (int={}, float={}) vregs={} spillslots={} time={:.3}s",
                                current_spills,
                                c.spilled_vregs,
                                c.spilled_int_vregs,
                                c.spilled_float_vregs,
                                c.total_vregs,
                                c.spillslots,
                                t_cmp.elapsed().as_secs_f64()
                            );
                        }
                        Err(e) => {
                            println!(
                                "Spill compare (iter=1): current={} regalloc2=ERROR({}) time={:.3}s",
                                current_spills,
                                e,
                                t_cmp.elapsed().as_secs_f64()
                            );
                        }
                    }
                }
                if verbose_stats {
                    let alloc_stats = collect_allocation_stats(&allocation);
                    print_allocation_stats(&alloc_stats);
                    let constraint_stats = collect_constraint_stats(coloring.graph(), &allocation);
                    print_constraint_stats(&constraint_stats);
                }
                if function_color_report {
                    let mut function_stats = collect_function_color_stats(
                        &work_program,
                        &work_instructions,
                        &analyzed,
                        &allocation,
                    );
                    function_stats.sort_by(|a, b| {
                        b.peak_live_virtual
                            .cmp(&a.peak_live_virtual)
                            .then_with(|| b.spilled_virtual.cmp(&a.spilled_virtual))
                            .then_with(|| b.total_virtual.cmp(&a.total_virtual))
                            .then_with(|| a.name.cmp(&b.name))
                    });
                    if let Some(filter) = function_color_filter.as_ref() {
                        function_stats.retain(|s| s.name.contains(filter));
                    }
                    if function_stats.len() > function_color_limit {
                        function_stats.truncate(function_color_limit);
                    }
                    print_function_color_stats(&function_stats);
                }
                debug_call_liveness(&analyzed, &allocation);

                // 4. Check Spills
                let mut spilled_vars = HashMap::new();
                for (var, res) in &allocation {
                    if res.is_err() {
                        // Mark as spilled
                        spilled_vars.insert(var.clone(), ());
                    }
                }
                if spilled_vars.is_empty() {
                    println!("Coloring Successful!");

                    // 4.5 Peephole optimize on virtual registers
                    let stage2_instructions = if enable_stage2 {
                        let stage2_call_arity = build_call_arity_map(&work_program);
                        let r = peephole::optimize(
                            work_instructions,
                            &rules_path_stage2,
                            &stage2_call_arity,
                            "stage2",
                        );
                        println!("Peephole stage2 (virtual regs) rewrites: {}", r.rewrites);
                        r.instructions
                    } else {
                        println!("Peephole stage2 (virtual regs) rewrites: 0 (disabled)");
                        work_instructions
                    };

                    // 4.6 Finalize (Stack Frame & Callee Saves)
                    println!("Finalizing code (Stack Frame & Prologue/Epilogue)...");
                    let finalized_insts = finalize::finalize_code(stage2_instructions, &allocation);

                    // 4.7 Resolve to physical registers, then peephole again
                    let resolved_insts =
                        codegen::resolve_instructions(&finalized_insts, &allocation);
                    let (stage3_target, stage3_protected_tail) = split_library_tail(resolved_insts);
                    let stage3_limit = env::var("BACKEND_STAGE3_MAX_INSTRUCTIONS")
                        .ok()
                        .and_then(|v| v.parse::<usize>().ok())
                        .unwrap_or(100_000);
                    let should_run_stage3 = enable_stage3 && stage3_target.len() <= stage3_limit;
                    if enable_stage3 && !should_run_stage3 {
                        println!(
                            "Peephole stage3 skipped: instruction_count={} exceeds limit={}",
                            stage3_target.len(),
                            stage3_limit
                        );
                    }
                    if !stage3_protected_tail.is_empty() {
                        println!(
                            "Peephole stage3: preserving library tail ({} instructions)",
                            stage3_protected_tail.len()
                        );
                    }
                    let stage3_instructions = if should_run_stage3 {
                        let stage3_call_arity = build_call_arity_map(&work_program);
                        let r = peephole::optimize(
                            stage3_target,
                            &rules_path_stage3,
                            &stage3_call_arity,
                            "stage3",
                        );
                        println!("Peephole stage3 (physical regs) rewrites: {}", r.rewrites);
                        let mut merged = r.instructions;
                        merged.extend(stage3_protected_tail);
                        merged
                    } else {
                        println!("Peephole stage3 (physical regs) rewrites: 0 (disabled)");
                        let mut merged = stage3_target;
                        merged.extend(stage3_protected_tail);
                        merged
                    };

                    let adhoc_opt = adhoc::optimize(stage3_instructions);
                    println!(
                        "Adhoc trampoline_elim rewrites: {}, branch_relax rewrites: {}, short_jump_fold rewrites: {}, global_access_opt rewrites: {}, zero_base_fold rewrites: {}, word_offset_scale rewrites: {}, val_trace rewrites: {}, reg_cse rewrites: {}, loop_inv_hoist rewrites: {}, alias_use rewrites: {}, dead_def rewrites: {}, redundant_reload rewrites: {}",
                        adhoc_opt.trampoline_elim_rewrites,
                        adhoc_opt.branch_relax_rewrites,
                        adhoc_opt.short_jump_fold_rewrites,
                        adhoc_opt.global_access_rewrites,
                        adhoc_opt.zero_base_fold_rewrites,
                        adhoc_opt.word_offset_rewrites,
                        adhoc_opt.val_trace_rewrites,
                        adhoc_opt.reg_cse_rewrites,
                        adhoc_opt.loop_invariant_hoist_rewrites,
                        adhoc_opt.alias_use_rewrites,
                        adhoc_opt.dead_move_rewrites,
                        adhoc_opt.redundant_reload_rewrites
                    );

                    // Generate Code
                    let asm_output = codegen::emit_assembly(&adhoc_opt.instructions);
                    let output_file = "minrt_colored.s";
                    std::fs::write(output_file, asm_output).expect("Unable to write output file");
                    println!("Generated assembly written to {}", output_file);
                    break;
                } else {
                    println!("Spill required this iteration: {}", spilled_vars.len());

                    if long_gap_retry_on_spill
                        && iteration == 1
                        && long_gap_chunk_max < long_gap_chunk_max_limit
                    {
                        let next_chunk_max = long_gap_chunk_max
                            .saturating_mul(2)
                            .min(long_gap_chunk_max_limit);
                        if next_chunk_max > long_gap_chunk_max {
                            long_gap_chunk_max = next_chunk_max;
                            println!(
                                "LongGap retry: spill detected, retry with chunk_max={}",
                                long_gap_chunk_max
                            );
                            current_program = pre_long_gap_program.clone();
                            let cfg = long_gap_spill::LongGapSpillConfig {
                                threshold_alive: long_gap_threshold_alive,
                                chunk_max: long_gap_chunk_max,
                                exclude_loop_vars: long_gap_exclude_loop_vars,
                            };
                            let split = long_gap_spill::apply_with_config(
                                program::flatten(&current_program),
                                cfg,
                            );
                            println!(
                                "LongGap spill split(retry): funcs={} vregs={} candidates={} applied={} loads={} stores={} skipped_loop_vars={} threshold_alive={} chunk_max={} exclude_loop_vars={}",
                                split.stats.functions,
                                split.stats.virtual_regs_seen,
                                split.stats.candidates,
                                split.stats.applied,
                                split.stats.inserted_loads,
                                split.stats.inserted_stores,
                                split.stats.skipped_loop_vars,
                                cfg.threshold_alive,
                                cfg.chunk_max,
                                cfg.exclude_loop_vars
                            );
                            current_program = program::from_instructions(split.instructions);
                            iteration = 0;
                            continue;
                        }
                    }

                    if iteration >= MAX_ITERATIONS {
                        eprintln!("Error: Exceeded max iterations for spilling.");
                        process::exit(1);
                    }

                    // 5. Rewrite Instructions
                    println!("Rewriting instructions with spills...");
                    let spilled_instructions =
                        spilling::perform_spilling(work_instructions, &spilled_vars, &allocation);
                    current_program = program::from_instructions(spilled_instructions);

                    // Debug: Check if spilled vars still appear in instructions
                    if iteration == 1 {
                        let mut remaining_spilled = std::collections::HashSet::new();
                        for inst in &program::flatten(&current_program) {
                            for op in &inst.operands {
                                for (sv, _) in &spilled_vars {
                                    // Check exact match or in offset form like "0(%vi997)"
                                    let exact_match = op == sv;
                                    let in_offset = op.contains(&format!("({})", sv))
                                        || op == &format!("({})", sv);
                                    if exact_match || in_offset {
                                        remaining_spilled.insert(sv.clone());
                                    }
                                }
                            }
                        }
                        if !remaining_spilled.is_empty() {
                            println!("WARNING: Spilled vars still present after spilling:");
                            for v in &remaining_spilled {
                                println!("  {}", v);
                            }
                        } else {
                            println!("OK: All spilled vars replaced with temps");
                        }
                    }
                }
            }
        }
        Err(e) => {
            eprintln!("Error reading file {}: {}", filename, e);
            process::exit(1);
        }
    }
}
