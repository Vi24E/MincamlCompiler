use crate::analysis;
use crate::input::Instruction;
use std::collections::{BTreeSet, HashMap, HashSet};

pub struct OptimizeResult {
    pub instructions: Vec<Instruction>,
    pub rewrites: usize,
}

fn is_boundary(inst: &Instruction) -> bool {
    if inst.label.is_some() {
        return true;
    }
    let Some(m) = inst.mnemonic.as_deref() else {
        return true;
    };
    if m.starts_with('.') {
        return true;
    }
    matches!(
        m,
        "lw" | "lf"
            | "lb"
            | "sw"
            | "sf"
            | "sb"
            | "jmp"
            | "jzero"
            | "jeq"
            | "jlt"
            | "jleq"
            | "ret"
            | "set_label"
            | "call_dir"
            | "call_cls"
    )
}

fn build_fma_from_pair(fmul: &Instruction, fadd: &Instruction) -> Option<Instruction> {
    if fmul.mnemonic.as_deref() != Some("fmul") || fadd.mnemonic.as_deref() != Some("fadd") {
        return None;
    }
    if fmul.operands.len() != 3 || fadd.operands.len() != 3 {
        return None;
    }

    let t = &fmul.operands[0];
    let a = &fmul.operands[1];
    let b = &fmul.operands[2];
    let dst = &fadd.operands[0];
    let x = &fadd.operands[1];
    let y = &fadd.operands[2];

    let c = if x == t {
        y.clone()
    } else if y == t {
        x.clone()
    } else {
        return None;
    };

    Some(Instruction {
        label: fadd.label.clone(),
        mnemonic: Some("fma".to_string()),
        operands: vec![dst.clone(), a.clone(), b.clone(), c],
    })
}

fn build_movi_fold_from_pair(movi: &Instruction, user: &Instruction) -> Option<Instruction> {
    if movi.mnemonic.as_deref() != Some("movi") || movi.operands.len() != 2 {
        return None;
    }
    let t = &movi.operands[0];
    let imm = &movi.operands[1];
    let Some(mn) = user.mnemonic.as_deref() else {
        return None;
    };

    match mn {
        "add" if user.operands.len() == 3 => {
            let dst = &user.operands[0];
            let x = &user.operands[1];
            let y = &user.operands[2];
            if x == t {
                Some(Instruction {
                    label: user.label.clone(),
                    mnemonic: Some("addi".to_string()),
                    operands: vec![dst.clone(), y.clone(), imm.clone()],
                })
            } else if y == t {
                Some(Instruction {
                    label: user.label.clone(),
                    mnemonic: Some("addi".to_string()),
                    operands: vec![dst.clone(), x.clone(), imm.clone()],
                })
            } else {
                None
            }
        }
        "sub" if user.operands.len() == 3 => {
            let dst = &user.operands[0];
            let x = &user.operands[1];
            let y = &user.operands[2];
            if y == t {
                Some(Instruction {
                    label: user.label.clone(),
                    mnemonic: Some("subi".to_string()),
                    operands: vec![dst.clone(), x.clone(), imm.clone()],
                })
            } else {
                None
            }
        }
        "sll" if user.operands.len() == 3 => {
            let dst = &user.operands[0];
            let x = &user.operands[1];
            let y = &user.operands[2];
            if y == t {
                Some(Instruction {
                    label: user.label.clone(),
                    mnemonic: Some("slli".to_string()),
                    operands: vec![dst.clone(), x.clone(), imm.clone()],
                })
            } else {
                None
            }
        }
        "ceq" if user.operands.len() == 3 => {
            let dst = &user.operands[0];
            let x = &user.operands[1];
            let y = &user.operands[2];
            if x == t {
                Some(Instruction {
                    label: user.label.clone(),
                    mnemonic: Some("ceqi".to_string()),
                    operands: vec![dst.clone(), y.clone(), imm.clone()],
                })
            } else if y == t {
                Some(Instruction {
                    label: user.label.clone(),
                    mnemonic: Some("ceqi".to_string()),
                    operands: vec![dst.clone(), x.clone(), imm.clone()],
                })
            } else {
                None
            }
        }
        "cleq" if user.operands.len() == 3 => {
            let dst = &user.operands[0];
            let x = &user.operands[1];
            let y = &user.operands[2];
            if y == t {
                Some(Instruction {
                    label: user.label.clone(),
                    mnemonic: Some("cleqi".to_string()),
                    operands: vec![dst.clone(), x.clone(), imm.clone()],
                })
            } else {
                None
            }
        }
        "clt" if user.operands.len() == 3 => {
            let dst = &user.operands[0];
            let x = &user.operands[1];
            let y = &user.operands[2];
            if y == t {
                Some(Instruction {
                    label: user.label.clone(),
                    mnemonic: Some("clti".to_string()),
                    operands: vec![dst.clone(), x.clone(), imm.clone()],
                })
            } else {
                None
            }
        }
        _ => None,
    }
}

