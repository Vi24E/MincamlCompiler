use crate::analysis;
use crate::input::Instruction;
use std::collections::{BTreeMap, BTreeSet, HashMap, HashSet};

pub struct OptimizeResult {
    pub instructions: Vec<Instruction>,
    pub global_access_rewrites: usize,
    pub zero_base_fold_rewrites: usize,
    pub word_offset_rewrites: usize,
    pub val_trace_rewrites: usize,
    pub reg_cse_rewrites: usize,
    pub alias_use_rewrites: usize,
    pub dead_move_rewrites: usize,
    pub redundant_reload_rewrites: usize,
    pub trampoline_elim_rewrites: usize,
    pub branch_relax_rewrites: usize,
    pub short_jump_fold_rewrites: usize,
    pub loop_invariant_hoist_rewrites: usize,
}

pub struct VirtualOptimizeResult {
    pub instructions: Vec<Instruction>,
    pub val_trace_rewrites: usize,
    pub reg_cse_rewrites: usize,
    pub alias_use_rewrites: usize,
    pub dead_move_rewrites: usize,
}

fn register_opt_iterations() -> usize {
    std::env::var("BACKEND_REG_OPT_ITER")
        .ok()
        .and_then(|v| v.parse::<usize>().ok())
        .filter(|&v| v >= 1)
        .unwrap_or(2)
}

pub fn optimize_virtual(instructions: Vec<Instruction>) -> VirtualOptimizeResult {
    let mut instructions = instructions;
    let mut val_trace_rewrites = 0usize;
    let mut alias_use_rewrites = 0usize;
    let mut reg_cse_rewrites = 0usize;
    let mut dead_move_rewrites = 0usize;

    for _ in 0..register_opt_iterations() {
        let (ins, r) = const_reuse_with_val_trace_opt(instructions);
        instructions = ins;
        val_trace_rewrites += r;

        let (ins, r) = normalize_mov_alias_uses_virtual_opt(instructions);
        instructions = ins;
        alias_use_rewrites += r;

        let (ins, r) = inv_beta_virtual_opt(instructions);
        instructions = ins;
        dead_move_rewrites += r;

        let (ins, r) = register_cse_virtual_opt(instructions);
        instructions = ins;
        reg_cse_rewrites += r;

        let (ins, r) = eliminate_dead_moves_virtual_opt(instructions);
        instructions = ins;
        dead_move_rewrites += r;

        let (ins, r) = eliminate_noop_add_opt(instructions);
        instructions = ins;
        dead_move_rewrites += r;

        let (ins, r) = eliminate_zero_dest_nop_opt(instructions);
        instructions = ins;
        dead_move_rewrites += r;
    }

    VirtualOptimizeResult {
        instructions,
        val_trace_rewrites,
        reg_cse_rewrites,
        alias_use_rewrites,
        dead_move_rewrites,
    }
}

pub fn optimize(instructions: Vec<Instruction>) -> OptimizeResult {
    // Pass 1: eliminate trampolines that are clearly visible before relaxation
    let (instructions, trampoline_elim_rewrites_1) = jump_trampoline_elim(instructions);
    // Relax far conditional branches (those rewritten to far targets by pass 1)
    let (instructions, branch_relax_rewrites) = relax_branches_opt(instructions);
    // Pass 2: eliminate any remaining or newly visible trampolines
    let (instructions, trampoline_elim_rewrites_2) = jump_trampoline_elim(instructions);
    // Fold short unconditional jumps: set_label + jmp -> jzero %i0, %i0, label
    let (instructions, short_jump_fold_rewrites) = fold_short_unconditional_jumps_opt(instructions);
    let (instructions, global_access_rewrites) = global_access_opt(instructions);
    let (instructions, zero_base_fold_rewrites) = fold_zero_base_addr_opt(instructions);
    let (instructions, word_offset_rewrites) = scale_word_mem_offset_opt(instructions);
    let mut instructions = instructions;
    let mut val_trace_rewrites = 0usize;
    let mut alias_use_rewrites = 0usize;
    let mut dead_move_rewrites = 0usize;
    let mut reg_cse_rewrites = 0usize;
    let mut loop_invariant_hoist_rewrites = 0usize;
    let mut redundant_reload_rewrites = 0usize;
    let mut trampoline_elim_rewrites = trampoline_elim_rewrites_1 + trampoline_elim_rewrites_2;

    for _ in 0..register_opt_iterations() {
        let (ins, r) = const_reuse_with_val_trace_opt(instructions);
        instructions = ins;
        val_trace_rewrites += r;

        let (ins, r) = normalize_mov_alias_uses_opt(instructions);
        instructions = ins;
        alias_use_rewrites += r;

        let (ins, r) = inv_beta_opt(instructions);
        instructions = ins;
        dead_move_rewrites += r;

        let (ins, r) = eliminate_dead_moves_cfg_opt(instructions);
        instructions = ins;
        dead_move_rewrites += r;

        let (ins, r) = eliminate_noop_add_opt(instructions);
        instructions = ins;
        dead_move_rewrites += r;

        let (ins, r) = eliminate_zero_dest_nop_opt(instructions);
        instructions = ins;
        dead_move_rewrites += r;

        let (ins, r) = register_cse_opt(instructions);
        instructions = ins;
        reg_cse_rewrites += r;

        let (ins, r) = hoist_loop_invariants_opt(instructions);
        instructions = ins;
        loop_invariant_hoist_rewrites += r;

        let (ins, r) = eliminate_dead_moves_cfg_opt(instructions);
        instructions = ins;
        dead_move_rewrites += r;

        let (ins, r) = eliminate_noop_add_opt(instructions);
        instructions = ins;
        dead_move_rewrites += r;

        let (ins, r) = eliminate_zero_dest_nop_opt(instructions);
        instructions = ins;
        dead_move_rewrites += r;

        let (ins, r) = eliminate_redundant_store_load_opt(instructions);
        instructions = ins;
        redundant_reload_rewrites += r;

        let (ins, r) = jump_trampoline_elim(instructions);
        instructions = ins;
        trampoline_elim_rewrites += r;

        let (ins, _) = prune_unused_labels_opt(instructions);
        instructions = ins;
    }

    OptimizeResult {
        instructions,
        global_access_rewrites,
        zero_base_fold_rewrites,
        word_offset_rewrites,
        val_trace_rewrites,
        reg_cse_rewrites,
        alias_use_rewrites,
        dead_move_rewrites,
        redundant_reload_rewrites,
        trampoline_elim_rewrites,
        branch_relax_rewrites,
        short_jump_fold_rewrites,
        loop_invariant_hoist_rewrites,
    }
}

fn loop_invariant_stats_enabled() -> bool {
    std::env::var("BACKEND_LOOP_INV_STATS")
        .map(|v| v != "0")
        .unwrap_or(false)
}

fn loop_invariant_detail_limit() -> usize {
    std::env::var("BACKEND_LOOP_INV_DETAIL_LIMIT")
        .ok()
        .and_then(|v| v.parse::<usize>().ok())
        .unwrap_or(8)
}

