use crate::analysis;
use crate::input::Instruction;
use crate::program;
use petgraph::algo::kosaraju_scc;
use petgraph::graph::{DiGraph, NodeIndex};
use std::collections::{BTreeMap, BTreeSet, HashMap, HashSet, VecDeque};

pub const THRESHOLD_ALIVE_DEFAULT: usize = 50;
pub const CHUNK_MAX_INIT_DEFAULT: usize = 5;
pub const CHUNK_MAX_LIMIT_DEFAULT: usize = 64;

#[derive(Clone, Copy, Debug)]
pub struct LongGapSpillConfig {
    pub threshold_alive: usize,
    pub chunk_max: usize,
    pub exclude_loop_vars: bool,
}

impl Default for LongGapSpillConfig {
    fn default() -> Self {
        Self {
            threshold_alive: THRESHOLD_ALIVE_DEFAULT,
            chunk_max: CHUNK_MAX_INIT_DEFAULT,
            exclude_loop_vars: false,
        }
    }
}

#[derive(Default, Debug, Clone, Copy)]
pub struct LongGapSpillStats {
    pub functions: usize,
    pub virtual_regs_seen: usize,
    pub candidates: usize,
    pub applied: usize,
    pub inserted_loads: usize,
    pub inserted_stores: usize,
    pub skipped_loop_vars: usize,
}

pub struct LongGapSpillResult {
    pub instructions: Vec<Instruction>,
    pub stats: LongGapSpillStats,
}

#[derive(Clone)]
struct Candidate {
    reg: String,
    def_idx: usize,
    long_gap_use_idxs: Vec<usize>,
    is_float: bool,
}

fn is_virtual_reg(r: &str) -> bool {
    r.starts_with("%vi") || r.starts_with("%vf")
}

fn is_float_virtual(r: &str) -> bool {
    r.starts_with("%vf")
}

fn is_control_or_barrier(inst: &Instruction) -> bool {
    let Some(m) = inst.mnemonic.as_deref() else {
        return true;
    };
    if m.starts_with('.') {
        return true;
    }
    matches!(
        m,
        "jmp" | "jzero" | "jeq" | "jlt" | "jleq" | "ret" | "call_dir" | "call_cls" | "set_label"
    )
}

fn parse_offset_operand(s: &str) -> Option<(i32, String)> {
    let start = s.find('(')?;
    let end = s.find(')')?;
    if end <= start + 1 {
        return None;
    }
    let off_str = s[..start].trim();
    let base = s[start + 1..end].trim().to_string();
    let off = if off_str.is_empty() {
        0
    } else {
        off_str.parse::<i32>().ok()?
    };
    Some((off, base))
}

fn build_preds(analyzed: &[analysis::AnalyzedInstruction]) -> Vec<Vec<usize>> {
    let mut preds = vec![Vec::new(); analyzed.len()];
    for (idx, inst) in analyzed.iter().enumerate() {
        for &to in &inst.succ {
            if to < analyzed.len() {
                preds[to].push(idx);
            }
        }
    }
    preds
}

enum SourceDistanceClass {
    Near,
    Far,
    Unreachable,
}

fn classify_nearest_source_distance(
    preds: &[Vec<usize>],
    use_idx: usize,
    source_set: &HashSet<usize>,
    self_idx: usize,
    threshold_alive: usize,
    comp_of: &[usize],
    comp_is_loop: &[bool],
) -> SourceDistanceClass {
    if use_idx >= preds.len() {
        return SourceDistanceClass::Unreachable;
    }
    if use_idx < comp_of.len() {
        let use_cid = comp_of[use_idx];
        if use_cid < comp_is_loop.len() && comp_is_loop[use_cid] {
            for &s in source_set {
                if s != self_idx && s < comp_of.len() && comp_of[s] == use_cid {
                    return SourceDistanceClass::Near;
                }
            }
        }
    }
    let mut visited = vec![false; preds.len()];
    let mut q: VecDeque<(usize, usize)> = VecDeque::new();
    for &p in &preds[use_idx] {
        if p < preds.len() && !visited[p] {
            visited[p] = true;
            q.push_back((p, 1));
        }
    }
    while let Some((cur, dist)) = q.pop_front() {
        if cur != self_idx && source_set.contains(&cur) {
            if dist >= threshold_alive {
                return SourceDistanceClass::Far;
            }
            return SourceDistanceClass::Near;
        }
        for &p in &preds[cur] {
            if p < preds.len() && !visited[p] {
                visited[p] = true;
                q.push_back((p, dist + 1));
            }
        }
    }
    SourceDistanceClass::Unreachable
}

