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
        "lw"
            | "lf"
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

    // Rule: fmul node is a leaf-source (indeg=0), has exactly one outgoing edge,
    // that edge is RAW and points to fadd consuming its result.
    for u in 0..n {
        if window[u].mnemonic.as_deref() != Some("fmul") {
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

    OptimizeResult {
        instructions: out,
        rewrites,
    }
}