fn imm_is_two(s: &str) -> bool {
    let t = s.trim();
    if t == "2" || t == "+2" {
        return true;
    }
    if let Ok(v) = t.parse::<i64>() {
        return v == 2;
    }
    let lower = t.to_ascii_lowercase();
    if let Some(rest) = lower.strip_prefix("0x") {
        return i64::from_str_radix(rest, 16)
            .map(|v| v == 2)
            .unwrap_or(false);
    }
    false
}

fn build_add4_from_pair(slli: &Instruction, add: &Instruction) -> Option<Instruction> {
    if slli.mnemonic.as_deref() != Some("slli") || add.mnemonic.as_deref() != Some("add") {
        return None;
    }
    if slli.operands.len() != 3 || add.operands.len() != 3 {
        return None;
    }
    if !imm_is_two(&slli.operands[2]) {
        return None;
    }

    let t = &slli.operands[0];
    let r = &slli.operands[1];
    let dst = &add.operands[0];
    let x = &add.operands[1];
    let y = &add.operands[2];

    let base = if x == t {
        y.clone()
    } else if y == t {
        x.clone()
    } else {
        return None;
    };

    Some(Instruction {
        label: add.label.clone(),
        mnemonic: Some("add4".to_string()),
        operands: vec![dst.clone(), base, r.clone()],
    })
}

fn is_real_instruction(inst: &Instruction) -> bool {
    match inst.mnemonic.as_deref() {
        Some(m) => !m.starts_with('.'),
        None => false,
    }
}

fn is_terminator(inst: &Instruction) -> bool {
    if let Some(mnemonic) = inst.mnemonic.as_deref() {
        mnemonic.starts_with('j') || mnemonic == "ret" || mnemonic.starts_with("call_")
    } else {
        false
    }
}

fn parse_mem_base(op: &str) -> Option<String> {
    let start = op.find('(')?;
    let end = op.find(')')?;
    if end <= start + 1 {
        return None;
    }
    Some(op[start + 1..end].trim().to_string())
}

fn inst_mentions_reg(inst: &Instruction, reg: &str) -> bool {
    for op in &inst.operands {
        if op == reg {
            return true;
        }
        if let Some(base) = parse_mem_base(op) {
            if base == reg {
                return true;
            }
        }
    }
    false
}

fn rewrite_like(orig: &Instruction, mnemonic: &str, operands: Vec<String>) -> Instruction {
    Instruction {
        label: orig.label.clone(),
        mnemonic: Some(mnemonic.to_string()),
        operands,
    }
}

fn imm_is_zero(s: &str) -> bool {
    let t = s.trim();
    if t == "0" || t == "+0" || t == "-0" {
        return true;
    }
    if let Ok(v) = t.parse::<i64>() {
        return v == 0;
    }
    let lower = t.to_ascii_lowercase();
    if let Some(rest) = lower.strip_prefix("0x") {
        return i64::from_str_radix(rest, 16)
            .map(|v| v == 0)
            .unwrap_or(false);
    }
    false
}

fn fold_sp_addi_subi_triplet(
    i0: &Instruction,
    i1: &Instruction,
    i2: &Instruction,
) -> Option<Instruction> {
    if i0.label.is_some() || i1.label.is_some() || i2.label.is_some() {
        return None;
    }
    if i0.mnemonic.as_deref() != Some("addi") || i2.mnemonic.as_deref() != Some("subi") {
        return None;
    }
    if i0.operands.len() != 3 || i2.operands.len() != 3 {
        return None;
    }
    if !is_real_instruction(i1) || is_terminator(i1) {
        return None;
    }

    let sp = "%i1";
    if i0.operands[0] != sp || i0.operands[1] != sp {
        return None;
    }
    if i2.operands[0] != sp || i2.operands[1] != sp {
        return None;
    }
    if i0.operands[2] != i2.operands[2] {
        return None;
    }
    if inst_mentions_reg(i1, sp) {
        return None;
    }

    Some(i1.clone())
}