fn build_loop_node_mask(analyzed: &[analysis::AnalyzedInstruction]) -> Vec<bool> {
    let n = analyzed.len();
    let mut graph: DiGraph<(), ()> = DiGraph::new();
    let mut nodes: Vec<NodeIndex> = Vec::with_capacity(n);
    for _ in 0..n {
        nodes.push(graph.add_node(()));
    }
    let mut self_loop = vec![false; n];
    for (i, inst) in analyzed.iter().enumerate() {
        for &to in &inst.succ {
            if to >= n {
                continue;
            }
            graph.add_edge(nodes[i], nodes[to], ());
            if to == i {
                self_loop[i] = true;
            }
        }
    }

    let mut in_loop = vec![false; n];
    for comp in kosaraju_scc(&graph) {
        if comp.len() > 1 {
            for ni in comp {
                in_loop[ni.index()] = true;
            }
        } else if let Some(ni) = comp.first() {
            let idx = ni.index();
            if self_loop[idx] {
                in_loop[idx] = true;
            }
        }
    }
    in_loop
}

fn build_scc_info(analyzed: &[analysis::AnalyzedInstruction]) -> (Vec<usize>, Vec<bool>) {
    let n = analyzed.len();
    let mut graph: DiGraph<(), ()> = DiGraph::new();
    let mut nodes: Vec<NodeIndex> = Vec::with_capacity(n);
    for _ in 0..n {
        nodes.push(graph.add_node(()));
    }
    let mut self_loop = vec![false; n];
    for (i, inst) in analyzed.iter().enumerate() {
        for &to in &inst.succ {
            if to >= n {
                continue;
            }
            graph.add_edge(nodes[i], nodes[to], ());
            if to == i {
                self_loop[i] = true;
            }
        }
    }

    let comps = kosaraju_scc(&graph);
    let mut comp_of = vec![0usize; n];
    let mut comp_is_loop = vec![false; comps.len()];
    for (cid, comp) in comps.iter().enumerate() {
        let loop_like = if comp.len() > 1 {
            true
        } else if let Some(ni) = comp.first() {
            self_loop[ni.index()]
        } else {
            false
        };
        comp_is_loop[cid] = loop_like;
        for ni in comp {
            comp_of[ni.index()] = cid;
        }
    }
    (comp_of, comp_is_loop)
}

fn next_spill_slot_start(func_insts: &[Instruction]) -> i32 {
    let mut existing_max = 0i32;
    for inst in func_insts {
        for op in &inst.operands {
            if let Some((off, base)) = parse_offset_operand(op) {
                if base == "%i1" && off >= 0 && off + 4 > existing_max {
                    existing_max = off + 4;
                }
            }
        }
    }
    existing_max / 4
}

fn emit_load(reg: &str, off_bytes: i32, is_float: bool) -> Instruction {
    Instruction {
        label: None,
        mnemonic: Some(if is_float {
            "lf".to_string()
        } else {
            "lw".to_string()
        }),
        operands: vec![reg.to_string(), format!("{}(%i1)", off_bytes)],
    }
}

fn emit_store(reg: &str, off_bytes: i32, is_float: bool) -> Instruction {
    Instruction {
        label: None,
        mnemonic: Some(if is_float {
            "sf".to_string()
        } else {
            "sw".to_string()
        }),
        operands: vec![reg.to_string(), format!("{}(%i1)", off_bytes)],
    }
}

