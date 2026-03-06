use crate::analysis;
use crate::input::Instruction;
use std::time::{SystemTime, UNIX_EPOCH};
use std::collections::BTreeSet;

pub struct ReorderResult {
    pub instructions: Vec<Instruction>,
    pub seed: u64,
    pub windows: usize,
    pub swaps: usize,
}

struct XorShift64 {
    state: u64,
}

impl XorShift64 {
    fn new(seed: u64) -> Self {
        // Avoid zero-cycle state.
        let init = if seed == 0 {
            0x9e37_79b9_7f4a_7c15
        } else {
            seed
        };
        Self { state: init }
    }

    fn next_u64(&mut self) -> u64 {
        let mut x = self.state;
        x ^= x << 13;
        x ^= x >> 7;
        x ^= x << 17;
        self.state = x;
        x
    }

    fn gen_range(&mut self, upper_exclusive: usize) -> usize {
        if upper_exclusive <= 1 {
            0
        } else {
            (self.next_u64() as usize) % upper_exclusive
        }
    }
}

fn default_seed() -> u64 {
    let now = SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .unwrap_or_default();
    (now.as_nanos() as u64) ^ 0xa5a5_5a5a_c3c3_3c3c
}

fn is_control_or_barrier_mnemonic(m: &str) -> bool {
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
    )
}

fn is_pure_mnemonic(m: &str) -> bool {
    matches!(
        m,
        "add"
            | "sub"
            | "sll"
            | "sar"
            | "xor"
            | "ceq"
            | "cleq"
            | "clt"
            | "addi"
            | "subi"
            | "slli"
            | "sari"
            | "ori"
            | "xori"
            | "ceqi"
            | "cleqi"
            | "clti"
            | "fadd"
            | "fsub"
            | "fmul"
            | "fdiv"
            | "feq"
            | "fneq"
            | "fleq"
            | "flt"
            | "mov"
            | "neg"
            | "fmov"
            | "fneg"
            | "finv"
            | "frsqrt"
            | "ffloor"
            | "ftoi"
            | "itof"
            | "mif"
            | "movi"
            | "movui"
            | "call_dir"
            | "call_cls"
    )
}

fn is_virtual_register(r: &str) -> bool {
    r.starts_with("%vi") || r.starts_with("%vf")
}

fn is_movable(inst: &Instruction) -> bool {
    // Keep label-attached instructions fixed, otherwise jump targets can shift.
    if inst.label.is_some() {
        return false;
    }
    let Some(m) = inst.mnemonic.as_deref() else {
        return false;
    };
    if is_control_or_barrier_mnemonic(m) || !is_pure_mnemonic(m) {
        return false;
    }
    if is_call(inst) {
        return true;
    }
    let (defs, uses) = analysis::collect_def_use(inst);
    defs.iter().all(|r| is_virtual_register(r)) && uses.iter().all(|r| is_virtual_register(r))
}

fn is_call(inst: &Instruction) -> bool {
    matches!(inst.mnemonic.as_deref(), Some("call_dir") | Some("call_cls"))
}

fn instruction_priority(inst: &Instruction, live_out: &BTreeSet<String>) -> u8 {
    // 1: some variable dies here (last use)
    // 2: others
    // 3: function call
    if is_call(inst) {
        return 3;
    }

    let (_defs, uses) = analysis::collect_def_use(inst);
    for u in &uses {
        if is_virtual_register(u) && !live_out.contains(u) {
            return 1;
        }
    }
    2
}

fn has_dependency(
    left_inst: &Instruction,
    left_def: &BTreeSet<String>,
    left_use: &BTreeSet<String>,
    right_inst: &Instruction,
    right_def: &BTreeSet<String>,
    right_use: &BTreeSet<String>,
) -> bool {
    // Safety: keep relative order around calls.
    if is_call(left_inst) || is_call(right_inst) {
        return true;
    }
    // RAW
    if !left_def.is_disjoint(right_use) {
        return true;
    }
    // WAR
    if !right_def.is_disjoint(left_use) {
        return true;
    }
    // WAW
    if !left_def.is_disjoint(right_def) {
        return true;
    }
    false
}

pub fn reorder(instructions: Vec<Instruction>, seed: Option<u64>) -> ReorderResult {
    let chosen_seed = seed.unwrap_or_else(default_seed);
    let mut rng = XorShift64::new(chosen_seed);
    let analyzed = analysis::analyze(&instructions);
    let mut out = Vec::with_capacity(instructions.len());
    let mut i = 0usize;
    let mut windows = 0usize;
    let mut swaps = 0usize;

    while i < instructions.len() {
        if !is_movable(&instructions[i]) {
            out.push(instructions[i].clone());
            i += 1;
            continue;
        }

        let start = i;
        i += 1;
        while i < instructions.len() && is_movable(&instructions[i]) {
            i += 1;
        }
        let len = i - start;
        if len < 2 {
            out.push(instructions[start].clone());
            continue;
        }

        windows += 1;
        let mut window: Vec<(Instruction, u8, BTreeSet<String>, BTreeSet<String>)> =
            Vec::with_capacity(len);
        for idx in start..i {
            let (defs, uses) = analysis::collect_def_use(&instructions[idx]);
            let p = analyzed
                .get(idx)
                .map(|x| instruction_priority(&instructions[idx], &x.live_out))
                .unwrap_or(2);
            window.push((instructions[idx].clone(), p, defs, uses));
        }

        // Build dependence DAG (u -> v if u must appear before v).
        let mut adj: Vec<Vec<usize>> = vec![Vec::new(); len];
        let mut indeg: Vec<usize> = vec![0; len];
        for u in 0..len {
            for v in (u + 1)..len {
                if has_dependency(
                    &window[u].0,
                    &window[u].2,
                    &window[u].3,
                    &window[v].0,
                    &window[v].2,
                    &window[v].3,
                ) {
                    adj[u].push(v);
                    indeg[v] += 1;
                }
            }
        }

        // Priority-aware topological sort:
        // choose minimum priority first; random tie-break.
        let mut ready: Vec<usize> = indeg
            .iter()
            .enumerate()
            .filter_map(|(idx, d)| if *d == 0 { Some(idx) } else { None })
            .collect();
        let mut order: Vec<usize> = Vec::with_capacity(len);
        while !ready.is_empty() {
            let mut min_p = u8::MAX;
            for &n in &ready {
                min_p = min_p.min(window[n].1);
            }
            let same_p: Vec<usize> = ready
                .iter()
                .enumerate()
                .filter_map(|(ri, &n)| if window[n].1 == min_p { Some(ri) } else { None })
                .collect();
            let chosen_pos_in_ready = if same_p.len() == 1 {
                same_p[0]
            } else {
                same_p[rng.gen_range(same_p.len())]
            };
            let chosen = ready.swap_remove(chosen_pos_in_ready);
            order.push(chosen);
            for &to in &adj[chosen] {
                indeg[to] -= 1;
                if indeg[to] == 0 {
                    ready.push(to);
                }
            }
        }

        if order.len() != len {
            for (inst, _, _, _) in window {
                out.push(inst);
            }
            continue;
        }

        for (pos, &idx_in_window) in order.iter().enumerate() {
            if idx_in_window != pos {
                swaps += 1;
            }
            out.push(window[idx_in_window].0.clone());
        }
    }

    ReorderResult {
        instructions: out,
        seed: chosen_seed,
        windows,
        swaps,
    }
}