fn fold_sp_addi_subi_sandwich_opt(instructions: Vec<Instruction>) -> (Vec<Instruction>, usize) {
    let mut out = Vec::with_capacity(instructions.len());
    let mut rewrites = 0usize;
    let mut i = 0usize;
    let n = instructions.len();

    while i < n {
        if i + 2 < n {
            if let Some(mid) = fold_sp_addi_subi_triplet(
                &instructions[i],
                &instructions[i + 1],
                &instructions[i + 2],
            ) {
                out.push(mid);
                rewrites += 1;
                i += 3;
                continue;
            }
        }
        out.push(instructions[i].clone());
        i += 1;
    }

    (out, rewrites)
}

fn fold_trivial_identities(instructions: Vec<Instruction>) -> (Vec<Instruction>, usize) {
    let mut out = Vec::with_capacity(instructions.len());
    let mut rewrites = 0usize;

    for inst in instructions {
        let mut replaced: Option<Instruction> = None;
        let mut remove_noop = false;

        if let Some(mn) = inst.mnemonic.as_deref() {
            match mn {
                "addi" | "subi" | "slli" | "sari" if inst.operands.len() == 3 => {
                    let dst = &inst.operands[0];
                    let src = &inst.operands[1];
                    let imm = &inst.operands[2];
                    if imm_is_zero(imm) {
                        if dst == src {
                            remove_noop = true;
                        } else {
                            replaced =
                                Some(rewrite_like(&inst, "mov", vec![dst.clone(), src.clone()]));
                        }
                    }
                }
                "ceq" | "cleq" | "clt" | "feq" | "fleq" | "flt" if inst.operands.len() == 3 => {
                    let dst = &inst.operands[0];
                    let lhs = &inst.operands[1];
                    let rhs = &inst.operands[2];
                    if lhs == rhs {
                        let value = match mn {
                            "clt" | "flt" => "0",
                            _ => "1",
                        };
                        if dst == "%i0" {
                            remove_noop = true;
                        } else {
                            replaced = Some(rewrite_like(
                                &inst,
                                "movi",
                                vec![dst.clone(), value.to_string()],
                            ));
                        }
                    }
                }
                "tern" if inst.operands.len() == 4 => {
                    let dst = &inst.operands[0];
                    let y = &inst.operands[2];
                    let z = &inst.operands[3];
                    if y == z {
                        if dst == y {
                            remove_noop = true;
                        } else {
                            replaced =
                                Some(rewrite_like(&inst, "mov", vec![dst.clone(), y.clone()]));
                        }
                    }
                }
                "ftern" if inst.operands.len() == 4 => {
                    let dst = &inst.operands[0];
                    let y = &inst.operands[2];
                    let z = &inst.operands[3];
                    if y == z {
                        if dst == y {
                            remove_noop = true;
                        } else {
                            replaced =
                                Some(rewrite_like(&inst, "fmov", vec![dst.clone(), y.clone()]));
                        }
                    }
                }
                _ => {}
            }
        }

        if let Some(new_inst) = replaced {
            rewrites += 1;
            out.push(new_inst);
            continue;
        }
        if remove_noop {
            rewrites += 1;
            if let Some(label) = inst.label.clone() {
                out.push(Instruction {
                    label: Some(label),
                    mnemonic: None,
                    operands: Vec::new(),
                });
            }
            continue;
        }
        out.push(inst);
    }

    (out, rewrites)
}

