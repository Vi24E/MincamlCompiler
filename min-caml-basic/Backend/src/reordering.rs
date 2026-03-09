use crate::analysis;
use crate::input::Instruction;
use std::collections::BTreeSet;

pub struct ReorderResult {
    pub instructions: Vec<Instruction>,
    pub seed: u64,
    pub windows: usize,
    pub swaps: usize,
}

#[derive(Clone, Copy, Debug)]
pub struct ReorderCostConfig {
    pub def_cost: i32,
    pub load_cost: i32,
    pub raw_cost: i32,
    pub war_cost: i32,
    pub waw_cost: i32,
    pub live_end_bonus: i32,
}

impl Default for ReorderCostConfig {
    fn default() -> Self {
        Self {
            def_cost: 2,
            load_cost: 5,
            raw_cost: 3,
            war_cost: 3,
            waw_cost: 3,
            live_end_bonus: 1,
        }
    }
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
    0x53a9_7f01_d221_4c3b
}

fn is_control_or_barrier_mnemonic(m: &str) -> bool {
    if m.starts_with('.') {
        return true;
    }
    matches!(
        m,
        "sw" | "sf" | "sb" | "jmp" | "jzero" | "jeq" | "jlt" | "jleq" | "ret" | "set_label"
    )
}

fn is_pure_mnemonic(m: &str) -> bool {
    matches!(
        m,
        "lw"
            | "lf"
            | "lb"
            |
            // Integer / compare
            "add"
            | "add4"
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
            | "fma"
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
            | "fabs"
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
    matches!(
        inst.mnemonic.as_deref(),
        Some("call_dir") | Some("call_cls")
    )
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

#[derive(Clone, Copy, Debug, Default)]
struct DepKind {
    raw: bool,
    war: bool,
    waw: bool,
    barrier: bool,
}

impl DepKind {
    fn has_any(self) -> bool {
        self.raw || self.war || self.waw || self.barrier
    }
}

fn dependency_kind(
    left_inst: &Instruction,
    left_def: &BTreeSet<String>,
    left_use: &BTreeSet<String>,
    right_inst: &Instruction,
    right_def: &BTreeSet<String>,
    right_use: &BTreeSet<String>,
) -> DepKind {
    let mut kind = DepKind::default();
    // Safety: keep relative order around calls.
    if is_call(left_inst) || is_call(right_inst) {
        kind.barrier = true;
        return kind;
    }
    // RAW
    if !left_def.is_disjoint(right_use) {
        kind.raw = true;
    }
    // WAR
    if !right_def.is_disjoint(left_use) {
        kind.war = true;
    }
    // WAW
    if !left_def.is_disjoint(right_def) {
        kind.waw = true;
    }
    kind
}

#[derive(Clone)]
struct WindowNode {
    inst: Instruction,
    priority: u8,
    defs: BTreeSet<String>,
    uses: BTreeSet<String>,
    base_cost: i32,
    boosted_cost: i32,
    last_touch_turn: usize,
}

fn current_cost(node: &WindowNode, turn: usize) -> i32 {
    let dt = (turn.saturating_sub(node.last_touch_turn)) as i32;
    (node.boosted_cost - dt).max(node.base_cost)
}

fn raise_cost_to(node: &mut WindowNode, turn: usize, floor: i32) {
    let cur = current_cost(node, turn);
    node.last_touch_turn = turn;
    node.boosted_cost = cur.max(floor);
}

fn apply_edge_cost(node: &mut WindowNode, turn: usize, kind: DepKind, cfg: ReorderCostConfig) {
    if kind.raw {
        raise_cost_to(node, turn, node.base_cost + cfg.raw_cost);
    }
    if kind.war {
        raise_cost_to(node, turn, node.base_cost + cfg.war_cost);
    }
    if kind.waw {
        raise_cost_to(node, turn, node.base_cost + cfg.waw_cost);
    }
}

pub fn reorder_with_config(
    instructions: Vec<Instruction>,
    seed: Option<u64>,
    cfg: ReorderCostConfig,
) -> ReorderResult {
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
        let mut window: Vec<WindowNode> = Vec::with_capacity(len);
        for idx in start..i {
            let (defs, uses) = analysis::collect_def_use(&instructions[idx]);
            let p = analyzed
                .get(idx)
                .map(|x| instruction_priority(&instructions[idx], &x.live_out))
                .unwrap_or(2);
            let mut base_cost = if defs.is_empty() { 0 } else { cfg.def_cost };
            if p == 1 {
                base_cost -= cfg.live_end_bonus;
            }
            window.push(WindowNode {
                inst: instructions[idx].clone(),
                priority: p,
                defs,
                uses,
                base_cost,
                boosted_cost: base_cost,
                last_touch_turn: 0,
            });
        }

        // Build dependence DAG (u -> v if u must appear before v).
        let mut adj: Vec<Vec<(usize, DepKind)>> = vec![Vec::new(); len];
        let mut indeg: Vec<usize> = vec![0; len];
        for u in 0..len {
            for v in (u + 1)..len {
                let dep = dependency_kind(
                    &window[u].inst,
                    &window[u].defs,
                    &window[u].uses,
                    &window[v].inst,
                    &window[v].defs,
                    &window[v].uses,
                );
                if dep.has_any() {
                    adj[u].push((v, dep));
                    indeg[v] += 1;
                }
            }
        }

        // Cost-aware topological sort:
        // choose minimum current cost first; random tie-break.
        let mut ready: Vec<usize> = indeg
            .iter()
            .enumerate()
            .filter_map(|(idx, d)| if *d == 0 { Some(idx) } else { None })
            .collect();
        let mut order: Vec<usize> = Vec::with_capacity(len);
        let mut turn: usize = 0;
        while !ready.is_empty() {
            let mut min_cost = i32::MAX;
            for &n in &ready {
                min_cost = min_cost.min(current_cost(&window[n], turn));
            }
            let same_cost: Vec<usize> = ready
                .iter()
                .enumerate()
                .filter_map(|(ri, &n)| {
                    if current_cost(&window[n], turn) == min_cost {
                        Some(ri)
                    } else {
                        None
                    }
                })
                .collect();
            // Secondary key: old priority to preserve previous intent, then random.
            let min_priority = same_cost
                .iter()
                .map(|&ri| window[ready[ri]].priority)
                .min()
                .unwrap_or(2);
            let same_cost_same_priority: Vec<usize> = same_cost
                .into_iter()
                .filter(|&ri| window[ready[ri]].priority == min_priority)
                .collect();
            let chosen_pos_in_ready = if same_cost_same_priority.len() == 1 {
                same_cost_same_priority[0]
            } else {
                same_cost_same_priority[rng.gen_range(same_cost_same_priority.len())]
            };
            let chosen = ready.swap_remove(chosen_pos_in_ready);
            order.push(chosen);

            let is_lw = matches!(window[chosen].inst.mnemonic.as_deref(), Some("lw"));
            let loaded_reg = if is_lw && window[chosen].defs.len() == 1 {
                window[chosen].defs.iter().next().cloned()
            } else {
                None
            };

            for &(to, dep) in &adj[chosen] {
                indeg[to] -= 1;
                if indeg[to] == 0 {
                    ready.push(to);
                }
                apply_edge_cost(&mut window[to], turn, dep, cfg);
                if let Some(rx) = loaded_reg.as_ref() {
                    if dep.raw && window[to].uses.contains(rx) {
                        let floor = window[to].base_cost + cfg.load_cost;
                        raise_cost_to(&mut window[to], turn, floor);
                    }
                }
            }
            turn += 1;
        }

        if order.len() != len {
            for node in window {
                out.push(node.inst);
            }
            continue;
        }

        for (pos, &idx_in_window) in order.iter().enumerate() {
            if idx_in_window != pos {
                swaps += 1;
            }
            out.push(window[idx_in_window].inst.clone());
        }
    }

    ReorderResult {
        instructions: out,
        seed: chosen_seed,
        windows,
        swaps,
    }
}