fn rewrite_function(
    func_insts: &[Instruction],
    cfg: LongGapSpillConfig,
    stats: &mut LongGapSpillStats,
) -> Vec<Instruction> {
    let analyzed = analysis::analyze(func_insts);
    let preds = build_preds(&analyzed);
    let (comp_of, comp_is_loop) = build_scc_info(&analyzed);
    let in_loop = if cfg.exclude_loop_vars {
        Some(build_loop_node_mask(&analyzed))
    } else {
        None
    };

    let mut def_sites: HashMap<String, Vec<usize>> = HashMap::new();
    let mut use_sites: HashMap<String, Vec<usize>> = HashMap::new();
    for (idx, info) in analyzed.iter().enumerate() {
        for d in &info.defs {
            if is_virtual_reg(d) {
                def_sites.entry(d.clone()).or_default().push(idx);
            }
        }
        for u in &info.uses {
            if is_virtual_reg(u) {
                use_sites.entry(u.clone()).or_default().push(idx);
            }
        }
    }

    let mut unique_regs: BTreeSet<String> = BTreeSet::new();
    for r in def_sites.keys() {
        unique_regs.insert(r.clone());
    }
    for r in use_sites.keys() {
        unique_regs.insert(r.clone());
    }
    stats.virtual_regs_seen += unique_regs.len();

    let mut candidates: Vec<Candidate> = Vec::new();

    for reg in unique_regs {
        let uses = use_sites.get(&reg).cloned().unwrap_or_default();
        if uses.is_empty() {
            continue;
        }
        let defs = def_sites.get(&reg).cloned().unwrap_or_default();
        if defs.len() != 1 {
            continue;
        }
        let def_idx = defs[0];
        if def_idx >= func_insts.len() || is_control_or_barrier(&func_insts[def_idx]) {
            continue;
        }

        if let Some(loop_mask) = in_loop.as_ref() {
            let mut touched_loop = false;
            if loop_mask[def_idx] {
                touched_loop = true;
            } else {
                for &u in &uses {
                    if u < loop_mask.len() && loop_mask[u] {
                        touched_loop = true;
                        break;
                    }
                }
            }
            if touched_loop {
                stats.skipped_loop_vars += 1;
                continue;
            }
        }

        let mut all_sources: HashSet<usize> = HashSet::new();
        all_sources.insert(def_idx);
        for &u in &uses {
            all_sources.insert(u);
        }

        let mut long_gap_starts: Vec<usize> = Vec::new();
        let mut unreachable_found = false;
        for &u in &uses {
            match classify_nearest_source_distance(
                &preds,
                u,
                &all_sources,
                u,
                cfg.threshold_alive,
                &comp_of,
                &comp_is_loop,
            ) {
                SourceDistanceClass::Near => {}
                SourceDistanceClass::Far => long_gap_starts.push(u),
                SourceDistanceClass::Unreachable => {
                    unreachable_found = true;
                    break;
                }
            }
        }
        if unreachable_found {
            continue;
        }

        let chunk_count = 1 + long_gap_starts.len();
        if chunk_count >= 2 && chunk_count <= cfg.chunk_max && !long_gap_starts.is_empty() {
            stats.candidates += 1;
            candidates.push(Candidate {
                reg: reg.clone(),
                def_idx,
                long_gap_use_idxs: long_gap_starts,
                is_float: is_float_virtual(&reg),
            });
        }
    }

    if candidates.is_empty() {
        return func_insts.to_vec();
    }

    candidates.sort_by(|a, b| a.reg.cmp(&b.reg));
    let mut reg_slot: BTreeMap<String, i32> = BTreeMap::new();
    let mut next_slot = next_spill_slot_start(func_insts);
    for c in &candidates {
        if !reg_slot.contains_key(&c.reg) {
            reg_slot.insert(c.reg.clone(), next_slot);
            next_slot += 1;
        }
    }

    let mut load_before: BTreeMap<usize, Vec<(String, i32, bool)>> = BTreeMap::new();
    let mut store_after: BTreeMap<usize, Vec<(String, i32, bool)>> = BTreeMap::new();
    let mut unique_applied: BTreeSet<String> = BTreeSet::new();
    for c in &candidates {
        let Some(&slot) = reg_slot.get(&c.reg) else {
            continue;
        };
        let off_bytes = slot * 4;
        for &u in &c.long_gap_use_idxs {
            load_before
                .entry(u)
                .or_default()
                .push((c.reg.clone(), off_bytes, c.is_float));
        }
        store_after
            .entry(c.def_idx)
            .or_default()
            .push((c.reg.clone(), off_bytes, c.is_float));
        unique_applied.insert(c.reg.clone());
    }

    for v in load_before.values_mut() {
        v.sort_by(|a, b| a.0.cmp(&b.0));
    }
    for v in store_after.values_mut() {
        v.sort_by(|a, b| a.0.cmp(&b.0));
    }

    let mut out = Vec::with_capacity(func_insts.len() + load_before.len() + store_after.len());
    for (idx, original) in func_insts.iter().enumerate() {
        let mut inst = original.clone();

        if let Some(loads) = load_before.get(&idx) {
            let mut emitted: Vec<Instruction> = loads
                .iter()
                .map(|(reg, off, is_float)| emit_load(reg, *off, *is_float))
                .collect();
            if let Some(lbl) = inst.label.take() {
                if let Some(first) = emitted.first_mut() {
                    first.label = Some(lbl);
                }
            }
            stats.inserted_loads += emitted.len();
            out.extend(emitted);
        }

        if inst.label.is_some() || inst.mnemonic.is_some() {
            out.push(inst);
        }

        if let Some(stores) = store_after.get(&idx) {
            let emitted: Vec<Instruction> = stores
                .iter()
                .map(|(reg, off, is_float)| emit_store(reg, *off, *is_float))
                .collect();
            stats.inserted_stores += emitted.len();
            out.extend(emitted);
        }
    }

    stats.applied += unique_applied.len();
    out
}

pub fn apply_with_config(
    instructions: Vec<Instruction>,
    cfg: LongGapSpillConfig,
) -> LongGapSpillResult {
    let ranges = program::partition_function_ranges(&instructions);
    let mut out = Vec::with_capacity(instructions.len());
    let mut stats = LongGapSpillStats::default();

    for range in ranges {
        stats.functions += 1;
        let func_insts = &instructions[range.clone()];
        let rewritten = rewrite_function(func_insts, cfg, &mut stats);
        out.extend(rewritten);
    }

    LongGapSpillResult {
        instructions: out,
        stats,
    }
}