fn fold_window_with_dep_graph(window: &[Instruction]) -> (Vec<Instruction>, usize) {
    let n = window.len();
    if n < 2 {
        return (window.to_vec(), 0);
    }

    let analyzed: Vec<(BTreeSet<String>, BTreeSet<String>)> = window
        .iter()
        .map(|inst| analysis::collect_def_use(inst))
        .collect();

    // Build a sparse dependency graph (RAW/WAR/WAW) from def/use history.
    // This is the same dependency notion as reordering, but without full O(n^2) enumeration.
    let mut indeg = vec![0usize; n];
    let mut succ: Vec<HashSet<usize>> = (0..n).map(|_| HashSet::new()).collect();
    let mut succ_raw: Vec<HashSet<usize>> = (0..n).map(|_| HashSet::new()).collect();

    let mut last_def: HashMap<String, usize> = HashMap::new();
    let mut pending_uses: HashMap<String, Vec<usize>> = HashMap::new();

    let mut add_edge = |u: usize, v: usize, raw: bool| {
        if succ[u].insert(v) {
            indeg[v] += 1;
        }
        if raw {
            succ_raw[u].insert(v);
        }
    };

    for i in 0..n {
        let (defs, uses) = (&analyzed[i].0, &analyzed[i].1);

        // RAW: last def -> this use
        for r in uses {
            if let Some(&u) = last_def.get(r) {
                add_edge(u, i, true);
            }
            pending_uses.entry(r.clone()).or_default().push(i);
        }

        // WAW and WAR for each def
        for r in defs {
            if let Some(&u) = last_def.get(r) {
                add_edge(u, i, false);
            }
            if let Some(us) = pending_uses.get_mut(r) {
                for &u in us.iter() {
                    add_edge(u, i, false);
                }
                us.clear();
            }
            last_def.insert(r.clone(), i);
        }
    }

    let mut replace_at: Vec<Option<Instruction>> = vec![None; n];
    let mut remove = vec![false; n];
    let mut rewrites = 0usize;

    // Rule A: fmul node has exactly one outgoing edge, and that edge is RAW
    // to fadd consuming its result.
    // Note: indeg may be non-zero (its operands can be produced in the same window).
    for u in 0..n {
        if window[u].mnemonic.as_deref() != Some("fmul") {
            continue;
        }
        if succ[u].len() != 1 {
            continue;
        }
        let Some(&v) = succ[u].iter().next() else {
            continue;
        };
        if !succ_raw[u].contains(&v) {
            continue;
        };
        if remove[u] || remove[v] || replace_at[v].is_some() {
            continue;
        }
        let Some(fma) = build_fma_from_pair(&window[u], &window[v]) else {
            continue;
        };

        remove[u] = true;
        replace_at[v] = Some(fma);
        rewrites += 1;
    }

    // Rule B: movi leaf can be folded into its single RAW consumer.
    for u in 0..n {
        if window[u].mnemonic.as_deref() != Some("movi") {
            continue;
        }
        if indeg[u] != 0 || succ[u].len() != 1 {
            continue;
        }
        let Some(&v) = succ[u].iter().next() else {
            continue;
        };
        if !succ_raw[u].contains(&v) {
            continue;
        }
        if remove[u] || remove[v] || replace_at[v].is_some() {
            continue;
        }
        let Some(folded) = build_movi_fold_from_pair(&window[u], &window[v]) else {
            continue;
        };

        remove[u] = true;
        replace_at[v] = Some(folded);
        rewrites += 1;
    }

    // Rule C: slli by 2 can be folded into its single RAW add consumer.
    for u in 0..n {
        if window[u].mnemonic.as_deref() != Some("slli") {
            continue;
        }
        if succ[u].len() != 1 {
            continue;
        }
        let Some(&v) = succ[u].iter().next() else {
            continue;
        };
        if !succ_raw[u].contains(&v) {
            continue;
        }
        if remove[u] || remove[v] || replace_at[v].is_some() {
            continue;
        }
        let Some(folded) = build_add4_from_pair(&window[u], &window[v]) else {
            continue;
        };

        remove[u] = true;
        replace_at[v] = Some(folded);
        rewrites += 1;
    }

    if rewrites == 0 {
        return (window.to_vec(), 0);
    }

    let mut out = Vec::with_capacity(n - rewrites);
    for i in 0..n {
        if remove[i] {
            continue;
        }
        if let Some(inst) = replace_at[i].take() {
            out.push(inst);
        } else {
            out.push(window[i].clone());
        }
    }

    (out, rewrites)
}

pub fn optimize(instructions: Vec<Instruction>, _stage_name: &str) -> OptimizeResult {
    let mut out: Vec<Instruction> = Vec::with_capacity(instructions.len());
    let mut i = 0usize;
    let mut rewrites = 0usize;

    while i < instructions.len() {
        if is_boundary(&instructions[i]) {
            out.push(instructions[i].clone());
            i += 1;
            continue;
        }

        let start = i;
        i += 1;
        while i < instructions.len() && !is_boundary(&instructions[i]) {
            i += 1;
        }

        let (folded, rw) = fold_window_with_dep_graph(&instructions[start..i]);
        out.extend(folded);
        rewrites += rw;
    }

    // Stage3-equivalent safe local folds promoted into lite stage.
    let (out2, rw2) = fold_sp_addi_subi_sandwich_opt(out);
    let (out3, rw3) = fold_trivial_identities(out2);
    rewrites += rw2 + rw3;

    OptimizeResult {
        instructions: out3,
        rewrites,
    }
}