fn format_instruction_line(inst: &Instruction) -> String {
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

#[derive(Debug, Default, Clone)]
struct LoopInvariantLoopDetail {
    header_idx: usize,
    node_count: usize,
    s_count: usize,
    invariant_defs: usize,
    header_inst: String,
    s_sample: Vec<String>,
}

#[derive(Debug, Default, Clone)]
struct LoopInvariantStats {
    indeg2_headers: usize,
    qualified_loops: usize,
    skipped_no_backedge: usize,
    skipped_noncanonical_split: usize,
    total_loop_nodes: usize,
    loops_with_nonempty_s: usize,
    total_s_regs: usize,
    unique_s_regs: BTreeSet<String>,
    unique_s_virtual_regs: BTreeSet<String>,
    invariant_reg_occurrences: usize,
    unique_invariant_def_sites: BTreeSet<usize>,
    s_regs_without_loop_def: usize,
    s_regs_multiple_loop_defs: usize,
    invariant_def_mnemonic_hist: BTreeMap<String, usize>,
    details: Vec<LoopInvariantLoopDetail>,
}

fn forward_reachable_from_header(
    header_idx: usize,
    analyzed: &[analysis::AnalyzedInstruction],
) -> HashSet<usize> {
    let n = analyzed.len();
    let mut vis: HashSet<usize> = HashSet::new();
    let mut wl: Vec<usize> = vec![header_idx];
    while let Some(cur) = wl.pop() {
        if cur >= n || !vis.insert(cur) {
            continue;
        }
        for &to in &analyzed[cur].succ {
            if to >= header_idx && to < n && !vis.contains(&to) {
                wl.push(to);
            }
        }
    }
    vis
}

fn reverse_reachable_to_backedge_tail(
    header_idx: usize,
    tail_idx: usize,
    preds: &[Vec<usize>],
) -> HashSet<usize> {
    let mut vis: HashSet<usize> = HashSet::new();
    let mut wl: Vec<usize> = vec![tail_idx];
    vis.insert(header_idx);
    while let Some(cur) = wl.pop() {
        if !vis.insert(cur) {
            continue;
        }
        for &p in &preds[cur] {
            if p != header_idx && p >= header_idx && !vis.contains(&p) {
                wl.push(p);
            }
        }
    }
    vis
}

fn collect_loop_invariant_stats(
    instructions: &[Instruction],
    analyzed: &[analysis::AnalyzedInstruction],
) -> LoopInvariantStats {
    let mut stats = LoopInvariantStats::default();
    let n = analyzed.len();
    if n == 0 {
        return stats;
    }

    let mut preds: Vec<Vec<usize>> = vec![Vec::new(); n];
    for (idx, ai) in analyzed.iter().enumerate() {
        for &to in &ai.succ {
            if to >= n {
                continue;
            }
            preds[to].push(idx);
        }
    }

    let mut def_sites: HashMap<String, Vec<usize>> = HashMap::new();
    for (idx, ai) in analyzed.iter().enumerate() {
        for d in &ai.defs {
            def_sites.entry(d.clone()).or_default().push(idx);
        }
    }

    for header_idx in 0..n {
        if preds[header_idx].len() != 2 {
            continue;
        }
        stats.indeg2_headers += 1;

        let mut back_preds: Vec<usize> = Vec::new();
        let mut preheader_preds: Vec<usize> = Vec::new();
        for &p in &preds[header_idx] {
            if p >= header_idx {
                back_preds.push(p);
            } else {
                preheader_preds.push(p);
            }
        }
        if back_preds.is_empty() {
            stats.skipped_no_backedge += 1;
            continue;
        }
        if back_preds.len() != 1 || preheader_preds.len() != 1 {
            stats.skipped_noncanonical_split += 1;
            continue;
        }
        let tail_idx = back_preds[0];

        let fwd = forward_reachable_from_header(header_idx, analyzed);
        let rev = reverse_reachable_to_backedge_tail(header_idx, tail_idx, &preds);
        let mut loop_nodes: Vec<usize> = fwd.intersection(&rev).copied().collect();
        loop_nodes.sort_unstable();
        if loop_nodes.len() <= 1 {
            continue;
        }
        let loop_set: HashSet<usize> = loop_nodes.iter().copied().collect();

        stats.qualified_loops += 1;
        stats.total_loop_nodes += loop_nodes.len();

        let mut def_count_in_loop: HashMap<String, usize> = HashMap::new();
        let mut unique_def_idx_in_loop: HashMap<String, usize> = HashMap::new();
        let mut always_live: Option<BTreeSet<String>> = None;
        for &idx in &loop_nodes {
            for d in &analyzed[idx].defs {
                let cnt = def_count_in_loop.entry(d.clone()).or_insert(0);
                *cnt += 1;
                if *cnt == 1 {
                    unique_def_idx_in_loop.insert(d.clone(), idx);
                } else {
                    unique_def_idx_in_loop.remove(d);
                }
            }
            if let Some(cur) = &mut always_live {
                cur.retain(|r| analyzed[idx].live_in.contains(r));
            } else {
                always_live = Some(analyzed[idx].live_in.clone());
            }
        }

        // S: loop全域でliveかつ loop内単一定義で、定義式が不変になるものを fixed-point で抽出。
        let always_live = always_live.unwrap_or_default();
        let mut candidates: BTreeSet<String> = BTreeSet::new();
        for r in &always_live {
            match def_count_in_loop.get(r).copied().unwrap_or(0) {
                0 => stats.s_regs_without_loop_def += 1,
                1 => {
                    candidates.insert(r.clone());
                }
                _ => stats.s_regs_multiple_loop_defs += 1,
            }
        }

        let mut s_set: BTreeSet<String> = BTreeSet::new();
        let mut changed = true;
        while changed {
            changed = false;
            for r in &candidates {
                if s_set.contains(r) {
                    continue;
                }
                let Some(&didx) = unique_def_idx_in_loop.get(r) else {
                    continue;
                };
                let inst = &instructions[didx];
                let Some(m) = inst.mnemonic.as_deref() else {
                    continue;
                };
                if !is_licm_pure_mnemonic(m) {
                    continue;
                }
                let ai = &analyzed[didx];
                if ai.defs.len() != 1 || !ai.defs.contains(r) {
                    continue;
                }

                // useが loop外定義、または既にSに入った不変値なら可。
                let uses_ok = ai.uses.iter().all(|u| {
                    let loop_defs = def_count_in_loop.get(u).copied().unwrap_or(0);
                    if loop_defs == 0 {
                        return true;
                    }
                    s_set.contains(u)
                });
                if uses_ok {
                    s_set.insert(r.clone());
                    changed = true;
                }
            }
        }

        if !s_set.is_empty() {
            stats.loops_with_nonempty_s += 1;
        }
        stats.total_s_regs += s_set.len();

        let mut invariant_defs = 0usize;
        for r in &s_set {
            stats.unique_s_regs.insert(r.clone());
            if is_virtual_any_reg(r) {
                stats.unique_s_virtual_regs.insert(r.clone());
            }
            let Some(defs) = def_sites.get(r) else {
                continue;
            };
            let mut defs_in_loop: Vec<usize> = defs
                .iter()
                .copied()
                .filter(|idx| loop_set.contains(idx))
                .collect();
            defs_in_loop.sort_unstable();
            defs_in_loop.dedup();
            if defs_in_loop.len() == 1 {
                let didx = defs_in_loop[0];
                stats.invariant_reg_occurrences += 1;
                stats.unique_invariant_def_sites.insert(didx);
                invariant_defs += 1;
                let mnem = instructions
                    .get(didx)
                    .and_then(|i| i.mnemonic.clone())
                    .unwrap_or_else(|| "<none>".to_string());
                *stats.invariant_def_mnemonic_hist.entry(mnem).or_insert(0) += 1;
            } else {
                // Sには単一定義のみ入る想定だが、安全側で計上しておく。
                if defs_in_loop.is_empty() {
                    stats.s_regs_without_loop_def += 1;
                } else {
                    stats.s_regs_multiple_loop_defs += 1;
                }
            }
        }

        let mut s_sample: Vec<String> = s_set.iter().cloned().collect();
        s_sample.sort();
        if s_sample.len() > 8 {
            s_sample.truncate(8);
        }
        let header_inst = analyzed
            .get(header_idx)
            .map(|x| format_instruction_line(&x.instruction))
            .unwrap_or_else(|| "<unknown>".to_string());
        stats.details.push(LoopInvariantLoopDetail {
            header_idx,
            node_count: loop_nodes.len(),
            s_count: s_set.len(),
            invariant_defs,
            header_inst,
            s_sample,
        });
    }

    stats
}

pub fn print_loop_invariant_stats(
    instructions: &[Instruction],
    analyzed: &[analysis::AnalyzedInstruction],
) {
    if !loop_invariant_stats_enabled() {
        return;
    }
    let stats = collect_loop_invariant_stats(instructions, analyzed);
    println!(
        "LoopInvariant stats: indeg2_headers={} qualified_loops={} skipped_no_backedge={} skipped_noncanonical_split={} total_loop_nodes={} loops_with_nonempty_S={} total_S_regs={} unique_S_regs={} unique_S_virtual={} invariant_reg_occurrences={} unique_invariant_def_sites={} S_without_loop_def={} S_multi_loop_defs={}",
        stats.indeg2_headers,
        stats.qualified_loops,
        stats.skipped_no_backedge,
        stats.skipped_noncanonical_split,
        stats.total_loop_nodes,
        stats.loops_with_nonempty_s,
        stats.total_s_regs,
        stats.unique_s_regs.len(),
        stats.unique_s_virtual_regs.len(),
        stats.invariant_reg_occurrences,
        stats.unique_invariant_def_sites.len(),
        stats.s_regs_without_loop_def,
        stats.s_regs_multiple_loop_defs
    );

    let mut hist: Vec<(String, usize)> = stats.invariant_def_mnemonic_hist.into_iter().collect();
    hist.sort_by(|a, b| b.1.cmp(&a.1).then_with(|| a.0.cmp(&b.0)));
    if !hist.is_empty() {
        println!("  invariant_def_mnemonic_top:");
        for (mnem, cnt) in hist.into_iter().take(12) {
            println!("    {}: {}", mnem, cnt);
        }
    }

    let limit = loop_invariant_detail_limit();
    for (i, d) in stats.details.iter().take(limit).enumerate() {
        println!(
            "  loop#{} header={} nodes={} S={} inv_defs={} header_inst=\"{}\"",
            i + 1,
            d.header_idx,
            d.node_count,
            d.s_count,
            d.invariant_defs,
            d.header_inst
        );
        if !d.s_sample.is_empty() {
            println!("    S_sample={:?}", d.s_sample);
        }
    }
}

fn loop_invariant_hoist_enabled() -> bool {
    std::env::var("BACKEND_LOOP_INV_HOIST")
        .map(|v| v != "0")
        .unwrap_or(true)
}

fn is_licm_pure_mnemonic(m: &str) -> bool {
    matches!(
        m,
        "mov"
            | "fmov"
            | "neg"
            | "fneg"
            | "finv"
            | "frsqrt"
            | "ffloor"
            | "fabs"
            | "add"
            | "sub"
            | "sll"
            | "sar"
            | "or"
            | "xor"
            | "ceq"
            | "cleq"
            | "clt"
            | "feq"
            | "fneq"
            | "fleq"
            | "flt"
            | "fadd"
            | "fsub"
            | "fmul"
            | "fdiv"
            | "fma"
            | "addi"
            | "subi"
            | "slli"
            | "sari"
            | "ori"
            | "xori"
            | "ceqi"
            | "cleqi"
            | "clti"
            | "movi"
            | "movui"
            | "mif"
            | "ftoi"
            | "itof"
            | "tern"
            | "ftern"
    )
}

#[derive(Debug, Clone)]
struct LoopForHoist {
    header_idx: usize,
    nodes: Vec<usize>,
}

fn detect_loops_for_hoist(analyzed: &[analysis::AnalyzedInstruction]) -> Vec<LoopForHoist> {
    let n = analyzed.len();
    let mut preds: Vec<Vec<usize>> = vec![Vec::new(); n];
    for (idx, ai) in analyzed.iter().enumerate() {
        for &to in &ai.succ {
            if to < n {
                preds[to].push(idx);
            }
        }
    }

    let mut loops = Vec::new();
    for header_idx in 0..n {
        if preds[header_idx].len() != 2 {
            continue;
        }
        let mut back_preds: Vec<usize> = Vec::new();
        let mut preheader_preds: Vec<usize> = Vec::new();
        for &p in &preds[header_idx] {
            if p >= header_idx {
                back_preds.push(p);
            } else {
                preheader_preds.push(p);
            }
        }
        if back_preds.len() != 1 || preheader_preds.len() != 1 {
            continue;
        }
        let pre = preheader_preds[0];
        // Hoist先を header 直前へ置くため、entry edge は fall-through のみ扱う。
        if pre + 1 != header_idx {
            continue;
        }
        let tail_idx = back_preds[0];
        let fwd = forward_reachable_from_header(header_idx, analyzed);
        let rev = reverse_reachable_to_backedge_tail(header_idx, tail_idx, &preds);
        let mut loop_nodes: Vec<usize> = fwd.intersection(&rev).copied().collect();
        loop_nodes.sort_unstable();
        if loop_nodes.len() <= 1 {
            continue;
        }
        loops.push(LoopForHoist {
            header_idx,
            nodes: loop_nodes,
        });
    }
    loops
}

fn hoist_loop_invariants_opt(mut instructions: Vec<Instruction>) -> (Vec<Instruction>, usize) {
    if !loop_invariant_hoist_enabled() {
        return (instructions, 0);
    }
    let analyzed = analysis::analyze(&instructions);
    let loops = detect_loops_for_hoist(&analyzed);
    if loops.is_empty() {
        return (instructions, 0);
    }

    let mut membership_count: HashMap<usize, usize> = HashMap::new();
    for lp in &loops {
        for &idx in &lp.nodes {
            *membership_count.entry(idx).or_insert(0) += 1;
        }
    }

    let mut insertion_map: BTreeMap<usize, Vec<Instruction>> = BTreeMap::new();
    let mut moved_global: HashSet<usize> = HashSet::new();
    let mut rewrites = 0usize;

    // 高いheaderから処理して、複数loopでの競合を減らす。
    let mut loops_sorted = loops;
    loops_sorted.sort_by(|a, b| b.header_idx.cmp(&a.header_idx));

    for lp in loops_sorted {
        let loop_set: HashSet<usize> = lp.nodes.iter().copied().collect();
        let mut def_count_in_loop: HashMap<String, usize> = HashMap::new();
        for &idx in &lp.nodes {
            for d in &analyzed[idx].defs {
                *def_count_in_loop.entry(d.clone()).or_insert(0) += 1;
            }
        }

        // 初期不変集合: headerでlive-in かつ loop内で定義されないもの。
        let mut invariant_regs: HashSet<String> = analyzed[lp.header_idx]
            .live_in
            .iter()
            .filter(|r| def_count_in_loop.get(*r).copied().unwrap_or(0) == 0)
            .cloned()
            .collect();
        invariant_regs.insert("%i0".to_string());
        invariant_regs.insert("%f0".to_string());

        let mut selected: Vec<usize> = Vec::new();
        let mut selected_set: HashSet<usize> = HashSet::new();
        let mut changed = true;
        while changed {
            changed = false;
            for &idx in &lp.nodes {
                if idx == lp.header_idx
                    || selected_set.contains(&idx)
                    || moved_global.contains(&idx)
                    || membership_count.get(&idx).copied().unwrap_or(0) > 1
                {
                    continue;
                }
                let inst = &instructions[idx];
                if inst.label.is_some() {
                    continue;
                }
                let Some(m) = inst.mnemonic.as_deref() else {
                    continue;
                };
                if !is_licm_pure_mnemonic(m) {
                    continue;
                }
                let ai = &analyzed[idx];
                if ai.defs.len() != 1 {
                    continue;
                }
                let rd = ai.defs.iter().next().unwrap();
                if matches!(
                    rd.as_str(),
                    "%i0" | "%i1" | "%i2" | "%i3" | "%i30" | "%i31" | "%f0" | "%f30" | "%f31"
                ) {
                    continue;
                }
                if def_count_in_loop.get(rd).copied().unwrap_or(0) != 1 {
                    continue;
                }
                let uses_ok = ai.uses.iter().all(|u| {
                    invariant_regs.contains(u)
                        || def_count_in_loop.get(u).copied().unwrap_or(0) == 0
                });
                if !uses_ok {
                    continue;
                }
                selected_set.insert(idx);
                selected.push(idx);
                invariant_regs.insert(rd.clone());
                changed = true;
            }
        }

        if selected.is_empty() {
            continue;
        }
        selected.sort_unstable();
        let mut hoisted = Vec::new();
        for idx in selected {
            if !loop_set.contains(&idx) || !moved_global.insert(idx) {
                continue;
            }
            hoisted.push(instructions[idx].clone());
            instructions[idx].mnemonic = Some("nop".to_string());
            instructions[idx].operands.clear();
            rewrites += 1;
        }
        if !hoisted.is_empty() {
            insertion_map.entry(lp.header_idx).or_default().extend(hoisted);
        }
    }

    if rewrites == 0 {
        return (instructions, 0);
    }

    let mut out = Vec::with_capacity(instructions.len() + rewrites);
    for (idx, inst) in instructions.into_iter().enumerate() {
        if let Some(hoisted) = insertion_map.get(&idx) {
            out.extend(hoisted.iter().cloned());
        }
        out.push(inst);
    }
    (out, rewrites)
}

fn compute_non_fallthrough_entry_points(instructions: &[Instruction]) -> Vec<bool> {
    let analyzed = analysis::analyze(instructions);
    let n = analyzed.len();
    let mut preds: Vec<Vec<usize>> = vec![Vec::new(); n];
    for (i, ai) in analyzed.iter().enumerate() {
        for &s in &ai.succ {
            if s < n {
                preds[s].push(i);
            }
        }
    }
    let mut reset = vec![false; n];
    for i in 0..n {
        if i == 0 {
            reset[i] = true;
            continue;
        }
        let ps = &preds[i];
        // Entering a point without plain fall-through predecessor means
        // control may arrive from elsewhere (jump/call target), so alias/const
        // facts from linear scan are not guaranteed.
        let has_prev_fallthrough = ps.iter().any(|&p| p + 1 == i);
        let has_non_fallthrough_pred = ps.iter().any(|&p| p + 1 != i);
        if !has_prev_fallthrough || has_non_fallthrough_pred {
            reset[i] = true;
        }
    }
    reset
}

fn is_float_reg(reg: &str) -> bool {
    let Some(rest) = reg.strip_prefix("%f") else {
        return false;
    };
    !rest.is_empty() && rest.chars().all(|c| c.is_ascii_digit())
}

fn is_virtual_int_reg(reg: &str) -> bool {
    let Some(rest) = reg.strip_prefix("%vi") else {
        return false;
    };
    !rest.is_empty() && rest.chars().all(|c| c.is_ascii_digit())
}

fn is_virtual_float_reg(reg: &str) -> bool {
    let Some(rest) = reg.strip_prefix("%vf") else {
        return false;
    };
    !rest.is_empty() && rest.chars().all(|c| c.is_ascii_digit())
}

fn is_virtual_any_reg(reg: &str) -> bool {
    is_virtual_int_reg(reg) || is_virtual_float_reg(reg)
}

fn float_reg_index(reg: &str) -> Option<usize> {
    let rest = reg.strip_prefix("%f")?;
    rest.parse::<usize>().ok()
}

fn is_forbidden_reg(reg: &str) -> bool {
    matches!(reg, "%i0" | "%i1" | "%i2" | "%i3" | "%f0")
}

fn is_trackable_int_reg(reg: &str) -> bool {
    if is_virtual_int_reg(reg) {
        return true;
    }
    int_reg_index(reg).is_some_and(|i| i >= 4)
}

fn is_trackable_float_reg(reg: &str) -> bool {
    if is_virtual_float_reg(reg) {
        return true;
    }
    float_reg_index(reg).is_some_and(|i| i >= 1)
}

fn is_trackable_any_reg(reg: &str) -> bool {
    is_trackable_int_reg(reg) || is_trackable_float_reg(reg)
}

fn is_physical_reg(reg: &str) -> bool {
    is_int_reg(reg) || is_float_reg(reg)
}

fn parse_phys_reg_index(reg: &str, prefix: &str) -> Option<usize> {
    let rest = reg.strip_prefix(prefix)?;
    if rest.is_empty() || !rest.chars().all(|c| c.is_ascii_digit()) {
        return None;
    }
    rest.parse::<usize>().ok()
}

fn call_arg_bit(reg: &str) -> Option<u32> {
    if let Some(i) = parse_phys_reg_index(reg, "%i") {
        if (4..=15).contains(&i) {
            return Some((i - 4) as u32); // 0..11
        }
    }
    if let Some(i) = parse_phys_reg_index(reg, "%f") {
        if (1..=15).contains(&i) {
            return Some((12 + (i - 1)) as u32); // 12..26
        }
    }
    None
}

fn inst_is_call_like(inst: &Instruction) -> bool {
    match inst.mnemonic.as_deref() {
        Some("call_dir") | Some("call_cls") => true,
        Some("jmp") => inst
            .operands
            .first()
            .map(|r| r == "%i3")
            .unwrap_or(false),
        _ => false,
    }
}

fn compute_call_arg_live_out_bits(analyzed: &[analysis::AnalyzedInstruction]) -> Vec<u64> {
    let n = analyzed.len();
    let mut live_in = vec![0u64; n];
    let mut live_out = vec![0u64; n];

    // defs limited to call-arg regs only.
    let mut def_bits = vec![0u64; n];
    for (i, ai) in analyzed.iter().enumerate() {
        let mut bits = 0u64;
        for d in &ai.defs {
            if let Some(b) = call_arg_bit(d) {
                bits |= 1u64 << b;
            }
        }
        def_bits[i] = bits;
    }

    // use set: at each call-like instruction, all call-arg regs are used.
    const CALL_ARG_ALL_BITS: u64 = (1u64 << 27) - 1;
    let mut use_bits = vec![0u64; n];
    for (i, ai) in analyzed.iter().enumerate() {
        if inst_is_call_like(&ai.instruction) {
            use_bits[i] = CALL_ARG_ALL_BITS;
        }
    }

    let mut changed = true;
    while changed {
        changed = false;
        for i in (0..n).rev() {
            let mut out = 0u64;
            for &s in &analyzed[i].succ {
                if s < n {
                    out |= live_in[s];
                }
            }
            let new_in = use_bits[i] | (out & !def_bits[i]);
            if out != live_out[i] || new_in != live_in[i] {
                live_out[i] = out;
                live_in[i] = new_in;
                changed = true;
            }
        }
    }

    live_out
}

fn is_side_effecting_or_control_mnemonic(mnemonic: &str) -> bool {
    matches!(
        mnemonic,
        "sw" | "sf" | "sb" | "jzero" | "jeq" | "jlt" | "jleq" | "jmp" | "ret" | "call_dir"
            | "call_cls" | "set_label"
    ) || mnemonic.starts_with('.')
}

#[derive(Debug, Clone, Hash, PartialEq, Eq)]
enum CseExpr {
    IntConst(String, String),
    IntUnary(String, String),
    IntBinary(String, String, String),
    IntImm(String, String, String),
    IntLoad(String, i32, String),
    IntTern(String, String, String),
    IntFromFloat(String, String),

    FloatUnary(String, String),
    FloatBinary(String, String, String),
    FloatTri(String, String, String, String),
    FloatLoad(i32, String),
    FloatFromInt(String, String),
    FloatTern(String, String, String),
}

fn parse_mem_operand(op: &str) -> Option<(i32, String)> {
    let start = op.find('(')?;
    let end = op.find(')')?;
    if end <= start + 1 {
        return None;
    }
    let off_str = op[..start].trim();
    let base = op[start + 1..end].trim().to_string();
    if !is_int_reg(&base) {
        return None;
    }
    let off = if off_str.is_empty() {
        0
    } else {
        off_str.parse::<i32>().ok()?
    };
    Some((off, base))
}

fn is_mem_table_base(base: &str) -> bool {
    matches!(base, "%i1" | "%i2")
}

fn normalize_commutative_pair(a: &str, b: &str) -> (String, String) {
    if a <= b {
        (a.to_string(), b.to_string())
    } else {
        (b.to_string(), a.to_string())
    }
}

fn cse_expr_is_float_result(expr: &CseExpr) -> bool {
    matches!(
        expr,
        CseExpr::FloatUnary(_, _)
            | CseExpr::FloatBinary(_, _, _)
            | CseExpr::FloatTri(_, _, _, _)
            | CseExpr::FloatLoad(_, _)
            | CseExpr::FloatFromInt(_, _)
            | CseExpr::FloatTern(_, _, _)
    )
}

fn cse_expr_is_memory(expr: &CseExpr) -> bool {
    matches!(
        expr,
        CseExpr::IntLoad(_, _, _) | CseExpr::FloatLoad(_, _)
    )
}

fn cse_expr_mem_loc(expr: &CseExpr) -> Option<(&str, i32)> {
    match expr {
        CseExpr::IntLoad(_, off, base) => Some((base.as_str(), *off)),
        CseExpr::FloatLoad(off, base) => Some((base.as_str(), *off)),
        _ => None,
    }
}

fn cse_expr_uses_reg(expr: &CseExpr, reg: &str) -> bool {
    match expr {
        CseExpr::IntConst(_, _) => false,
        CseExpr::IntUnary(_, a) => a == reg,
        CseExpr::IntBinary(_, a, b) => a == reg || b == reg,
        CseExpr::IntImm(_, a, _) => a == reg,
        CseExpr::IntLoad(_, _, base) => base == reg,
        CseExpr::IntTern(c, t, e) => c == reg || t == reg || e == reg,
        CseExpr::IntFromFloat(_, a) => a == reg,

        CseExpr::FloatUnary(_, a) => a == reg,
        CseExpr::FloatBinary(_, a, b) => a == reg || b == reg,
        CseExpr::FloatTri(_, a, b, c) => a == reg || b == reg || c == reg,
        CseExpr::FloatLoad(_, base) => base == reg,
        CseExpr::FloatFromInt(_, a) => a == reg,
        CseExpr::FloatTern(c, t, e) => c == reg || t == reg || e == reg,
    }
}

fn build_cse_expr_with_mode(
    inst: &Instruction,
    tracked_mem_base_int: Option<&str>,
    tracked_mem_base_float: Option<&str>,
    virtual_only: bool,
) -> Option<CseExpr> {
    let m = inst.mnemonic.as_deref()?;
    let ops = &inst.operands;
    if ops.is_empty() || !mnemonic_defines_first_operand(m, &ops[0]) {
        return None;
    }
    let int_ok = |r: &str| {
        if virtual_only {
            is_trackable_int_reg(r)
        } else {
            is_int_reg(r)
        }
    };
    let float_ok = |r: &str| {
        if virtual_only {
            is_trackable_float_reg(r)
        } else {
            is_float_reg(r)
        }
    };
    match m {
        "movi" | "movui" if ops.len() == 2 => {
            Some(CseExpr::IntConst(m.to_string(), ops[1].clone()))
        }
        "mov" if ops.len() == 2 && int_ok(&ops[1]) => {
            Some(CseExpr::IntUnary("mov".to_string(), ops[1].clone()))
        }
        "neg" if ops.len() == 2 && int_ok(&ops[1]) => {
            Some(CseExpr::IntUnary("neg".to_string(), ops[1].clone()))
        }
        "add" | "or" | "xor" | "ceq" if ops.len() == 3 && int_ok(&ops[1]) && int_ok(&ops[2]) => {
            let (a, b) = normalize_commutative_pair(&ops[1], &ops[2]);
            Some(CseExpr::IntBinary(m.to_string(), a, b))
        }
        "sub" | "sll" | "sar" | "cleq" | "clt" if ops.len() == 3 && int_ok(&ops[1]) && int_ok(&ops[2]) => {
            Some(CseExpr::IntBinary(m.to_string(), ops[1].clone(), ops[2].clone()))
        }
        "addi" | "subi" | "slli" | "sari" | "ori" | "xori" | "ceqi" | "cleqi" | "clti"
            if ops.len() == 3 && int_ok(&ops[1]) =>
        {
            Some(CseExpr::IntImm(
                m.to_string(),
                ops[1].clone(),
                ops[2].clone(),
            ))
        }
        "ftoi" if ops.len() == 2 && float_ok(&ops[1]) => {
            Some(CseExpr::IntFromFloat("ftoi".to_string(), ops[1].clone()))
        }
        "tern" if ops.len() == 4 && int_ok(&ops[1]) && int_ok(&ops[2]) && int_ok(&ops[3]) => {
            Some(CseExpr::IntTern(
                ops[1].clone(),
                ops[2].clone(),
                ops[3].clone(),
            ))
        }
        "lw" | "lb" if ops.len() == 2 => {
            let (off, base) = parse_mem_operand(&ops[1])?;
            if !is_mem_table_base(&base) {
                return None;
            }
            if tracked_mem_base_int.map(|b| b == base).unwrap_or(true) {
                Some(CseExpr::IntLoad(m.to_string(), off, base))
            } else {
                None
            }
        }

        "fmov" if ops.len() == 2 && float_ok(&ops[1]) => {
            Some(CseExpr::FloatUnary("fmov".to_string(), ops[1].clone()))
        }
        "fneg" | "finv" | "frsqrt" | "ffloor" | "fabs"
            if ops.len() == 2 && float_ok(&ops[1]) =>
        {
            Some(CseExpr::FloatUnary(m.to_string(), ops[1].clone()))
        }
        "fadd" | "fmul" | "feq" | "fneq" if ops.len() == 3 && float_ok(&ops[1]) && float_ok(&ops[2]) => {
            let (a, b) = normalize_commutative_pair(&ops[1], &ops[2]);
            Some(CseExpr::FloatBinary(m.to_string(), a, b))
        }
        "fsub" | "fdiv" | "fleq" | "flt" if ops.len() == 3 && float_ok(&ops[1]) && float_ok(&ops[2]) => {
            Some(CseExpr::FloatBinary(
                m.to_string(),
                ops[1].clone(),
                ops[2].clone(),
            ))
        }
        "fma" if ops.len() == 4 && float_ok(&ops[1]) && float_ok(&ops[2]) && float_ok(&ops[3]) => {
            Some(CseExpr::FloatTri(
                "fma".to_string(),
                ops[1].clone(),
                ops[2].clone(),
                ops[3].clone(),
            ))
        }
        "lf" if ops.len() == 2 => {
            let (off, base) = parse_mem_operand(&ops[1])?;
            if !is_mem_table_base(&base) {
                return None;
            }
            if tracked_mem_base_float.map(|b| b == base).unwrap_or(true) {
                Some(CseExpr::FloatLoad(off, base))
            } else {
                None
            }
        }
        "itof" | "mif" if ops.len() == 2 && int_ok(&ops[1]) => {
            Some(CseExpr::FloatFromInt(m.to_string(), ops[1].clone()))
        }
        "ftern" if ops.len() == 4 && int_ok(&ops[1]) && float_ok(&ops[2]) && float_ok(&ops[3]) => {
            Some(CseExpr::FloatTern(
                ops[1].clone(),
                ops[2].clone(),
                ops[3].clone(),
            ))
        }
        _ => None,
    }
}

fn remove_expr_key(
    key: &CseExpr,
    expr_to_reg: &mut HashMap<CseExpr, String>,
    reg_to_expr: &mut HashMap<String, CseExpr>,
) {
    expr_to_reg.remove(key);
    let stale_regs: Vec<String> = reg_to_expr
        .iter()
        .filter_map(|(r, k)| if k == key { Some(r.clone()) } else { None })
        .collect();
    for r in stale_regs {
        reg_to_expr.remove(&r);
    }
}

fn clear_memory_exprs(
    expr_to_reg: &mut HashMap<CseExpr, String>,
    reg_to_expr: &mut HashMap<String, CseExpr>,
) {
    let keys: Vec<CseExpr> = expr_to_reg
        .keys()
        .filter(|k| cse_expr_is_memory(k))
        .cloned()
        .collect();
    for k in keys {
        remove_expr_key(&k, expr_to_reg, reg_to_expr);
    }
}

fn clear_int_memory_exprs(
    expr_to_reg: &mut HashMap<CseExpr, String>,
    reg_to_expr: &mut HashMap<String, CseExpr>,
) {
    let keys: Vec<CseExpr> = expr_to_reg
        .keys()
        .filter(|k| matches!(k, CseExpr::IntLoad(_, _, _)))
        .cloned()
        .collect();
    for k in keys {
        remove_expr_key(&k, expr_to_reg, reg_to_expr);
    }
}

fn clear_float_memory_exprs(
    expr_to_reg: &mut HashMap<CseExpr, String>,
    reg_to_expr: &mut HashMap<String, CseExpr>,
) {
    let keys: Vec<CseExpr> = expr_to_reg
        .keys()
        .filter(|k| matches!(k, CseExpr::FloatLoad(_, _)))
        .cloned()
        .collect();
    for k in keys {
        remove_expr_key(&k, expr_to_reg, reg_to_expr);
    }
}

fn invalidate_exprs_on_def(
    rd: &str,
    expr_to_reg: &mut HashMap<CseExpr, String>,
    reg_to_expr: &mut HashMap<String, CseExpr>,
) {
    if let Some(k) = reg_to_expr.remove(rd) {
        if expr_to_reg.get(&k).is_some_and(|r| r == rd) {
            expr_to_reg.remove(&k);
        }
    }
    let keys: Vec<CseExpr> = expr_to_reg
        .keys()
        .filter(|k| cse_expr_uses_reg(k, rd))
        .cloned()
        .collect();
    for k in keys {
        remove_expr_key(&k, expr_to_reg, reg_to_expr);
    }
}

fn define_physical_dest(inst: &Instruction) -> Option<String> {
    let m = inst.mnemonic.as_deref()?;
    let rd = inst.operands.first()?.clone();
    if !mnemonic_defines_first_operand(m, &rd) {
        return None;
    }
    if !is_physical_reg(&rd) {
        return None;
    }
    Some(rd)
}

fn define_cse_dest(inst: &Instruction, virtual_only: bool) -> Option<String> {
    let m = inst.mnemonic.as_deref()?;
    let rd = inst.operands.first()?.clone();
    if !mnemonic_defines_first_operand(m, &rd) {
        return None;
    }
    if virtual_only {
        if is_trackable_any_reg(&rd) && !is_forbidden_reg(&rd) {
            return Some(rd);
        }
        return None;
    }
    if !is_physical_reg(&rd) {
        return None;
    }
    Some(rd)
}

fn register_cse_opt_with_mode(instructions: Vec<Instruction>, virtual_only: bool) -> (Vec<Instruction>, usize) {
    let reset_points = compute_non_fallthrough_entry_points(&instructions);
    let mut out = Vec::with_capacity(instructions.len());
    let mut rewrites = 0usize;

    let mut expr_to_reg: HashMap<CseExpr, String> = HashMap::new();
    let mut reg_to_expr: HashMap<String, CseExpr> = HashMap::new();
    let mut tracked_mem_base_int: Option<String> = None;
    let mut tracked_mem_base_float: Option<String> = None;

    for (idx, mut inst) in instructions.into_iter().enumerate() {
        if inst.label.is_some() || reset_points.get(idx).copied().unwrap_or(false) {
            expr_to_reg.clear();
            reg_to_expr.clear();
            tracked_mem_base_int = None;
            tracked_mem_base_float = None;
        }

        if let Some(mnemonic) = inst.mnemonic.as_deref() {
            if (mnemonic == "sw" || mnemonic == "sb") && inst.operands.len() == 2 {
                if let Some((_, base)) = parse_mem_operand(&inst.operands[1]) {
                    if !is_mem_table_base(&base) {
                        clear_int_memory_exprs(&mut expr_to_reg, &mut reg_to_expr);
                        tracked_mem_base_int = None;
                    } else {
                        match tracked_mem_base_int.as_deref() {
                            None => tracked_mem_base_int = Some(base.clone()),
                            Some(cur) if cur != base => {
                                clear_int_memory_exprs(&mut expr_to_reg, &mut reg_to_expr);
                                tracked_mem_base_int = Some(base.clone());
                            }
                            _ => {}
                        }
                        clear_int_memory_exprs(&mut expr_to_reg, &mut reg_to_expr);
                    }
                } else {
                    clear_int_memory_exprs(&mut expr_to_reg, &mut reg_to_expr);
                    tracked_mem_base_int = None;
                }
            } else if mnemonic == "sf" && inst.operands.len() == 2 {
                if let Some((_, base)) = parse_mem_operand(&inst.operands[1]) {
                    if !is_mem_table_base(&base) {
                        clear_float_memory_exprs(&mut expr_to_reg, &mut reg_to_expr);
                        tracked_mem_base_float = None;
                    } else {
                        match tracked_mem_base_float.as_deref() {
                            None => tracked_mem_base_float = Some(base.clone()),
                            Some(cur) if cur != base => {
                                clear_float_memory_exprs(&mut expr_to_reg, &mut reg_to_expr);
                                tracked_mem_base_float = Some(base.clone());
                            }
                            _ => {}
                        }
                        clear_float_memory_exprs(&mut expr_to_reg, &mut reg_to_expr);
                    }
                } else {
                    clear_float_memory_exprs(&mut expr_to_reg, &mut reg_to_expr);
                    tracked_mem_base_float = None;
                }
            } else if (mnemonic == "lw" || mnemonic == "lb") && inst.operands.len() == 2 {
                if let Some((_, base)) = parse_mem_operand(&inst.operands[1]) {
                    if !is_mem_table_base(&base) {
                        clear_int_memory_exprs(&mut expr_to_reg, &mut reg_to_expr);
                        tracked_mem_base_int = None;
                    } else if tracked_mem_base_int.is_none() {
                        tracked_mem_base_int = Some(base);
                    }
                }
            } else if mnemonic == "lf" && inst.operands.len() == 2 {
                if let Some((_, base)) = parse_mem_operand(&inst.operands[1]) {
                    if !is_mem_table_base(&base) {
                        clear_float_memory_exprs(&mut expr_to_reg, &mut reg_to_expr);
                        tracked_mem_base_float = None;
                    } else if tracked_mem_base_float.is_none() {
                        tracked_mem_base_float = Some(base);
                    }
                }
            }
        }

        let cse_dest = define_cse_dest(&inst, virtual_only);
        let cse_expr = build_cse_expr_with_mode(
            &inst,
            tracked_mem_base_int.as_deref(),
            tracked_mem_base_float.as_deref(),
            virtual_only,
        );
        let mut drop_inst = false;
        let mut install_expr: Option<(String, CseExpr)> = None;

        if let (Some(rd), Some(expr)) = (cse_dest.clone(), cse_expr.clone()) {
            // Self-updating forms (e.g. `addi %rx, %rx, imm`, `lw %rx, off(%rx)`)
            // read old `rd` and then overwrite `rd`.
            // Without SSA renaming this key is version-unsafe, so skip CSE.
            if !cse_expr_uses_reg(&expr, &rd) {
                if let Some(prev_reg) = expr_to_reg.get(&expr).cloned() {
                    if prev_reg != rd {
                        inst.mnemonic = Some(if cse_expr_is_float_result(&expr) {
                            "fmov".to_string()
                        } else {
                            "mov".to_string()
                        });
                        inst.operands = vec![rd.clone(), prev_reg];
                        rewrites += 1;
                        install_expr = Some((rd, expr));
                    } else {
                        if cse_expr_is_memory(&expr) {
                            // Volatile-like loads are handled in dedicated pass.
                            install_expr = Some((rd, expr));
                        } else {
                            // Exact self-redefinition of already available expression.
                            // Remove the instruction.
                            rewrites += 1;
                            drop_inst = true;
                        }
                    }
                } else {
                    install_expr = Some((rd, expr));
                }
            }
        }

        if drop_inst {
            if let Some(lbl) = inst.label.clone() {
                out.push(Instruction {
                    label: Some(lbl),
                    mnemonic: None,
                    operands: vec![],
                });
            }
            continue;
        }

        if let Some(rd) = cse_dest {
            invalidate_exprs_on_def(&rd, &mut expr_to_reg, &mut reg_to_expr);
            if tracked_mem_base_int.as_deref().is_some_and(|b| b == rd) {
                clear_int_memory_exprs(&mut expr_to_reg, &mut reg_to_expr);
                tracked_mem_base_int = None;
            }
            if tracked_mem_base_float.as_deref().is_some_and(|b| b == rd) {
                clear_float_memory_exprs(&mut expr_to_reg, &mut reg_to_expr);
                tracked_mem_base_float = None;
            }
        }
        if let Some((rd, expr)) = install_expr {
            if !expr_to_reg.contains_key(&expr) {
                expr_to_reg.insert(expr.clone(), rd.clone());
            }
            reg_to_expr.insert(rd, expr);
        }

        if let Some(mnemonic) = inst.mnemonic.as_deref() {
            if is_trace_barrier(mnemonic) {
                expr_to_reg.clear();
                reg_to_expr.clear();
                tracked_mem_base_int = None;
                tracked_mem_base_float = None;
            }
        }

        out.push(inst);
    }

    (out, rewrites)
}

fn register_cse_opt(instructions: Vec<Instruction>) -> (Vec<Instruction>, usize) {
    register_cse_opt_with_mode(instructions, false)
}

fn register_cse_virtual_opt(instructions: Vec<Instruction>) -> (Vec<Instruction>, usize) {
    register_cse_opt_with_mode(instructions, true)
}

fn resolve_alias(alias: &HashMap<String, String>, reg: &str) -> String {
    let mut cur = reg.to_string();
    for _ in 0..64 {
        let Some(next) = alias.get(&cur) else {
            break;
        };
        if next == &cur {
            break;
        }
        cur = next.clone();
    }
    cur
}

fn invalidate_aliases(alias: &mut HashMap<String, String>, reg: &str) {
    alias.remove(reg);
    let mut to_reset: Vec<String> = Vec::new();
    for (k, v) in alias.iter() {
        if v == reg {
            to_reset.push(k.clone());
        }
    }
    for k in to_reset {
        alias.insert(k.clone(), k);
    }
}

fn rewrite_use_operand_alias(op: &str, alias: &HashMap<String, String>) -> Option<String> {
    if is_physical_reg(op) {
        let mapped = resolve_alias(alias, op);
        if mapped != op {
            return Some(mapped);
        }
        return None;
    }

    let Some(start) = op.find('(') else {
        return None;
    };
    let Some(end_rel) = op[start + 1..].find(')') else {
        return None;
    };
    let end = start + 1 + end_rel;
    let base = &op[start + 1..end];
    if !is_physical_reg(base) {
        return None;
    }
    let mapped_base = resolve_alias(alias, base);
    if mapped_base == base {
        return None;
    }
    let mut out = String::new();
    out.push_str(&op[..start + 1]);
    out.push_str(&mapped_base);
    out.push_str(&op[end..]);
    Some(out)
}

fn rewrite_uses_with_alias(mut inst: Instruction, int_alias: &HashMap<String, String>, float_alias: &HashMap<String, String>) -> (Instruction, usize) {
    let Some(mnemonic) = inst.mnemonic.as_deref() else {
        return (inst, 0);
    };
    let def_first = if inst.operands.is_empty() {
        false
    } else {
        mnemonic_defines_first_operand(mnemonic, &inst.operands[0])
    };
    let mut rewrites = 0usize;
    for (idx, op) in inst.operands.iter_mut().enumerate() {
        if idx == 0 && def_first {
            continue;
        }
        let old = op.clone();
        let rewritten = if is_int_reg(&old) || old.contains("%i") {
            rewrite_use_operand_alias(&old, int_alias)
        } else if is_float_reg(&old) || old.contains("%f") {
            rewrite_use_operand_alias(&old, float_alias)
        } else {
            None
        };
        if let Some(new_op) = rewritten {
            if new_op != old {
                *op = new_op;
                rewrites += 1;
            }
        }
    }
    (inst, rewrites)
}

fn reset_alias_state(
    int_alias: &mut HashMap<String, String>,
    float_alias: &mut HashMap<String, String>,
    int_def_time: &mut HashMap<String, usize>,
    float_def_time: &mut HashMap<String, usize>,
) {
    int_alias.clear();
    float_alias.clear();
    int_def_time.clear();
    float_def_time.clear();
    int_alias.insert("%i0".to_string(), "%i0".to_string());
    float_alias.insert("%f0".to_string(), "%f0".to_string());
    int_def_time.insert("%i0".to_string(), 0);
    float_def_time.insert("%f0".to_string(), 0);
}

fn normalize_mov_alias_uses_opt(instructions: Vec<Instruction>) -> (Vec<Instruction>, usize) {
    let reset_points = compute_non_fallthrough_entry_points(&instructions);
    let mut out = Vec::with_capacity(instructions.len());
    let mut rewrites = 0usize;

    let mut int_alias: HashMap<String, String> = HashMap::new();
    let mut float_alias: HashMap<String, String> = HashMap::new();
    let mut int_def_time: HashMap<String, usize> = HashMap::new();
    let mut float_def_time: HashMap<String, usize> = HashMap::new();
    reset_alias_state(
        &mut int_alias,
        &mut float_alias,
        &mut int_def_time,
        &mut float_def_time,
    );
    let mut tick: usize = 1;

    for (idx, inst) in instructions.into_iter().enumerate() {
        if inst.label.is_some() || reset_points.get(idx).copied().unwrap_or(false) {
            reset_alias_state(
                &mut int_alias,
                &mut float_alias,
                &mut int_def_time,
                &mut float_def_time,
            );
            tick = 1;
        }

        let (inst, r) = rewrite_uses_with_alias(inst, &int_alias, &float_alias);
        rewrites += r;

        if let Some(mnemonic) = inst.mnemonic.as_deref() {
            let def_first = if inst.operands.is_empty() {
                false
            } else {
                mnemonic_defines_first_operand(mnemonic, &inst.operands[0])
            };

            let def_reg = if def_first && !inst.operands.is_empty() {
                Some(inst.operands[0].clone())
            } else {
                None
            };
            if let Some(rd) = def_reg {
                if is_int_reg(&rd) {
                    invalidate_aliases(&mut int_alias, &rd);
                    int_alias.insert(rd.clone(), rd.clone());
                    int_def_time.insert(rd.clone(), tick);
                } else if is_float_reg(&rd) {
                    invalidate_aliases(&mut float_alias, &rd);
                    float_alias.insert(rd.clone(), rd.clone());
                    float_def_time.insert(rd.clone(), tick);
                }
            }

            if (mnemonic == "mov" || mnemonic == "fmov") && inst.operands.len() == 2 {
                let rd = inst.operands[0].clone();
                let rs = inst.operands[1].clone();
                if mnemonic == "mov" && is_int_reg(&rd) && is_int_reg(&rs) {
                    let src_canon = resolve_alias(&int_alias, &rs);
                    let src_t = int_def_time.get(&src_canon).copied().unwrap_or(usize::MAX);
                    let rs_t = int_def_time.get(&rs).copied().unwrap_or(src_t);
                    let canon = if src_t <= rs_t { src_canon } else { rs };
                    int_alias.insert(rd.clone(), canon.clone());
                    if let Some(t) = int_def_time.get(&canon).copied() {
                        int_def_time.insert(rd, t);
                    }
                } else if mnemonic == "fmov" && is_float_reg(&rd) && is_float_reg(&rs) {
                    let src_canon = resolve_alias(&float_alias, &rs);
                    let src_t = float_def_time.get(&src_canon).copied().unwrap_or(usize::MAX);
                    let rs_t = float_def_time.get(&rs).copied().unwrap_or(src_t);
                    let canon = if src_t <= rs_t { src_canon } else { rs };
                    float_alias.insert(rd.clone(), canon.clone());
                    if let Some(t) = float_def_time.get(&canon).copied() {
                        float_def_time.insert(rd, t);
                    }
                }
            }

            if is_trace_barrier(mnemonic) {
                reset_alias_state(
                    &mut int_alias,
                    &mut float_alias,
                    &mut int_def_time,
                    &mut float_def_time,
                );
                tick = 1;
            } else {
                tick = tick.saturating_add(1);
            }
        }
        out.push(inst);
    }

    (out, rewrites)
}

fn rewrite_use_operand_alias_virtual(op: &str, alias: &HashMap<String, String>) -> Option<String> {
    if is_trackable_any_reg(op) && !is_forbidden_reg(op) {
        let mapped = resolve_alias(alias, op);
        if mapped != op {
            return Some(mapped);
        }
        return None;
    }
    let Some(start) = op.find('(') else {
        return None;
    };
    let Some(end_rel) = op[start + 1..].find(')') else {
        return None;
    };
    let end = start + 1 + end_rel;
    let base = &op[start + 1..end];
    if !(is_trackable_int_reg(base) && !is_forbidden_reg(base)) {
        return None;
    }
    let mapped_base = resolve_alias(alias, base);
    if mapped_base == base {
        return None;
    }
    let mut out = String::new();
    out.push_str(&op[..start + 1]);
    out.push_str(&mapped_base);
    out.push_str(&op[end..]);
    Some(out)
}

fn normalize_mov_alias_uses_virtual_opt(instructions: Vec<Instruction>) -> (Vec<Instruction>, usize) {
    let reset_points = compute_non_fallthrough_entry_points(&instructions);
    let mut out = Vec::with_capacity(instructions.len());
    let mut rewrites = 0usize;

    let mut int_alias: HashMap<String, String> = HashMap::new();
    let mut float_alias: HashMap<String, String> = HashMap::new();
    let mut int_def_time: HashMap<String, usize> = HashMap::new();
    let mut float_def_time: HashMap<String, usize> = HashMap::new();
    let mut tick: usize = 1;

    for (idx, mut inst) in instructions.into_iter().enumerate() {
        if inst.label.is_some() || reset_points.get(idx).copied().unwrap_or(false) {
            int_alias.clear();
            float_alias.clear();
            int_def_time.clear();
            float_def_time.clear();
            tick = 1;
        }

        if let Some(mnemonic) = inst.mnemonic.as_deref() {
            let def_first = if inst.operands.is_empty() {
                false
            } else {
                mnemonic_defines_first_operand(mnemonic, &inst.operands[0])
            };
            for (op_idx, op) in inst.operands.iter_mut().enumerate() {
                if op_idx == 0 && def_first {
                    continue;
                }
                let old = op.clone();
                let rewritten = if is_trackable_int_reg(&old) && !is_forbidden_reg(&old) {
                    rewrite_use_operand_alias_virtual(&old, &int_alias)
                } else if is_trackable_float_reg(&old) && !is_forbidden_reg(&old) {
                    rewrite_use_operand_alias_virtual(&old, &float_alias)
                } else {
                    // Memory form like "off(%r)" can still be rewritten.
                    rewrite_use_operand_alias_virtual(&old, &int_alias)
                };
                if let Some(new_op) = rewritten {
                    if new_op != old {
                        *op = new_op;
                        rewrites += 1;
                    }
                }
            }

            let def_reg = if def_first && !inst.operands.is_empty() {
                Some(inst.operands[0].clone())
            } else {
                None
            };
            if let Some(rd) = def_reg {
                if is_trackable_int_reg(&rd) && !is_forbidden_reg(&rd) {
                    invalidate_aliases(&mut int_alias, &rd);
                    int_alias.insert(rd.clone(), rd.clone());
                    int_def_time.insert(rd, tick);
                } else if is_trackable_float_reg(&rd) && !is_forbidden_reg(&rd) {
                    invalidate_aliases(&mut float_alias, &rd);
                    float_alias.insert(rd.clone(), rd.clone());
                    float_def_time.insert(rd, tick);
                }
            }

            if (mnemonic == "mov" || mnemonic == "fmov") && inst.operands.len() == 2 {
                let rd = inst.operands[0].clone();
                let rs = inst.operands[1].clone();
                if mnemonic == "mov"
                    && is_trackable_int_reg(&rd)
                    && !is_forbidden_reg(&rd)
                    && is_trackable_int_reg(&rs)
                    && !is_forbidden_reg(&rs)
                {
                    let src_canon = resolve_alias(&int_alias, &rs);
                    let src_t = int_def_time.get(&src_canon).copied().unwrap_or(usize::MAX);
                    let rs_t = int_def_time.get(&rs).copied().unwrap_or(src_t);
                    let canon = if src_t <= rs_t { src_canon } else { rs };
                    int_alias.insert(rd.clone(), canon.clone());
                    if let Some(t) = int_def_time.get(&canon).copied() {
                        int_def_time.insert(rd, t);
                    }
                } else if mnemonic == "fmov"
                    && is_trackable_float_reg(&rd)
                    && !is_forbidden_reg(&rd)
                    && is_trackable_float_reg(&rs)
                    && !is_forbidden_reg(&rs)
                {
                    let src_canon = resolve_alias(&float_alias, &rs);
                    let src_t = float_def_time.get(&src_canon).copied().unwrap_or(usize::MAX);
                    let rs_t = float_def_time.get(&rs).copied().unwrap_or(src_t);
                    let canon = if src_t <= rs_t { src_canon } else { rs };
                    float_alias.insert(rd.clone(), canon.clone());
                    if let Some(t) = float_def_time.get(&canon).copied() {
                        float_def_time.insert(rd, t);
                    }
                }
            }

            if is_trace_barrier(mnemonic) {
                int_alias.clear();
                float_alias.clear();
                int_def_time.clear();
                float_def_time.clear();
                tick = 1;
            } else {
                tick = tick.saturating_add(1);
            }
        }

        out.push(inst);
    }

    (out, rewrites)
}

fn remove_indices_preserve_labels(instructions: &[Instruction], remove: &[bool]) -> Vec<Instruction> {
    let mut out = Vec::with_capacity(instructions.len());
    let mut pending_labels: Vec<String> = Vec::new();

    for (idx, inst) in instructions.iter().enumerate() {
        if remove[idx] {
            if let Some(lbl) = inst.label.as_ref() {
                pending_labels.push(lbl.clone());
            }
            continue;
        }

        let mut cur = inst.clone();
        if !pending_labels.is_empty() {
            if cur.label.is_none() {
                let keep_idx = pending_labels.len() - 1;
                for lbl in pending_labels.iter().take(keep_idx) {
                    out.push(Instruction {
                        label: Some(lbl.clone()),
                        mnemonic: None,
                        operands: vec![],
                    });
                }
                cur.label = Some(pending_labels[keep_idx].clone());
            } else {
                for lbl in &pending_labels {
                    out.push(Instruction {
                        label: Some(lbl.clone()),
                        mnemonic: None,
                        operands: vec![],
                    });
                }
            }
            pending_labels.clear();
        }
        out.push(cur);
    }

    for lbl in pending_labels {
        out.push(Instruction {
            label: Some(lbl),
            mnemonic: None,
            operands: vec![],
        });
    }

    out
}

fn is_zero_dest_nop(inst: &Instruction) -> bool {
    let Some(mnemonic) = inst.mnemonic.as_deref() else {
        return false;
    };
    if mnemonic.starts_with('.') || inst.operands.is_empty() {
        return false;
    }
    let rd = inst.operands[0].as_str();
    if rd != "%i0" && rd != "%f0" {
        return false;
    }
    if !mnemonic_defines_first_operand(mnemonic, rd) {
        return false;
    }
    matches!(
        mnemonic,
        "mov"
            | "neg"
            | "fmov"
            | "fneg"
            | "finv"
            | "frsqrt"
            | "ffloor"
            | "fabs"
            | "ftoi"
            | "itof"
            | "movi"
            | "movui"
            | "mif"
            | "add"
            | "sub"
            | "sll"
            | "sar"
            | "or"
            | "xor"
            | "ceq"
            | "cleq"
            | "clt"
            | "feq"
            | "fneq"
            | "fleq"
            | "flt"
            | "fadd"
            | "fsub"
            | "fmul"
            | "fdiv"
            | "fma"
            | "addi"
            | "subi"
            | "slli"
            | "sari"
            | "ori"
            | "xori"
            | "ceqi"
            | "cleqi"
            | "clti"
            | "tern"
            | "ftern"
    )
}

fn is_noop_add(inst: &Instruction) -> bool {
    match inst.mnemonic.as_deref() {
        Some("add") if inst.operands.len() == 3 => {
            let rd = inst.operands[0].as_str();
            let rs1 = inst.operands[1].as_str();
            let rs2 = inst.operands[2].as_str();
            is_int_reg(rd)
                && ((rs1 == "%i0" && rs2 == rd) || (rs2 == "%i0" && rs1 == rd))
        }
        Some("addi") if inst.operands.len() == 3 => {
            let rd = inst.operands[0].as_str();
            let rs = inst.operands[1].as_str();
            rd == rs && parse_imm_i32(inst.operands[2].as_str()).is_some_and(|v| v == 0)
        }
        _ => false,
    }
}

fn eliminate_noop_add_opt(mut instructions: Vec<Instruction>) -> (Vec<Instruction>, usize) {
    let mut total_rewrites = 0usize;
    loop {
        let mut remove = vec![false; instructions.len()];
        let mut rewrites = 0usize;
        for (idx, inst) in instructions.iter().enumerate() {
            if is_noop_add(inst) {
                remove[idx] = true;
                rewrites += 1;
            }
        }
        if rewrites == 0 {
            break;
        }
        total_rewrites += rewrites;
        instructions = remove_indices_preserve_labels(&instructions, &remove);
    }
    (instructions, total_rewrites)
}

fn eliminate_zero_dest_nop_opt(mut instructions: Vec<Instruction>) -> (Vec<Instruction>, usize) {
    let mut total_rewrites = 0usize;
    loop {
        let mut remove = vec![false; instructions.len()];
        let mut rewrites = 0usize;
        for (idx, inst) in instructions.iter().enumerate() {
            if is_zero_dest_nop(inst) {
                remove[idx] = true;
                rewrites += 1;
            }
        }
        if rewrites == 0 {
            break;
        }
        total_rewrites += rewrites;
        instructions = remove_indices_preserve_labels(&instructions, &remove);
    }
    (instructions, total_rewrites)
}

fn prune_unused_labels_opt(instructions: Vec<Instruction>) -> (Vec<Instruction>, usize) {
    let mut defined_labels: HashSet<String> = HashSet::new();
    for inst in &instructions {
        if let Some(lbl) = inst.label.as_ref() {
            if !lbl.is_empty() {
                defined_labels.insert(lbl.clone());
            }
        }
    }
    if defined_labels.is_empty() {
        return (instructions, 0);
    }

    let mut used_labels: HashSet<String> = HashSet::new();
    for inst in &instructions {
        for op in &inst.operands {
            if defined_labels.contains(op.as_str()) {
                used_labels.insert(op.clone());
            }
        }
    }

    if defined_labels.contains("min_caml_start") {
        used_labels.insert("min_caml_start".to_string());
    }

    let mut rewrites = 0usize;
    let mut out: Vec<Instruction> = Vec::with_capacity(instructions.len());
    for mut inst in instructions {
        if let Some(lbl) = inst.label.as_ref() {
            if !used_labels.contains(lbl.as_str()) {
                inst.label = None;
                rewrites += 1;
            }
        }
        if inst.label.is_none() && inst.mnemonic.is_none() {
            rewrites += 1;
            continue;
        }
        out.push(inst);
    }

    (out, rewrites)
}

fn inv_beta_opt_with_mode(mut instructions: Vec<Instruction>, virtual_only: bool) -> (Vec<Instruction>, usize) {
    fn rewrite_use_operand_from_to(op: &str, from: &str, to: &str) -> Option<String> {
        if from == to {
            return None;
        }
        if op == from {
            return Some(to.to_string());
        }
        let Some(start) = op.find('(') else {
            return None;
        };
        let Some(end_rel) = op[start + 1..].find(')') else {
            return None;
        };
        let end = start + 1 + end_rel;
        let base = &op[start + 1..end];
        if base != from {
            return None;
        }
        let mut out = String::new();
        out.push_str(&op[..start + 1]);
        out.push_str(to);
        out.push_str(&op[end..]);
        Some(out)
    }

    fn rewrite_uses_from_to(inst: &Instruction, from: &str, to: &str) -> (Instruction, usize) {
        let Some(mnemonic) = inst.mnemonic.as_deref() else {
            return (inst.clone(), 0);
        };
        let mut out = inst.clone();
        let def_first = if out.operands.is_empty() {
            false
        } else {
            mnemonic_defines_first_operand(mnemonic, &out.operands[0])
        };
        let mut rewrites = 0usize;
        for (op_idx, op) in out.operands.iter_mut().enumerate() {
            if op_idx == 0 && def_first {
                continue;
            }
            if let Some(new_op) = rewrite_use_operand_from_to(op, from, to) {
                if new_op != *op {
                    *op = new_op;
                    rewrites += 1;
                }
            }
        }
        (out, rewrites)
    }

    fn movable_pair(mnemonic: &str, rd: &str, rs: &str, virtual_only: bool) -> bool {
        if rd == rs {
            return false;
        }
        match mnemonic {
            "mov" => {
                if virtual_only {
                    is_trackable_int_reg(rd)
                        && !is_forbidden_reg(rd)
                        && is_trackable_int_reg(rs)
                        && !is_forbidden_reg(rs)
                } else {
                    is_trackable_int_reg(rd)
                        && !is_forbidden_reg(rd)
                        && is_trackable_int_reg(rs)
                        && !is_forbidden_reg(rs)
                }
            }
            "fmov" => {
                if virtual_only {
                    is_trackable_float_reg(rd)
                        && !is_forbidden_reg(rd)
                        && is_trackable_float_reg(rs)
                        && !is_forbidden_reg(rs)
                } else {
                    is_trackable_float_reg(rd)
                        && !is_forbidden_reg(rd)
                        && is_trackable_float_reg(rs)
                        && !is_forbidden_reg(rs)
                }
            }
            _ => false,
        }
    }

    let mut total_rewrites = 0usize;
    loop {
        let analyzed = analysis::analyze(&instructions);
        let call_arg_live_out_bits = compute_call_arg_live_out_bits(&analyzed);
        let reset_points = compute_non_fallthrough_entry_points(&instructions);
        let n = instructions.len();
        let mut block_id = vec![0usize; n];
        let mut cur_block = 0usize;
        for i in 0..n {
            let prev_is_barrier = if i > 0 {
                instructions[i - 1]
                    .mnemonic
                    .as_deref()
                    .map(is_trace_barrier)
                    .unwrap_or(false)
            } else {
                false
            };
            if i == 0
                || prev_is_barrier
                || instructions[i].label.is_some()
                || reset_points.get(i).copied().unwrap_or(false)
            {
                cur_block = cur_block.saturating_add(1);
            }
            block_id[i] = cur_block;
        }
        let reg_used_at = |idx: usize, reg: &str| -> bool {
            if analyzed[idx].uses.contains(reg) {
                return true;
            }
            if call_arg_bit(reg).is_some() && inst_is_call_like(&analyzed[idx].instruction) {
                return true;
            }
            false
        };
        let reg_live_out_at = |idx: usize, reg: &str| -> bool {
            if analyzed[idx].live_out.contains(reg) {
                return true;
            }
            call_arg_bit(reg)
                .map(|b| ((call_arg_live_out_bits[idx] >> b) & 1) != 0)
                .unwrap_or(false)
        };

        let mut remove = vec![false; n];
        let mut blocked = vec![false; n];
        let mut rewrites = 0usize;

        for idx in (0..n).rev() {
            if blocked[idx] || remove[idx] {
                continue;
            }
            let inst = &instructions[idx];
            let Some(mnemonic) = inst.mnemonic.as_deref() else {
                continue;
            };
            if !(mnemonic == "mov" || mnemonic == "fmov") || inst.operands.len() != 2 {
                continue;
            }
            let rd = inst.operands[0].clone();
            let rs = inst.operands[1].clone();
            if !movable_pair(mnemonic, &rd, &rs, virtual_only) {
                continue;
            }

            let mut def_idx: Option<usize> = None;
            let mut fail = false;
            let bid = block_id[idx];
            for j in (0..idx).rev() {
                if block_id[j] != bid {
                    break;
                }
                if blocked[j] || remove[j] {
                    fail = true;
                    break;
                }
                if analyzed[j].defs.contains(&rs) {
                    let def_inst = &instructions[j];
                    let Some(def_mnem) = def_inst.mnemonic.as_deref() else {
                        fail = true;
                        break;
                    };
                    if def_inst.operands.is_empty()
                        || def_inst.operands[0] != rs
                        || !mnemonic_defines_first_operand(def_mnem, &rs)
                        || is_side_effecting_or_control_mnemonic(def_mnem)
                    {
                        fail = true;
                    } else {
                        def_idx = Some(j);
                    }
                    break;
                }
                // Any use of rs before its nearest reaching def blocks reverse substitution.
                // If this instruction is both DEF+USE of rs, we already handled it above
                // and rewrite only DEF side at def_idx.
                if reg_used_at(j, &rs) {
                    fail = true;
                    break;
                }
            }
            if fail {
                continue;
            }
            let Some(j) = def_idx else {
                continue;
            };

            // No touch of rd/rs may exist between def and mov.
            for k in (j + 1)..idx {
                if blocked[k] || remove[k] {
                    fail = true;
                    break;
                }
                let a = &analyzed[k];
                if reg_used_at(k, &rd)
                    || a.defs.contains(&rd)
                    || reg_used_at(k, &rs)
                    || a.defs.contains(&rs)
                {
                    fail = true;
                    break;
                }
            }
            if fail {
                continue;
            }

            // Extend inverse-beta:
            // Rewrite uses of rs (whose reaching def is this unique def) to rd.
            // Safety:
            // - stay in the same block,
            // - stop at first re-def of rs,
            // - rd must stay unmodified until each rewritten use,
            // - if rs reaches block exit, require no external live-out.
            let mut block_end = idx;
            while block_end + 1 < n && block_id[block_end + 1] == bid {
                block_end += 1;
            }

            let mut rd_valid = true;
            let mut rs_redefined = false;
            let mut forward_end = idx;
            let mut edits: Vec<(usize, Instruction)> = Vec::new();
            let mut use_rewrites = 0usize;

            for k in (idx + 1)..=block_end {
                if blocked[k] || remove[k] {
                    fail = true;
                    break;
                }
                let a = &analyzed[k];
                if reg_used_at(k, &rs) {
                    if !rd_valid {
                        fail = true;
                        break;
                    }
                    let (new_inst, rw) = rewrite_uses_from_to(&instructions[k], &rs, &rd);
                    if rw == 0 {
                        fail = true;
                        break;
                    }
                    edits.push((k, new_inst));
                    use_rewrites += rw;
                }

                if a.defs.contains(&rs) {
                    rs_redefined = true;
                    forward_end = k;
                    break;
                }

                if a.defs.contains(&rd) {
                    rd_valid = false;
                }
                forward_end = k;
            }

            if !fail && !rs_redefined {
                if reg_live_out_at(block_end, &rs) {
                    fail = true;
                }
            }

            if fail {
                continue;
            }

            instructions[j].operands[0] = rd.clone();
            rewrites += 1; // def destination rewrite
            for (k, new_inst) in edits {
                instructions[k] = new_inst;
            }
            rewrites += use_rewrites;
            remove[idx] = true;
            rewrites += 1; // mov elimination
            let block_until = std::cmp::max(forward_end, idx);
            for b in blocked.iter_mut().take(block_until + 1).skip(j) {
                *b = true;
            }
        }

        if rewrites == 0 {
            break;
        }
        total_rewrites += rewrites;
        instructions = remove_indices_preserve_labels(&instructions, &remove);
    }
    (instructions, total_rewrites)
}

fn inv_beta_opt(instructions: Vec<Instruction>) -> (Vec<Instruction>, usize) {
    inv_beta_opt_with_mode(instructions, false)
}

fn inv_beta_virtual_opt(instructions: Vec<Instruction>) -> (Vec<Instruction>, usize) {
    inv_beta_opt_with_mode(instructions, true)
}

fn eliminate_dead_moves_cfg_opt(mut instructions: Vec<Instruction>) -> (Vec<Instruction>, usize) {
    let mut total_rewrites = 0usize;
    loop {
        let analyzed = analysis::analyze(&instructions);
        let call_arg_live_out_bits = compute_call_arg_live_out_bits(&analyzed);
        let mut remove = vec![false; instructions.len()];
        let mut rewrites = 0usize;

        for (idx, ai) in analyzed.iter().enumerate() {
            let inst = &ai.instruction;
            let Some(mnemonic) = inst.mnemonic.as_deref() else {
                continue;
            };
            if is_side_effecting_or_control_mnemonic(mnemonic) {
                continue;
            }
            let defs = &ai.defs;
            if defs.is_empty() {
                continue;
            }
            if !defs.iter().all(|d| is_physical_reg(d)) {
                continue;
            }
            if defs.iter().any(|d| {
                matches!(d.as_str(), "%i0" | "%i1" | "%i2" | "%i3" | "%f0")
            }) {
                continue;
            }
            if defs.iter().any(|d| ai.live_out.contains(d)) {
                continue;
            }
            if defs.iter().any(|d| {
                call_arg_bit(d)
                    .map(|b| ((call_arg_live_out_bits[idx] >> b) & 1) != 0)
                    .unwrap_or(false)
            }) {
                continue;
            }
            remove[idx] = true;
            rewrites += 1;
        }

        if rewrites == 0 {
            break;
        }
        total_rewrites += rewrites;
        instructions = remove_indices_preserve_labels(&instructions, &remove);
    }

    (instructions, total_rewrites)
}

fn eliminate_dead_moves_virtual_opt(mut instructions: Vec<Instruction>) -> (Vec<Instruction>, usize) {
    let mut total_rewrites = 0usize;
    loop {
        let analyzed = analysis::analyze(&instructions);
        let call_arg_live_out_bits = compute_call_arg_live_out_bits(&analyzed);
        let mut remove = vec![false; instructions.len()];
        let mut rewrites = 0usize;

        for (idx, ai) in analyzed.iter().enumerate() {
            let inst = &ai.instruction;
            let Some(mnemonic) = inst.mnemonic.as_deref() else {
                continue;
            };
            if is_side_effecting_or_control_mnemonic(mnemonic) {
                continue;
            }
            if ai.defs.is_empty() {
                continue;
            }
            if !ai
                .defs
                .iter()
                .all(|d| is_trackable_any_reg(d) && !is_forbidden_reg(d))
            {
                continue;
            }
            if ai.defs.iter().any(|d| ai.live_out.contains(d)) {
                continue;
            }
            if ai.defs.iter().any(|d| {
                call_arg_bit(d)
                    .map(|b| ((call_arg_live_out_bits[idx] >> b) & 1) != 0)
                    .unwrap_or(false)
            }) {
                continue;
            }
            remove[idx] = true;
            rewrites += 1;
        }

        if rewrites == 0 {
            break;
        }
        total_rewrites += rewrites;
        instructions = remove_indices_preserve_labels(&instructions, &remove);
    }
    (instructions, total_rewrites)
}

fn eliminate_redundant_store_load_opt(instructions: Vec<Instruction>) -> (Vec<Instruction>, usize) {
    fn is_disjoint_fixed_base(base: &str) -> bool {
        matches!(base, "%i0" | "%i1" | "%i2")
    }

    fn rewrite_uses_with_alias_map(
        mut inst: Instruction,
        alias_map: &HashMap<String, String>,
    ) -> (Instruction, usize) {
        let Some(mnemonic) = inst.mnemonic.as_deref() else {
            return (inst, 0);
        };
        let def_first = if inst.operands.is_empty() {
            false
        } else {
            mnemonic_defines_first_operand(mnemonic, &inst.operands[0])
        };
        let mut rewrites = 0usize;
        for (idx, op) in inst.operands.iter_mut().enumerate() {
            if idx == 0 && def_first {
                continue;
            }
            if let Some(new_op) = rewrite_use_operand_alias(op, alias_map) {
                if new_op != *op {
                    *op = new_op;
                    rewrites += 1;
                }
            }
        }
        (inst, rewrites)
    }

    fn kill_dest(
        rd: &str,
        int_mem_map: &mut HashMap<String, HashMap<i32, String>>,
        float_mem_map: &mut HashMap<String, HashMap<i32, String>>,
        alias_map: &mut HashMap<String, String>,
        int_last_store_idx: &mut HashMap<(String, i32), usize>,
        float_last_store_idx: &mut HashMap<(String, i32), usize>,
    ) {
        int_mem_map.remove(rd);
        float_mem_map.remove(rd);
        for table in int_mem_map.values_mut() {
            table.retain(|_, v| v != rd);
        }
        for table in float_mem_map.values_mut() {
            table.retain(|_, v| v != rd);
        }
        int_last_store_idx.retain(|(base, _), _| base != rd);
        float_last_store_idx.retain(|(base, _), _| base != rd);
        invalidate_aliases(alias_map, rd);
        alias_map.insert(rd.to_string(), rd.to_string());
    }

    fn drop_or_nop_placeholder(out: &mut Vec<Instruction>, inst: &Instruction) {
        if let Some(lbl) = &inst.label {
            out.push(Instruction {
                label: Some(lbl.clone()),
                mnemonic: Some("nop".to_string()),
                operands: vec![],
            });
        }
    }

    fn erase_emitted_store_preserve_label(out: &mut [Instruction], idx: usize) {
        if let Some(inst) = out.get_mut(idx) {
            if inst.label.is_some() {
                inst.mnemonic = Some("nop".to_string());
                inst.operands.clear();
            } else {
                inst.mnemonic = None;
                inst.operands.clear();
            }
        }
    }

    fn retain_last_store_by_base(
        last_store_idx: &mut HashMap<(String, i32), usize>,
        base: &str,
    ) {
        if is_disjoint_fixed_base(base) {
            last_store_idx.retain(|(b, _), _| is_disjoint_fixed_base(b) || b == base);
        } else {
            last_store_idx.retain(|(b, _), _| b == base);
        }
    }

    let reset_points = compute_non_fallthrough_entry_points(&instructions);
    let mut out = Vec::with_capacity(instructions.len());
    let mut rewrites = 0usize;
    // mem_map[base][offset] = value register
    let mut int_mem_map: HashMap<String, HashMap<i32, String>> = HashMap::new();
    let mut float_mem_map: HashMap<String, HashMap<i32, String>> = HashMap::new();
    // alias_map[reg] = equivalent register
    let mut alias_map: HashMap<String, String> = HashMap::new();
    // last emitted store index for each memory location, invalidated when that location is loaded.
    let mut int_last_store_idx: HashMap<(String, i32), usize> = HashMap::new();
    let mut float_last_store_idx: HashMap<(String, i32), usize> = HashMap::new();

    for (idx, inst0) in instructions.into_iter().enumerate() {
        if inst0.label.is_some() || reset_points.get(idx).copied().unwrap_or(false) {
            int_mem_map.clear();
            float_mem_map.clear();
            alias_map.clear();
            int_last_store_idx.clear();
            float_last_store_idx.clear();
        }

        let (mut inst, alias_rw) = rewrite_uses_with_alias_map(inst0, &alias_map);
        rewrites += alias_rw;

        let Some(mnemonic) = inst.mnemonic.as_deref() else {
            out.push(inst);
            continue;
        };

        if is_trace_barrier(mnemonic) {
            int_mem_map.clear();
            float_mem_map.clear();
            alias_map.clear();
            int_last_store_idx.clear();
            float_last_store_idx.clear();
            out.push(inst);
            continue;
        }

        match mnemonic {
            // keep sb/lb untouched except alias rewrite already done for uses
            "sb" => {
                out.push(inst);
                continue;
            }
            "lb" => {
                let rd = inst.operands.first().cloned();
                out.push(inst);
                if let Some(rd) = rd {
                    kill_dest(
                        &rd,
                        &mut int_mem_map,
                        &mut float_mem_map,
                        &mut alias_map,
                        &mut int_last_store_idx,
                        &mut float_last_store_idx,
                    );
                }
                continue;
            }
            "sw" if inst.operands.len() == 2 => {
                let src = resolve_alias(&alias_map, &inst.operands[0]);
                inst.operands[0] = src.clone();
                if let Some((off, base_raw)) = parse_mem_operand(&inst.operands[1]) {
                    let base = resolve_alias(&alias_map, &base_raw);
                    if base != base_raw {
                        inst.operands[1] = format!("{}({})", off, base);
                    }

                    if let Some(prev) = int_mem_map.get(&base).and_then(|m| m.get(&off)).cloned() {
                        if prev == src {
                            rewrites += 1;
                            drop_or_nop_placeholder(&mut out, &inst);
                            continue;
                        }
                        // previous store to same location is dead if no load observed since then
                        let loc = (base.clone(), off);
                        if let Some(prev_idx) = int_last_store_idx.get(&loc).copied() {
                            erase_emitted_store_preserve_label(&mut out, prev_idx);
                            rewrites += 1;
                        }
                        int_mem_map.entry(base.clone()).or_default().insert(off, src);
                        if is_disjoint_fixed_base(&base) {
                            int_mem_map.retain(|k, _| is_disjoint_fixed_base(k) || k == &base);
                        } else {
                            int_mem_map.retain(|k, _| k == &base);
                        }
                        retain_last_store_by_base(&mut int_last_store_idx, &base);
                        let out_idx = out.len();
                        out.push(inst);
                        int_last_store_idx.insert(loc, out_idx);
                        continue;
                    }

                    let loc = (base.clone(), off);
                    if let Some(prev_idx) = int_last_store_idx.get(&loc).copied() {
                        erase_emitted_store_preserve_label(&mut out, prev_idx);
                        rewrites += 1;
                    }
                    int_mem_map.entry(base.clone()).or_default().insert(off, src);
                    // Store may affect aliasable bases.
                    // Keep disjoint fixed-base regions (%i0/%i1/%i2) mutually intact.
                    if is_disjoint_fixed_base(&base) {
                        int_mem_map.retain(|k, _| is_disjoint_fixed_base(k) || k == &base);
                    } else {
                        int_mem_map.retain(|k, _| k == &base);
                    }
                    retain_last_store_by_base(&mut int_last_store_idx, &base);
                    let out_idx = out.len();
                    out.push(inst);
                    int_last_store_idx.insert(loc, out_idx);
                    continue;
                }

                out.push(inst);
                continue;
            }
            "sf" if inst.operands.len() == 2 => {
                let src = resolve_alias(&alias_map, &inst.operands[0]);
                inst.operands[0] = src.clone();
                if let Some((off, base_raw)) = parse_mem_operand(&inst.operands[1]) {
                    let base = resolve_alias(&alias_map, &base_raw);
                    if base != base_raw {
                        inst.operands[1] = format!("{}({})", off, base);
                    }

                    if let Some(prev) = float_mem_map.get(&base).and_then(|m| m.get(&off)).cloned() {
                        if prev == src {
                            rewrites += 1;
                            drop_or_nop_placeholder(&mut out, &inst);
                            continue;
                        }
                        let loc = (base.clone(), off);
                        if let Some(prev_idx) = float_last_store_idx.get(&loc).copied() {
                            erase_emitted_store_preserve_label(&mut out, prev_idx);
                            rewrites += 1;
                        }
                        float_mem_map.entry(base.clone()).or_default().insert(off, src);
                        if is_disjoint_fixed_base(&base) {
                            float_mem_map.retain(|k, _| is_disjoint_fixed_base(k) || k == &base);
                        } else {
                            float_mem_map.retain(|k, _| k == &base);
                        }
                        retain_last_store_by_base(&mut float_last_store_idx, &base);
                        let out_idx = out.len();
                        out.push(inst);
                        float_last_store_idx.insert(loc, out_idx);
                        continue;
                    }

                    let loc = (base.clone(), off);
                    if let Some(prev_idx) = float_last_store_idx.get(&loc).copied() {
                        erase_emitted_store_preserve_label(&mut out, prev_idx);
                        rewrites += 1;
                    }
                    float_mem_map.entry(base.clone()).or_default().insert(off, src);
                    if is_disjoint_fixed_base(&base) {
                        float_mem_map.retain(|k, _| is_disjoint_fixed_base(k) || k == &base);
                    } else {
                        float_mem_map.retain(|k, _| k == &base);
                    }
                    retain_last_store_by_base(&mut float_last_store_idx, &base);
                    let out_idx = out.len();
                    out.push(inst);
                    float_last_store_idx.insert(loc, out_idx);
                    continue;
                }

                out.push(inst);
                continue;
            }
            "lw" if inst.operands.len() == 2 => {
                let rd = inst.operands[0].clone();
                if let Some((off, base_raw)) = parse_mem_operand(&inst.operands[1]) {
                    let base = resolve_alias(&alias_map, &base_raw);
                    if base != base_raw {
                        inst.operands[1] = format!("{}({})", off, base);
                    }

                    if let Some(prev) = int_mem_map.get(&base).and_then(|m| m.get(&off)).cloned() {
                        let rd_now = resolve_alias(&alias_map, &rd);
                        if prev == rd_now {
                            rewrites += 1;
                            drop_or_nop_placeholder(&mut out, &inst);
                            continue;
                        }
                        kill_dest(
                            &rd,
                            &mut int_mem_map,
                            &mut float_mem_map,
                            &mut alias_map,
                            &mut int_last_store_idx,
                            &mut float_last_store_idx,
                        );
                        alias_map.insert(rd.clone(), resolve_alias(&alias_map, &prev));
                        rewrites += 1;
                        drop_or_nop_placeholder(&mut out, &inst);
                        continue;
                    }

                    let loc = (base.clone(), off);
                    kill_dest(
                        &rd,
                        &mut int_mem_map,
                        &mut float_mem_map,
                        &mut alias_map,
                        &mut int_last_store_idx,
                        &mut float_last_store_idx,
                    );
                    int_mem_map.entry(base).or_default().insert(off, rd.clone());
                    // observed load blocks dead-store elimination across this point
                    int_last_store_idx.remove(&loc);
                    out.push(inst);
                    continue;
                }

                out.push(inst.clone());
                kill_dest(
                    &rd,
                    &mut int_mem_map,
                    &mut float_mem_map,
                    &mut alias_map,
                    &mut int_last_store_idx,
                    &mut float_last_store_idx,
                );
                continue;
            }
            "lf" if inst.operands.len() == 2 => {
                let rd = inst.operands[0].clone();
                if let Some((off, base_raw)) = parse_mem_operand(&inst.operands[1]) {
                    let base = resolve_alias(&alias_map, &base_raw);
                    if base != base_raw {
                        inst.operands[1] = format!("{}({})", off, base);
                    }

                    if let Some(prev) = float_mem_map.get(&base).and_then(|m| m.get(&off)).cloned() {
                        let rd_now = resolve_alias(&alias_map, &rd);
                        if prev == rd_now {
                            rewrites += 1;
                            drop_or_nop_placeholder(&mut out, &inst);
                            continue;
                        }
                        kill_dest(
                            &rd,
                            &mut int_mem_map,
                            &mut float_mem_map,
                            &mut alias_map,
                            &mut int_last_store_idx,
                            &mut float_last_store_idx,
                        );
                        alias_map.insert(rd.clone(), resolve_alias(&alias_map, &prev));
                        rewrites += 1;
                        drop_or_nop_placeholder(&mut out, &inst);
                        continue;
                    }

                    let loc = (base.clone(), off);
                    kill_dest(
                        &rd,
                        &mut int_mem_map,
                        &mut float_mem_map,
                        &mut alias_map,
                        &mut int_last_store_idx,
                        &mut float_last_store_idx,
                    );
                    float_mem_map.entry(base).or_default().insert(off, rd.clone());
                    // observed load blocks dead-store elimination across this point
                    float_last_store_idx.remove(&loc);
                    out.push(inst);
                    continue;
                }

                out.push(inst.clone());
                kill_dest(
                    &rd,
                    &mut int_mem_map,
                    &mut float_mem_map,
                    &mut alias_map,
                    &mut int_last_store_idx,
                    &mut float_last_store_idx,
                );
                continue;
            }
            _ => {}
        }

        let def_reg = define_physical_dest(&inst);
        out.push(inst);
        if let Some(rd) = def_reg {
            kill_dest(
                &rd,
                &mut int_mem_map,
                &mut float_mem_map,
                &mut alias_map,
                &mut int_last_store_idx,
                &mut float_last_store_idx,
            );
        }
    }

    (out, rewrites)
}

#[derive(Debug, Default, Clone)]
struct ValTrace {
    // 1. const: register -> concrete constant value
    const_values: HashMap<String, i32>,
    // 2. bool: register is known to be 0/1
    bool_regs: HashSet<String>,
    // 3. eq_regs: register -> equal register set
    eq_regs: HashMap<String, HashSet<String>>,
}

impl ValTrace {
    fn new() -> Self {
        let mut s = Self::default();
        s.seed_zero_reg();
        s
    }

    fn seed_zero_reg(&mut self) {
        self.const_values.insert("%i0".to_string(), 0);
        self.bool_regs.insert("%i0".to_string());
        let mut s = HashSet::new();
        s.insert("%i0".to_string());
        self.eq_regs.insert("%i0".to_string(), s);
    }

    fn clear_for_new_block(&mut self) {
        self.const_values.clear();
        self.bool_regs.clear();
        self.eq_regs.clear();
        self.seed_zero_reg();
    }

    fn const_of(&self, reg: &str) -> Option<i32> {
        self.const_values.get(reg).copied()
    }

    fn is_bool(&self, reg: &str) -> bool {
        self.bool_regs.contains(reg) || self.const_of(reg) == Some(0) || self.const_of(reg) == Some(1)
    }

    fn set_const(&mut self, reg: &str, value: i32) {
        if reg == "%i0" {
            return;
        }
        self.const_values.insert(reg.to_string(), value);
        if value == 0 || value == 1 {
            self.bool_regs.insert(reg.to_string());
        } else {
            self.bool_regs.remove(reg);
        }
        self.eq_regs.remove(reg);
        for peers in self.eq_regs.values_mut() {
            peers.remove(reg);
        }
    }

    fn set_bool(&mut self, reg: &str) {
        if reg == "%i0" {
            return;
        }
        self.kill_reg(reg);
        self.bool_regs.insert(reg.to_string());
    }

    fn kill_reg(&mut self, reg: &str) {
        if reg == "%i0" {
            return;
        }
        self.const_values.remove(reg);
        self.bool_regs.remove(reg);
        self.eq_regs.remove(reg);
        for peers in self.eq_regs.values_mut() {
            peers.remove(reg);
        }
    }

    fn set_equal(&mut self, lhs: &str, rhs: &str) {
        if lhs == rhs {
            return;
        }
        let mut merged = HashSet::new();
        merged.insert(lhs.to_string());
        merged.insert(rhs.to_string());
        if let Some(s) = self.eq_regs.get(lhs) {
            merged.extend(s.clone());
        }
        if let Some(s) = self.eq_regs.get(rhs) {
            merged.extend(s.clone());
        }
        for r in merged.clone() {
            self.eq_regs.insert(r, merged.clone());
        }
    }

    fn find_const_reg(&self, value: i32, exclude: &str) -> Option<String> {
        let mut best: Option<String> = None;
        for (reg, v) in &self.const_values {
            if *v != value || reg == exclude {
                continue;
            }
            if !is_int_reg(reg) {
                continue;
            }
            match &best {
                None => best = Some(reg.clone()),
                Some(cur) => {
                    if reg_rank(reg) < reg_rank(cur) {
                        best = Some(reg.clone());
                    }
                }
            }
        }
        best
    }

    fn observe_instruction(&mut self, inst: &Instruction) {
        let Some(mnem) = inst.mnemonic.as_deref() else {
            return;
        };

        if let Some(rd) = defined_int_reg(inst) {
            match mnem {
                "movi" if inst.operands.len() == 2 => {
                    if let Some(v) = parse_imm_i32(&inst.operands[1]) {
                        self.set_const(rd, v);
                    } else {
                        self.kill_reg(rd);
                    }
                }
                "mov" if inst.operands.len() == 2 => {
                    let rs = &inst.operands[1];
                    if let Some(v) = self.const_of(rs) {
                        self.set_const(rd, v);
                    } else if self.is_bool(rs) {
                        self.set_bool(rd);
                    } else {
                        self.kill_reg(rd);
                    }
                    self.set_equal(rd, rs);
                }
                "ceq" | "clt" | "cleq" if inst.operands.len() == 3 => {
                    let rs1 = &inst.operands[1];
                    let rs2 = &inst.operands[2];
                    match (self.const_of(rs1), self.const_of(rs2)) {
                        (Some(a), Some(b)) => {
                            let v = match mnem {
                                "ceq" => i32::from(a == b),
                                "clt" => i32::from(a < b),
                                "cleq" => i32::from(a <= b),
                                _ => unreachable!(),
                            };
                            self.set_const(rd, v);
                        }
                        _ => self.set_bool(rd),
                    }
                }
                "ceqi" | "clti" | "cleqi" if inst.operands.len() == 3 => {
                    let rs = &inst.operands[1];
                    if let Some(imm) = parse_imm_i32(&inst.operands[2]) {
                        if let Some(a) = self.const_of(rs) {
                            let v = match mnem {
                                "ceqi" => i32::from(a == imm),
                                "clti" => i32::from(a < imm),
                                "cleqi" => i32::from(a <= imm),
                                _ => unreachable!(),
                            };
                            self.set_const(rd, v);
                        } else {
                            self.set_bool(rd);
                        }
                    } else {
                        self.set_bool(rd);
                    }
                }
                "feq" | "fneq" | "fleq" | "flt" => {
                    self.set_bool(rd);
                }
                "xori" if inst.operands.len() == 3 => {
                    let rs = &inst.operands[1];
                    if let Some(imm) = parse_imm_i32(&inst.operands[2]) {
                        if let Some(v) = self.const_of(rs) {
                            self.set_const(rd, v ^ imm);
                        } else if self.is_bool(rs) && imm == 1 {
                            self.set_bool(rd);
                        } else {
                            self.kill_reg(rd);
                        }
                    } else {
                        self.kill_reg(rd);
                    }
                }
                "xor" if inst.operands.len() == 3 => {
                    let rs1 = &inst.operands[1];
                    let rs2 = &inst.operands[2];
                    if rs1 == rs2 {
                        self.set_const(rd, 0);
                    } else if self.eq_regs.get(rs1).is_some_and(|s| s.contains(rs2)) {
                        self.set_const(rd, 0);
                    } else if let (Some(a), Some(b)) = (self.const_of(rs1), self.const_of(rs2)) {
                        self.set_const(rd, a ^ b);
                    } else if self.is_bool(rs1) && self.is_bool(rs2) {
                        self.set_bool(rd);
                    } else {
                        self.kill_reg(rd);
                    }
                }
                _ => self.kill_reg(rd),
            }
        }

        if is_trace_barrier(mnem) {
            self.clear_for_new_block();
        }
    }
}

fn is_int_reg(reg: &str) -> bool {
    let Some(rest) = reg.strip_prefix("%i") else {
        return false;
    };
    !rest.is_empty() && rest.chars().all(|c| c.is_ascii_digit())
}

fn int_reg_index(reg: &str) -> Option<usize> {
    let rest = reg.strip_prefix("%i")?;
    rest.parse::<usize>().ok()
}

fn reg_rank(reg: &str) -> (usize, String) {
    if let Some(idx) = int_reg_index(reg) {
        (idx, String::new())
    } else {
        (usize::MAX, reg.to_string())
    }
}

fn parse_imm_i32(s: &str) -> Option<i32> {
    if let Ok(v) = s.parse::<i32>() {
        return Some(v);
    }
    if let Some(hex) = s.strip_prefix("0x") {
        return i32::from_str_radix(hex, 16).ok();
    }
    if let Some(hex) = s.strip_prefix("-0x") {
        return i32::from_str_radix(hex, 16).ok().map(|v| -v);
    }
    None
}

fn mnemonic_defines_first_operand(mnemonic: &str, rd: &str) -> bool {
    if mnemonic.starts_with('.') {
        return false;
    }
    match mnemonic {
        "sw" | "sb" | "sf" | "jzero" | "jeq" | "jlt" | "jleq" | "ret" | "call_dir"
        | "call_cls" => false,
        "jmp" => rd != "%i0",
        _ => true,
    }
}

fn defined_int_reg(inst: &Instruction) -> Option<&str> {
    let mnem = inst.mnemonic.as_deref()?;
    let rd = inst.operands.first()?.as_str();
    if !is_int_reg(rd) {
        return None;
    }
    if !mnemonic_defines_first_operand(mnem, rd) {
        return None;
    }
    Some(rd)
}

fn is_trace_barrier(mnemonic: &str) -> bool {
    matches!(
        mnemonic,
        "jmp" | "jzero" | "jeq" | "jlt" | "jleq" | "ret" | "call_dir" | "call_cls"
    ) || mnemonic.starts_with('.')
}

fn const_reuse_with_val_trace_opt(instructions: Vec<Instruction>) -> (Vec<Instruction>, usize) {
    let reset_points = compute_non_fallthrough_entry_points(&instructions);
    let mut out = Vec::with_capacity(instructions.len());
    let mut rewrites = 0usize;
    let mut trace = ValTrace::new();
    let mut i = 0usize;
    let n = instructions.len();

    while i < n {
        if instructions[i].label.is_some() || reset_points.get(i).copied().unwrap_or(false) {
            trace.clear_for_new_block();
        }

        if i + 2 < n
            && !reset_points.get(i + 1).copied().unwrap_or(false)
            && !reset_points.get(i + 2).copied().unwrap_or(false)
        {
            if let Some(new_inst) =
                fold_mov_xor_ceqi_pattern(&instructions[i], &instructions[i + 1], &instructions[i + 2])
            {
                trace.observe_instruction(&new_inst);
                out.push(new_inst);
                rewrites += 1;
                i += 3;
                continue;
            }
        }

        if i + 1 < n && !reset_points.get(i + 1).copied().unwrap_or(false) {
            if let Some(new_inst) = fold_xor_ceqi_pattern(&instructions[i], &instructions[i + 1]) {
                trace.observe_instruction(&new_inst);
                out.push(new_inst);
                rewrites += 1;
                i += 2;
                continue;
            }
        }

        if i + 3 < n
            && !reset_points.get(i + 1).copied().unwrap_or(false)
            && !reset_points.get(i + 2).copied().unwrap_or(false)
            && !reset_points.get(i + 3).copied().unwrap_or(false)
        {
            if let Some(new_insts) = fold_bool_to_pm1_pattern(
                &instructions[i],
                &instructions[i + 1],
                &instructions[i + 2],
                &instructions[i + 3],
            ) {
                for inst in &new_insts {
                    trace.observe_instruction(inst);
                    out.push(inst.clone());
                }
                rewrites += 1;
                i += 4;
                continue;
            }
        }

        if i + 1 < n && !reset_points.get(i + 1).copied().unwrap_or(false) {
            if let Some(new_inst) = fold_bool_neg_pattern(&instructions[i], &instructions[i + 1], &trace) {
                trace.observe_instruction(&new_inst);
                out.push(new_inst);
                rewrites += 1;
                i += 2;
                continue;
            }
        }

        if i + 1 < n && !reset_points.get(i + 1).copied().unwrap_or(false) {
            if let Some(new_inst) = fold_mov_xor_pattern(&instructions[i], &instructions[i + 1]) {
                trace.observe_instruction(&new_inst);
                out.push(new_inst);
                rewrites += 1;
                i += 2;
                continue;
            }
        }

        let mut inst = instructions[i].clone();
        if inst.mnemonic.as_deref() == Some("movi") && inst.operands.len() == 2 {
            let rd = inst.operands[0].clone();
            if is_int_reg(&rd) {
                if let Some(imm) = parse_imm_i32(&inst.operands[1]) {
                    if trace.const_of(&rd) == Some(imm) {
                        inst.mnemonic = Some("mov".to_string());
                        inst.operands = vec![rd.clone(), rd];
                        rewrites += 1;
                    } else if let Some(src) = trace.find_const_reg(imm, &rd) {
                        inst.mnemonic = Some("mov".to_string());
                        inst.operands = vec![rd, src];
                        rewrites += 1;
                    }
                }
            }
        }
        trace.observe_instruction(&inst);
        out.push(inst);
        i += 1;
    }

    (out, rewrites)
}

fn fold_xor_ceqi_pattern(i0: &Instruction, i1: &Instruction) -> Option<Instruction> {
    if i1.label.is_some() {
        return None;
    }
    if i0.mnemonic.as_deref() != Some("xor") || i1.mnemonic.as_deref() != Some("ceqi") {
        return None;
    }
    if i0.operands.len() != 3 || i1.operands.len() != 3 {
        return None;
    }
    let rd = &i0.operands[0];
    if !is_int_reg(rd) {
        return None;
    }
    if i1.operands[0] != *rd || i1.operands[1] != *rd || i1.operands[2] != "0" {
        return None;
    }
    Some(Instruction {
        label: i0.label.clone(),
        mnemonic: Some("ceq".to_string()),
        operands: vec![rd.clone(), i0.operands[1].clone(), i0.operands[2].clone()],
    })
}

fn fold_mov_xor_ceqi_pattern(i0: &Instruction, i1: &Instruction, i2: &Instruction) -> Option<Instruction> {
    if i1.label.is_some() || i2.label.is_some() {
        return None;
    }
    if i0.mnemonic.as_deref() != Some("mov")
        || i1.mnemonic.as_deref() != Some("xor")
        || i2.mnemonic.as_deref() != Some("ceqi")
    {
        return None;
    }
    if i0.operands.len() != 2 || i1.operands.len() != 3 || i2.operands.len() != 3 {
        return None;
    }
    let rd = &i0.operands[0];
    let src = &i0.operands[1];
    if !is_int_reg(rd) || !is_int_reg(src) {
        return None;
    }
    if i1.operands[0] != *rd {
        return None;
    }
    if i2.operands[0] != *rd || i2.operands[1] != *rd || i2.operands[2] != "0" {
        return None;
    }
    if i1.operands[1] == *rd {
        return Some(Instruction {
            label: i0.label.clone(),
            mnemonic: Some("ceq".to_string()),
            operands: vec![rd.clone(), src.clone(), i1.operands[2].clone()],
        });
    }
    if i1.operands[2] == *rd {
        return Some(Instruction {
            label: i0.label.clone(),
            mnemonic: Some("ceq".to_string()),
            operands: vec![rd.clone(), i1.operands[1].clone(), src.clone()],
        });
    }
    None
}

fn fold_mov_xor_pattern(i0: &Instruction, i1: &Instruction) -> Option<Instruction> {
    if i1.label.is_some() {
        return None;
    }
    if i0.mnemonic.as_deref() != Some("mov") || i1.mnemonic.as_deref() != Some("xor") {
        return None;
    }
    if i0.operands.len() != 2 || i1.operands.len() != 3 {
        return None;
    }
    let rd = &i0.operands[0];
    let src = &i0.operands[1];
    if !is_int_reg(rd) || !is_int_reg(src) {
        return None;
    }
    if i1.operands[0] != *rd {
        return None;
    }
    let mut out = i1.clone();
    out.label = i0.label.clone();
    if i1.operands[1] == *rd {
        out.operands[1] = src.clone();
        return Some(out);
    }
    if i1.operands[2] == *rd {
        out.operands[2] = src.clone();
        return Some(out);
    }
    None
}

fn fold_bool_to_pm1_pattern(
    i0: &Instruction,
    i1: &Instruction,
    i2: &Instruction,
    i3: &Instruction,
) -> Option<Vec<Instruction>> {
    if i1.label.is_some() || i2.label.is_some() || i3.label.is_some() {
        return None;
    }
    if i0.mnemonic.as_deref() != Some("ceqi")
        || i1.mnemonic.as_deref() != Some("slli")
        || i2.mnemonic.as_deref() != Some("sub")
        || i3.mnemonic.as_deref() != Some("addi")
    {
        return None;
    }
    if i0.operands.len() != 3 || i1.operands.len() != 3 || i2.operands.len() != 3 || i3.operands.len() != 3 {
        return None;
    }
    let rd = &i0.operands[0];
    if !is_int_reg(rd) {
        return None;
    }
    if i0.operands[1] != *rd || i0.operands[2] != "0" {
        return None;
    }
    if i1.operands[0] != *rd || i1.operands[1] != *rd || i1.operands[2] != "1" {
        return None;
    }
    if i2.operands[0] != *rd || i2.operands[1] != "%i0" || i2.operands[2] != *rd {
        return None;
    }
    if i3.operands[0] != *rd || i3.operands[1] != *rd || i3.operands[2] != "1" {
        return None;
    }

    Some(vec![
        Instruction {
            label: i0.label.clone(),
            mnemonic: Some("slli".to_string()),
            operands: vec![rd.clone(), rd.clone(), "1".to_string()],
        },
        Instruction {
            label: None,
            mnemonic: Some("addi".to_string()),
            operands: vec![rd.clone(), rd.clone(), "-1".to_string()],
        },
    ])
}

fn fold_bool_neg_pattern(i0: &Instruction, i1: &Instruction, trace: &ValTrace) -> Option<Instruction> {
    if i1.label.is_some() {
        return None;
    }
    if i0.mnemonic.as_deref() != Some("sub") || i1.mnemonic.as_deref() != Some("addi") {
        return None;
    }
    if i0.operands.len() != 3 || i1.operands.len() != 3 {
        return None;
    }
    let rd = &i0.operands[0];
    if !is_int_reg(rd) || !trace.is_bool(rd) {
        return None;
    }
    if i0.operands[1] != "%i0" || i0.operands[2] != *rd {
        return None;
    }
    if i1.operands[0] != *rd || i1.operands[1] != *rd || i1.operands[2] != "1" {
        return None;
    }
    Some(Instruction {
        label: i0.label.clone(),
        mnemonic: Some("xori".to_string()),
        operands: vec![rd.clone(), rd.clone(), "1".to_string()],
    })
}

/// Jump-trampoline beta-reduction:
/// Trampoline forms:
/// 1) [label-only*] [label:] set_label %rX, TARGET; jmp %i0, 0(%rX)
/// 2) [label-only*] [label:] jzero %i0, %i0, TARGET
/// are treated as pure forwarders.
/// - `set_label` references are always rewritten transitively (full-range).
/// - Other references are rewritten when physical removal is safe.
const BRANCH_THRESHOLD: usize = usize::MAX;

pub fn jump_trampoline_elim(instructions: Vec<Instruction>) -> (Vec<Instruction>, usize) {
    #[derive(Debug, Clone)]
    struct TrampolineInfo {
        entry_idx: usize,
        body_indices: Vec<usize>,
        labels: Vec<String>,
        target: String,
    }

    fn collect_entry(
        instructions: &[Instruction],
        first_exec_idx: usize,
    ) -> (usize, Vec<usize>, Vec<String>) {
        let mut entry_idx = first_exec_idx;
        while entry_idx > 0 {
            let prev = &instructions[entry_idx - 1];
            if prev.mnemonic.is_none() && prev.label.is_some() {
                entry_idx -= 1;
            } else {
                break;
            }
        }

        let mut label_only_indices = Vec::new();
        let mut labels = Vec::new();
        let mut seen = HashSet::new();

        for (idx, inst) in instructions
            .iter()
            .enumerate()
            .take(first_exec_idx)
            .skip(entry_idx)
        {
            if inst.mnemonic.is_none() {
                if let Some(lbl) = inst.label.as_ref() {
                    if seen.insert(lbl.clone()) {
                        labels.push(lbl.clone());
                    }
                    label_only_indices.push(idx);
                }
            }
        }

        if let Some(lbl) = instructions[first_exec_idx].label.as_ref() {
            if seen.insert(lbl.clone()) {
                labels.push(lbl.clone());
            }
        }

        (entry_idx, label_only_indices, labels)
    }

    fn register_candidate(
        infos: &mut Vec<TrampolineInfo>,
        label_to_info: &mut HashMap<String, usize>,
        mut info: TrampolineInfo,
    ) {
        info.labels.retain(|lbl| !label_to_info.contains_key(lbl));
        if info.labels.is_empty() {
            return;
        }
        let idx = infos.len();
        for lbl in &info.labels {
            label_to_info.insert(lbl.clone(), idx);
        }
        infos.push(info);
    }

    let n = instructions.len();
    let mut infos: Vec<TrampolineInfo> = Vec::new();
    let mut label_to_info: HashMap<String, usize> = HashMap::new();

    // Pattern A:
    //   [label-only*]
    //   [label:] set_label %r, TARGET
    //            jmp %i0, 0(%r)
    for i in 0..n.saturating_sub(1) {
        let inst = &instructions[i];
        if inst.mnemonic.as_deref() != Some("set_label") || inst.operands.len() != 2 {
            continue;
        }
        let reg = &inst.operands[0];
        let target = inst.operands[1].clone();

        let next = &instructions[i + 1];
        if next.label.is_some()
            || next.mnemonic.as_deref() != Some("jmp")
            || next.operands.len() != 2
            || next.operands[0] != "%i0"
            || next.operands[1] != format!("0({})", reg)
        {
            continue;
        }

        let (entry_idx, mut body_indices, labels) = collect_entry(&instructions, i);
        body_indices.push(i);
        body_indices.push(i + 1);
        register_candidate(
            &mut infos,
            &mut label_to_info,
            TrampolineInfo {
                entry_idx,
                body_indices,
                labels,
                target,
            },
        );
    }

    // Pattern B:
    //   [label-only*]
    //   [label:] jzero %i0, %i0, TARGET
    for i in 0..n {
        let inst = &instructions[i];
        if inst.mnemonic.as_deref() != Some("jzero")
            || inst.operands.len() != 3
            || inst.operands[0] != "%i0"
            || inst.operands[1] != "%i0"
        {
            continue;
        }

        let target = inst.operands[2].clone();
        let (entry_idx, mut body_indices, labels) = collect_entry(&instructions, i);
        body_indices.push(i);
        register_candidate(
            &mut infos,
            &mut label_to_info,
            TrampolineInfo {
                entry_idx,
                body_indices,
                labels,
                target,
            },
        );
    }

    if infos.is_empty() {
        return (instructions, 0);
    }

    // Transitively resolve chains (A -> B -> C => A -> C).
    let mut resolved_target: HashMap<String, String> = HashMap::new();
    for (lbl, &info_idx) in &label_to_info {
        let mut cur = infos[info_idx].target.clone();
        let mut seen = HashSet::new();
        while let Some(&next_idx) = label_to_info.get(cur.as_str()) {
            if !seen.insert(cur.clone()) {
                break;
            }
            cur = infos[next_idx].target.clone();
        }
        resolved_target.insert(lbl.clone(), cur);
    }

    // For each trampoline, decide if it is safe to physically remove the block.
    let mut safe_to_remove = vec![true; infos.len()];

    // Never remove self-referential trampolines.
    for (lbl, &info_idx) in &label_to_info {
        if resolved_target
            .get(lbl.as_str())
            .is_some_and(|target| target == lbl)
        {
            safe_to_remove[info_idx] = false;
        }
    }

    let mut label_index: HashMap<String, usize> = HashMap::new();
    for (idx, inst) in instructions.iter().enumerate() {
        if let Some(label) = inst.label.as_deref() {
            label_index.insert(label.to_string(), idx);
        }
    }

    for (ref_idx, inst) in instructions.iter().enumerate() {
        let Some(mnem) = inst.mnemonic.as_deref() else {
            continue;
        };
        if mnem == "set_label" {
            continue; // full-range indirection; always rewritable
        }
        for op in &inst.operands {
            let Some(&info_idx) = label_to_info.get(op.as_str()) else {
                continue;
            };
            let Some(final_target) = resolved_target.get(op.as_str()) else {
                continue;
            };
            let target_idx = label_index.get(final_target).copied().unwrap_or(usize::MAX);
            let dist = ref_idx.abs_diff(target_idx);
            if dist > BRANCH_THRESHOLD {
                safe_to_remove[info_idx] = false;
            }
        }
    }

    // Additional safety: no fall-through into trampoline entry.
    let is_terminator =
        |mnem: &str| matches!(mnem, "jmp" | "jzero" | "jeq" | "jlt" | "jleq" | "ret");
    for (info_idx, info) in infos.iter().enumerate() {
        if !safe_to_remove[info_idx] {
            continue;
        }
        let mut prev_exec = None;
        let mut j = info.entry_idx;
        while j > 0 {
            j -= 1;
            if instructions[j].mnemonic.is_some() {
                prev_exec = Some(j);
                break;
            }
        }
        if let Some(pred_idx) = prev_exec {
            let pred_mnem = instructions[pred_idx].mnemonic.as_deref().unwrap_or("");
            if !is_terminator(pred_mnem) {
                safe_to_remove[info_idx] = false;
            }
        }
    }

    let mut drop_indices: HashSet<usize> = HashSet::new();
    for (info_idx, info) in infos.iter().enumerate() {
        if safe_to_remove[info_idx] {
            for &bi in &info.body_indices {
                drop_indices.insert(bi);
            }
        }
    }

    let mut rewrites = 0usize;
    let mut out = Vec::with_capacity(n);
    for (i, mut inst) in instructions.into_iter().enumerate() {
        if drop_indices.contains(&i) {
            rewrites += 1;
            continue;
        }

        let mnem = inst.mnemonic.as_deref().unwrap_or("");
        if mnem == "set_label" && inst.operands.len() == 2 {
            let old = inst.operands[1].clone();
            if let Some(new_target) = resolved_target.get(old.as_str()) {
                if old != *new_target {
                    inst.operands[1] = new_target.clone();
                    rewrites += 1;
                }
            }
        } else {
            for op in inst.operands.iter_mut() {
                let old = op.clone();
                let Some(&info_idx) = label_to_info.get(old.as_str()) else {
                    continue;
                };
                if !safe_to_remove[info_idx] {
                    continue;
                }
                if let Some(new_target) = resolved_target.get(old.as_str()) {
                    if old != *new_target {
                        *op = new_target.clone();
                        rewrites += 1;
                    }
                }
            }
        }
        out.push(inst);
    }

    (out, rewrites)
}

/// Relax conditional branches (`jeq`, `jleq`, `jlt`, `jzero`) if they jump
/// backward or if they jump forward by more than 4095 instructions.
/// tkasm limits conditional branch offsets to 12-bit unsigned (max 4095).
/// Uses %i31 as a scratch register.
/// %i31 is reserved as a dedicated scratch register in this backend.
pub fn relax_branches_opt(instructions: Vec<Instruction>) -> (Vec<Instruction>, usize) {
    let mut out = Vec::with_capacity(instructions.len());
    let mut rewrites = 0usize;

    // First map labels to instruction indices
    let mut label_index: HashMap<String, usize> = HashMap::new();
    for (idx, inst) in instructions.iter().enumerate() {
        if let Some(label) = inst.label.as_deref() {
            label_index.insert(label.to_string(), idx);
        }
    }

    let mut relax_id = 0;

    for (idx, mut inst) in instructions.into_iter().enumerate() {
        let mnem = inst.mnemonic.as_deref().unwrap_or("");
        if matches!(mnem, "jeq" | "jleq" | "jlt" | "jzero") {
            let ops = &inst.operands;
            if ops.len() == 3 {
                let target_label = &ops[2];
                let is_far_or_backward = if let Some(&target_idx) = label_index.get(target_label) {
                    target_idx < idx || target_idx.saturating_sub(idx) > 4095
                } else {
                    // Unknown label (possibly external), assume far
                    true
                };

                if is_far_or_backward {
                    let rs1 = &ops[0];
                    let rs2 = &ops[1];
                    let skip_label = format!("Lrelax_skip_{}", relax_id);
                    relax_id += 1;

                    // Compute comparison into %i31 (dedicated scratch register).
                    let cmp_mnem = match mnem {
                        "jeq"  => "ceq",
                        "jleq" => "cleq",
                        "jlt"  => "clt",
                        "jzero" => "ceq", // jzero rd, rs, tgt -> ceq %i31, rs, %i0
                        _ => unreachable!(),
                    };

                    let orig_label = inst.label.take();

                    if mnem == "jzero" {
                        // jzero rd, rs, tgt => ceq %i31, rs, %i0
                        out.push(Instruction {
                            label: orig_label,
                            mnemonic: Some("ceq".to_string()),
                            operands: vec!["%i31".to_string(), rs2.clone(), "%i0".to_string()],
                        });
                    } else {
                        // jeq/jleq/jlt rs1, rs2, tgt => ceq/cleq/clt %i31, rs1, rs2
                        out.push(Instruction {
                            label: orig_label,
                            mnemonic: Some(cmp_mnem.to_string()),
                            operands: vec!["%i31".to_string(), rs1.clone(), rs2.clone()],
                        });
                    }

                    // Branch over the jump if condition is false (%i31 == 0)
                    out.push(Instruction {
                        label: None,
                        mnemonic: Some("jzero".to_string()),
                        operands: vec!["%i0".to_string(), "%i31".to_string(), skip_label.clone()],
                    });

                    // Emit indirect jump to target via %i31
                    out.push(Instruction {
                        label: None,
                        mnemonic: Some("set_label".to_string()),
                        operands: vec!["%i31".to_string(), target_label.clone()],
                    });
                    out.push(Instruction {
                        label: None,
                        mnemonic: Some("jmp".to_string()),
                        operands: vec!["%i0".to_string(), "0(%i31)".to_string()],
                    });

                    // Attach skip label
                    out.push(Instruction {
                        label: Some(skip_label),
                        mnemonic: None,
                        operands: vec![],
                    });

                    rewrites += 1;
                    continue;
                }
            }
        }
        out.push(inst);
    }
    (out, rewrites)
}

/// Fold short unconditional forward jumps:
///   [opt-label:] set_label  %rX, TARGET
///                jmp        %i0, 0(%rX)
/// into:
///   [opt-label:] jzero      %i0, %i0, TARGET
/// when TARGET is a FORWARD label within 4095 instructions from current position.
/// jzero uses %i0 (zero register) as comparison: always 0 = unconditional branch.
/// Since each replacement removes 1 instruction, the actual offset is ≤ pre-computed
/// distance - 1, so the 4095 threshold is always safe.
pub fn fold_short_unconditional_jumps_opt(instructions: Vec<Instruction>) -> (Vec<Instruction>, usize) {
    let n = instructions.len();
    // Pre-compute label → original index
    let mut label_index: HashMap<String, usize> = HashMap::new();
    for (idx, inst) in instructions.iter().enumerate() {
        if let Some(label) = inst.label.as_deref() {
            label_index.insert(label.to_string(), idx);
        }
    }

    let mut out: Vec<Instruction> = Vec::with_capacity(n);
    let mut rewrites = 0usize;
    let mut i = 0;

    while i < n {
        let mnem = instructions[i].mnemonic.as_deref().unwrap_or("");

        if mnem == "set_label" && i + 1 < n {
            let ops = &instructions[i].operands;
            let next = &instructions[i + 1];
            let next_mnem = next.mnemonic.as_deref().unwrap_or("");

            // Pattern: set_label %rX, TARGET  /  jmp %i0, 0(%rX)
            if ops.len() == 2
                && next_mnem == "jmp"
                && next.label.is_none()
                && next.operands.len() == 2
                && next.operands[0] == "%i0"
            {
                let reg_x = &ops[0];
                let target = &ops[1];
                let expected_base = format!("0({})", reg_x);

                if next.operands[1] == expected_base
                    && reg_x != "%i0"  // exclude degenerate jmp %i0, 0(%i0)
                {
                    // Check forward + within 4095 (original coordinates; actual is ≤ this - 1)
                    if let Some(&target_idx) = label_index.get(target.as_str()) {
                        if target_idx > i && target_idx - i <= 4095 {
                            out.push(Instruction {
                                label: instructions[i].label.clone(),
                                mnemonic: Some("jzero".to_string()),
                                operands: vec![
                                    "%i0".to_string(),
                                    "%i0".to_string(),
                                    target.clone(),
                                ],
                            });
                            rewrites += 1;
                            i += 2;
                            continue;
                        }
                    }
                }
            }
        }

        out.push(instructions[i].clone());
        i += 1;
    }

    (out, rewrites)
}

pub fn global_access_opt(instructions: Vec<Instruction>) -> (Vec<Instruction>, usize) {
    let n = instructions.len();
    let mut next_write_i31: Vec<Option<usize>> = vec![None; n + 1];
    let mut next_use_i31: Vec<Option<usize>> = vec![None; n + 1];

    for i in (0..n).rev() {
        next_write_i31[i] = if writes_i31(&instructions[i]) {
            Some(i)
        } else {
            next_write_i31[i + 1]
        };
        next_use_i31[i] = if uses_i31(&instructions[i]) {
            Some(i)
        } else {
            next_use_i31[i + 1]
        };
    }

    let mut out = Vec::with_capacity(n);
    let mut i = 0usize;
    let mut rewrites = 0usize;

    // Active base means current architectural value is %i31 = upper << 12.
    let mut active_upper: Option<i32> = None;

    while i < n {
        if instructions[i].label.is_some() {
            // Control-flow can jump to labels, so linear %i31 value tracking is invalid across
            // basic-block entries.
            active_upper = None;
        }

        if i + 2 < n {
            let i0 = &instructions[i];
            let i1 = &instructions[i + 1];
            let i2 = &instructions[i + 2];

            if i1.label.is_none() && i2.label.is_none() {
                if let (Some(upper), Some(off), true) = (
                    parse_movui_i31(i0),
                    parse_ori_i31_self(i1),
                    is_zero_base_i31_mem(i2),
                ) {
                    if off < 0 {
                        // Keep conservative: negative OR-immediates do not reliably map to
                        // memory offset semantics across assemblers/simulators.
                        // Skip this pattern.
                    } else {
                        let start = i + 3;
                        let first_use = next_use_i31[start];
                        let first_write = next_write_i31[start];
                        let scan_end = first_write.unwrap_or(n);
                        let safe_to_drop_ori = match (first_use, first_write) {
                            (None, _) => true,
                            (Some(_), None) => false,
                            (Some(u), Some(w)) => u >= w,
                        };
                        let barrier_found = has_barrier_between(&instructions, start, scan_end);

                        if safe_to_drop_ori && !barrier_found {
                            // If the computed absolute address is in the low region and fits
                            // memory immediate range, canonicalize to %i0-base direct access.
                            if upper == 0 && (-2048..2048).contains(&off) {
                                let mut mem = i2.clone();
                                mem.operands[1] = format!("{}(%i0)", off);
                                if mem.label.is_none() {
                                    mem.label = i0.label.clone();
                                }
                                out.push(mem);
                                rewrites += 1;
                                active_upper = None;
                                i += 3;
                                continue;
                            }

                            if active_upper == Some(upper) && i0.label.is_none() {
                                let mut mem = i2.clone();
                                mem.operands[1] = format!("{}(%i31)", off);
                                if mem.label.is_none() {
                                    mem.label = i0.label.clone();
                                }
                                out.push(mem);
                                rewrites += 1;
                                i += 3;
                                continue;
                            }

                            let mut mem = i2.clone();
                            mem.operands[1] = format!("{}(%i31)", off);
                            out.push(i0.clone());
                            out.push(mem);
                            rewrites += 1;
                            active_upper = Some(upper);
                            i += 3;
                            continue;
                        }
                    }
                }
            }
        }

        let inst = instructions[i].clone();
        if let Some(upper) = parse_movui_i31(&inst) {
            active_upper = Some(upper);
        } else if writes_i31(&inst) {
            active_upper = None;
        } else if is_control_flow_barrier(&inst) {
            active_upper = None;
        }
        out.push(inst);
        i += 1;
    }

    (out, rewrites)
}

fn parse_movui_i31(inst: &Instruction) -> Option<i32> {
    if inst.mnemonic.as_deref() != Some("movui") || inst.operands.len() != 2 {
        return None;
    }
    if inst.operands[0] != "%i31" {
        return None;
    }
    inst.operands[1].parse::<i32>().ok()
}

fn parse_ori_i31_self(inst: &Instruction) -> Option<i32> {
    if inst.mnemonic.as_deref() != Some("ori") || inst.operands.len() != 3 {
        return None;
    }
    if inst.operands[0] != "%i31" || inst.operands[1] != "%i31" {
        return None;
    }
    inst.operands[2].parse::<i32>().ok()
}

fn is_zero_base_i31_mem(inst: &Instruction) -> bool {
    let Some(mnemonic) = inst.mnemonic.as_deref() else {
        return false;
    };
    if !matches!(mnemonic, "lw" | "sw" | "lb" | "lf" | "sf" | "sb") {
        return false;
    }
    inst.operands.len() == 2 && inst.operands[1] == "0(%i31)"
}

fn has_barrier_between(instructions: &[Instruction], start: usize, end: usize) -> bool {
    for inst in instructions.iter().take(end).skip(start) {
        if inst.label.is_some() || is_control_flow_barrier(inst) {
            return true;
        }
    }
    false
}

fn is_control_flow_barrier(inst: &Instruction) -> bool {
    let Some(mnemonic) = inst.mnemonic.as_deref() else {
        return false;
    };
    mnemonic == "ret" || mnemonic.starts_with('j')
}

fn writes_i31(inst: &Instruction) -> bool {
    let Some(mnemonic) = inst.mnemonic.as_deref() else {
        return false;
    };
    if inst.operands.is_empty() {
        return false;
    }
    if matches!(
        mnemonic,
        "sw" | "sb" | "sf" | "jzero" | "ret" | "call_dir" | "call_cls"
    ) || mnemonic.starts_with('.')
        || (mnemonic.starts_with('j') && mnemonic != "jmp")
    {
        return false;
    }
    if mnemonic == "jmp" {
        return inst.operands[0] == "%i31";
    }
    inst.operands[0] == "%i31"
}

fn uses_i31(inst: &Instruction) -> bool {
    let Some(mnemonic) = inst.mnemonic.as_deref() else {
        return false;
    };
    if mnemonic.starts_with('.') {
        return false;
    }

    let has_def = !(matches!(
        mnemonic,
        "sw" | "sb" | "sf" | "jzero" | "ret" | "call_dir" | "call_cls"
    ) || mnemonic.starts_with('.')
        || (mnemonic.starts_with('j') && mnemonic != "jmp"))
        && !inst.operands.is_empty();

    let ops: &[String] = if has_def && inst.operands.len() > 1 {
        &inst.operands[1..]
    } else if has_def {
        &[]
    } else {
        &inst.operands
    };

    for op in ops {
        if op == "%i31" {
            return true;
        }
        if let Some(start) = op.find('(') {
            if let Some(end) = op[start + 1..].find(')') {
                let base = op[start + 1..start + 1 + end].trim();
                if base == "%i31" {
                    return true;
                }
            }
        }
    }
    false
}

fn fold_zero_base_addr_opt(instructions: Vec<Instruction>) -> (Vec<Instruction>, usize) {
    let n = instructions.len();
    let mut out = Vec::with_capacity(n);
    let mut rewrites = 0usize;
    let mut i = 0usize;

    while i < n {
        if let Some((off, const_len)) = parse_i31_const_prefix(&instructions, i) {
            let add_idx = i + const_len;
            let mem_idx = add_idx + 1;
            if mem_idx < n
                && instructions[add_idx].label.is_none()
                && instructions[mem_idx].label.is_none()
                && is_add_i31_i0_i31(&instructions[add_idx])
                && is_zero_base_i31_mem_word(&instructions[mem_idx])
                && off % 4 == 0
            {
                let word_off = off / 4;
                if (-2048..2048).contains(&word_off) {
                    let mut mem = instructions[mem_idx].clone();
                    mem.operands[1] = format!("{}(%i0)", off);
                    if mem.label.is_none() {
                        mem.label = instructions[i].label.clone();
                    }
                    out.push(mem);
                    rewrites += 1;
                    i = mem_idx + 1;
                    continue;
                }
            }
        }

        out.push(instructions[i].clone());
        i += 1;
    }

    (out, rewrites)
}

fn parse_i31_movi(inst: &Instruction) -> Option<i32> {
    if inst.mnemonic.as_deref() != Some("movi") || inst.operands.len() != 2 {
        return None;
    }
    if inst.operands[0] != "%i31" {
        return None;
    }
    inst.operands[1].parse::<i32>().ok()
}

fn parse_i31_const_prefix(instructions: &[Instruction], i: usize) -> Option<(i32, usize)> {
    let inst0 = instructions.get(i)?;

    if let Some(v) = parse_i31_movi(inst0) {
        return Some((v, 1));
    }

    if inst0.mnemonic.as_deref() != Some("movui") || inst0.operands.len() != 2 {
        return None;
    }
    if inst0.operands[0] != "%i31" {
        return None;
    }

    let upper_raw = inst0.operands[1].parse::<u32>().ok()?;
    let upper = upper_raw & 0xFFFFF;
    let base = upper << 12;

    // movui-only form
    let Some(inst1) = instructions.get(i + 1) else {
        return Some((base as i32, 1));
    };
    if inst1.label.is_some() {
        return Some((base as i32, 1));
    }
    if inst1.operands.len() != 3 || inst1.operands[0] != "%i31" || inst1.operands[1] != "%i31" {
        return Some((base as i32, 1));
    }

    match inst1.mnemonic.as_deref() {
        Some("ori") => {
            let imm = inst1.operands[2].parse::<i32>().ok()?;
            let low = (imm as u32) & 0xFFF;
            Some((((base | low) as i32), 2))
        }
        Some("addi") => {
            let imm = inst1.operands[2].parse::<i32>().ok()?;
            Some((((base as i32).wrapping_add(imm)), 2))
        }
        _ => Some((base as i32, 1)),
    }
}

fn is_add_i31_i0_i31(inst: &Instruction) -> bool {
    if inst.mnemonic.as_deref() != Some("add") || inst.operands.len() != 3 {
        return false;
    }
    inst.operands[0] == "%i31"
        && ((inst.operands[1] == "%i0" && inst.operands[2] == "%i31")
            || (inst.operands[1] == "%i31" && inst.operands[2] == "%i0"))
}

fn is_zero_base_i31_mem_word(inst: &Instruction) -> bool {
    let Some(mnemonic) = inst.mnemonic.as_deref() else {
        return false;
    };
    matches!(mnemonic, "lw" | "sw" | "lf" | "sf")
        && inst.operands.len() == 2
        && inst.operands[1] == "0(%i31)"
}

fn scale_word_mem_offset_opt(instructions: Vec<Instruction>) -> (Vec<Instruction>, usize) {
    let mut out = Vec::with_capacity(instructions.len());
    let mut rewrites = 0usize;

    for mut inst in instructions {
        if let Some(mnem) = inst.mnemonic.as_deref() {
            if matches!(mnem, "lw" | "sw" | "lf" | "sf") && inst.operands.len() >= 2 {
                if let Some((off, base)) = parse_offset(&inst.operands[1]) {
                    if off % 4 == 0 {
                        let word_off = off / 4;
                        if (-2048..2048).contains(&word_off) {
                            let new_op = format!("{}({})", word_off, base);
                            if new_op != inst.operands[1] {
                                inst.operands[1] = new_op;
                                rewrites += 1;
                            }
                        }
                    }
                }
            }
        }
        out.push(inst);
    }

    (out, rewrites)
}

fn parse_offset(s: &str) -> Option<(i32, String)> {
    if let Some(start) = s.find('(') {
        if let Some(end) = s.find(')') {
            let off_str = &s[0..start];
            let base = &s[start + 1..end];
            if let Ok(off) = off_str.parse::<i32>() {
                return Some((off, base.to_string()));
            }
        }
    }
    None
}
