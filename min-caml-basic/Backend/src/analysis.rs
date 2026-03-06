/// Liveness analysis and interference graph construction.
use crate::input::Instruction;
use std::collections::{BTreeMap, BTreeSet, HashMap, HashSet, VecDeque};

fn call_debug_enabled() -> bool {
    std::env::var("BACKEND_DEBUG_CALL")
        .map(|v| v != "0")
        .unwrap_or(false)
}

fn live_debug_enabled() -> bool {
    std::env::var("BACKEND_DEBUG_LIVE")
        .map(|v| v != "0")
        .unwrap_or(false)
}

fn cfg_debug_enabled() -> bool {
    std::env::var("BACKEND_DEBUG_CFG")
        .map(|v| v != "0")
        .unwrap_or(false)
}

fn debug_var_name() -> Option<String> {
    std::env::var("BACKEND_DEBUG_VAR").ok()
}

#[derive(Debug, Clone)]
pub struct AnalyzedInstruction {
    pub instruction: Instruction,
    pub defs: BTreeSet<String>,
    pub uses: BTreeSet<String>,
    pub live_in: BTreeSet<String>,
    pub live_out: BTreeSet<String>,
    pub succ: Vec<usize>,
}

fn is_register(s: &str) -> bool {
    s.starts_with('%')
}

fn add_call_clobbers(defs: &mut BTreeSet<String>) {
    // In this backend, finalize expands calls with full caller-save around call.
    // Therefore pseudo-call clobber at allocation stage should be only return regs.
    defs.insert("%i30".to_string());
    defs.insert("%f30".to_string());
}

/// Check if a register is a virtual register (needs coloring).
fn is_virtual_register(s: &str) -> bool {
    s.starts_with("%vi") || s.starts_with("%vf")
}

/// Check if a register should be included in the interference graph.
/// Only virtual registers (%vi*, %vf*) are graph nodes.
fn is_graph_register(s: &str) -> bool {
    is_virtual_register(s)
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

fn expect_direct_reg(op: &str, mnemonic: &str, index: usize) -> String {
    if !is_register(op) {
        panic!(
            "analysis::get_def_use: expected register operand at {}[{}], got '{}'",
            mnemonic, index, op
        );
    }
    op.to_string()
}

fn expect_offset_base_reg(op: &str, mnemonic: &str, index: usize) -> String {
    let Some((_, base)) = parse_offset_operand(op) else {
        panic!(
            "analysis::get_def_use: expected offset(base) operand at {}[{}], got '{}'",
            mnemonic, index, op
        );
    };
    if !is_register(&base) {
        panic!(
            "analysis::get_def_use: expected base register in {}[{}], got '{}'",
            mnemonic, index, base
        );
    }
    base
}

/// Get DEF and USE sets for an instruction, following the plan's DEF/USE definitions.
fn get_def_use(inst: &Instruction) -> (BTreeSet<String>, BTreeSet<String>) {
    let mut defs = BTreeSet::new();
    let mut uses = BTreeSet::new();

    if let Some(mnemonic) = &inst.mnemonic {
        let args = &inst.operands;
        match mnemonic.as_str() {
            // 3-operand arithmetic/comparison: dest, src1, src2
            "add" | "sub" | "sll" | "sar" | "or" | "xor" | "ceq" | "cleq" | "clt" | "feq"
            | "fneq" | "fleq" | "flt" => {
                if let Some(op0) = args.get(0) {
                    defs.insert(expect_direct_reg(op0, mnemonic, 0));
                }
                if let Some(op1) = args.get(1) {
                    uses.insert(expect_direct_reg(op1, mnemonic, 1));
                }
                if let Some(op2) = args.get(2) {
                    uses.insert(expect_direct_reg(op2, mnemonic, 2));
                }
            }
            // 3-operand float arithmetic: dest, src1, src2
            "fadd" | "fsub" | "fmul" | "fdiv" => {
                if let Some(op0) = args.get(0) {
                    defs.insert(expect_direct_reg(op0, mnemonic, 0));
                }
                if let Some(op1) = args.get(1) {
                    uses.insert(expect_direct_reg(op1, mnemonic, 1));
                }
                if let Some(op2) = args.get(2) {
                    uses.insert(expect_direct_reg(op2, mnemonic, 2));
                }
            }
            // Ternary select: dest, cond, then, else
            "tern" | "ftern" => {
                if let Some(op0) = args.get(0) {
                    defs.insert(expect_direct_reg(op0, mnemonic, 0));
                }
                if let Some(op1) = args.get(1) {
                    uses.insert(expect_direct_reg(op1, mnemonic, 1));
                }
                if let Some(op2) = args.get(2) {
                    uses.insert(expect_direct_reg(op2, mnemonic, 2));
                }
                if let Some(op3) = args.get(3) {
                    uses.insert(expect_direct_reg(op3, mnemonic, 3));
                }
            }
            // 3-operand immediate: dest, src, imm
            "addi" | "subi" | "slli" | "sari" | "ori" | "xori" | "ceqi" | "cleqi" | "clti" => {
                if let Some(op0) = args.get(0) {
                    defs.insert(expect_direct_reg(op0, mnemonic, 0));
                }
                if let Some(op1) = args.get(1) {
                    uses.insert(expect_direct_reg(op1, mnemonic, 1));
                }
            }
            // 2-operand: dest, src
            "mov" | "neg" => {
                if let Some(op0) = args.get(0) {
                    defs.insert(expect_direct_reg(op0, mnemonic, 0));
                }
                if let Some(op1) = args.get(1) {
                    uses.insert(expect_direct_reg(op1, mnemonic, 1));
                }
            }
            // 2-operand float: dest, src
            "fmov" | "fneg" | "finv" | "frsqrt" | "ffloor" => {
                if let Some(op0) = args.get(0) {
                    defs.insert(expect_direct_reg(op0, mnemonic, 0));
                }
                if let Some(op1) = args.get(1) {
                    uses.insert(expect_direct_reg(op1, mnemonic, 1));
                }
            }
            // Cross-domain: ftoi rd, fs / itof fd, rs
            "ftoi" | "itof" => {
                if let Some(op0) = args.get(0) {
                    defs.insert(expect_direct_reg(op0, mnemonic, 0));
                }
                if let Some(op1) = args.get(1) {
                    uses.insert(expect_direct_reg(op1, mnemonic, 1));
                }
            }
            // Immediate load: dest only, no register source
            "movi" | "movui" => {
                if let Some(op0) = args.get(0) {
                    defs.insert(expect_direct_reg(op0, mnemonic, 0));
                }
            }
            // mif fd, rs - move int to float
            "mif" => {
                if let Some(op0) = args.get(0) {
                    defs.insert(expect_direct_reg(op0, mnemonic, 0));
                }
                if let Some(op1) = args.get(1) {
                    uses.insert(expect_direct_reg(op1, mnemonic, 1));
                }
            }
            // Load: lw/lf/lb dest, offset(base) -> DEF={dest}, USE={base}
            "lw" | "lf" | "lb" => {
                if let Some(op0) = args.get(0) {
                    defs.insert(expect_direct_reg(op0, mnemonic, 0));
                }
                if let Some(op1) = args.get(1) {
                    uses.insert(expect_offset_base_reg(op1, mnemonic, 1));
                }
            }
            // Store: sw/sf/sb src, offset(base) -> DEF={}, USE={src, base}
            "sw" | "sf" | "sb" => {
                if let Some(op0) = args.get(0) {
                    uses.insert(expect_direct_reg(op0, mnemonic, 0));
                }
                if let Some(op1) = args.get(1) {
                    uses.insert(expect_offset_base_reg(op1, mnemonic, 1));
                }
            }
            // set_label: dest, label -> DEF={dest}, USE={}
            "set_label" => {
                if let Some(op0) = args.get(0) {
                    defs.insert(expect_direct_reg(op0, mnemonic, 0));
                }
            }
            // jzero: jzero rd, rs, label -> DEF={}, USE={rs}
            // rd is %i0 (zero reg, writing is no-op)
            "jzero" => {
                if let Some(op1) = args.get(1) {
                    uses.insert(expect_direct_reg(op1, mnemonic, 1));
                }
            }
            // jeq rs1, rs2, offset -> DEF={}, USE={rs1, rs2}
            // jlt rs1, rs2, offset -> DEF={}, USE={rs1, rs2}
            // jleq rs1, rs2, offset -> DEF={}, USE={rs1, rs2}
            "jeq" | "jlt" | "jleq" => {
                if let Some(op0) = args.get(0) {
                    uses.insert(expect_direct_reg(op0, mnemonic, 0));
                }
                if let Some(op1) = args.get(1) {
                    uses.insert(expect_direct_reg(op1, mnemonic, 1));
                }
            }
            // jmp: jmp rd, offset(rb) -> DEF={rd if not %i0}, USE={rb}
            "jmp" => {
                if let Some(rd) = args.get(0) {
                    let rd = expect_direct_reg(rd, mnemonic, 0);
                    if rd != "%i0" {
                        defs.insert(rd);
                    }
                }
                if let Some(op1) = args.get(1) {
                    uses.insert(expect_offset_base_reg(op1, mnemonic, 1));
                }
                // Return-jump convention: jmp %i0, 0(%i3)
                // This consumes return value registers.
                if args.len() >= 2 && args[0] == "%i0" {
                    if let Some((_, base)) = parse_offset_operand(&args[1]) {
                        if base == "%i3" {
                            uses.insert("%i30".to_string());
                            uses.insert("%f30".to_string());
                        }
                    }
                }
            }
            // call_dir: DEF = return regs only, USE = {}
            "call_dir" => {
                add_call_clobbers(&mut defs);
            }
            // call_cls: DEF = return regs only, USE = {<reg>}
            "call_cls" => {
                // The closure register argument
                if let Some(op0) = args.get(0) {
                    uses.insert(expect_direct_reg(op0, mnemonic, 0));
                }
                // Same clobber/arg rules as call_dir.
                add_call_clobbers(&mut defs);
            }
            // ret: DEF={}, USE={%i30, %f30} (return value registers, conservative)
            "ret" => {
                uses.insert("%i30".to_string());
                uses.insert("%f30".to_string());
            }
            // .virtual_def: pseudo-instruction for liveness barrier.
            // Treated as DEF of all operand registers, USE of none.
            // This stops backward liveness propagation at the merge point
            // for ftern/tern phi-bridge variables.
            ".virtual_def" => {
                for op in args {
                    if op.starts_with('%') {
                        defs.insert(op.clone());
                    }
                }
            }
            // nop and directives
            "nop" | "print_debug" | ".data" | ".text" | ".align" | ".global" | ".section" | ".func_entry"
            | ".end_function" | ".long" => {}
            // Unknown mnemonic is a backend bug. Do not fallback silently.
            _ => {
                panic!(
                    "analysis::get_def_use: unknown mnemonic '{}' operands={:?}",
                    mnemonic, args
                );
            }
        }
    }

    // Filter to only actual registers and remove zero registers from DEF
    let clean_def: BTreeSet<String> = defs
        .into_iter()
        .filter(|r| is_register(r) && r != "%i0" && r != "%f0")
        .collect();
    let clean_use: BTreeSet<String> = uses.into_iter().filter(|r| is_register(r)).collect();

    (clean_def, clean_use)
}

pub fn collect_def_use(inst: &Instruction) -> (BTreeSet<String>, BTreeSet<String>) {
    get_def_use(inst)
}

pub fn analyze(instructions: &[Instruction]) -> Vec<AnalyzedInstruction> {
    let mut analyzed = Vec::with_capacity(instructions.len());
    let mut label_map: BTreeMap<String, usize> = BTreeMap::new();

    // Pass 1: Compute DEF/USE and map labels to instruction indices
    for (i, inst) in instructions.iter().enumerate() {
        if let Some(label) = &inst.label {
            label_map.insert(label.clone(), i);
        }
        let (defs, uses) = get_def_use(inst);
        analyzed.push(AnalyzedInstruction {
            instruction: inst.clone(),
            defs,
            uses,
            live_in: BTreeSet::new(),
            live_out: BTreeSet::new(),
            succ: Vec::new(),
        });
    }

    // Pass 2: Build CFG (successor edges)
    for i in 0..analyzed.len() {
        let inst = &analyzed[i].instruction;
        let mut succs = Vec::new();
        let mut is_terminator = false;

        if let Some(mnemonic) = &inst.mnemonic {
            if mnemonic.starts_with('.') && mnemonic != ".virtual_def" {
                // Assembler directives are not executable instructions.
                // Do not create fall-through edges through them.
                analyzed[i].succ = succs;
                continue;
            }
            match mnemonic.as_str() {
                "jzero" => {
                    // Conditional branch: jzero rd, rs, label
                    // Successors: fall-through + label target
                    if inst.operands.len() >= 3 {
                        let label = &inst.operands[2];
                        if let Some(idx) = label_map.get(label) {
                            succs.push(*idx);
                        }
                    }
                    // Fall-through
                    if i + 1 < analyzed.len() {
                        succs.push(i + 1);
                    }
                    // Not a terminator (has fall-through), but we've added it manually
                    is_terminator = true; // we handle successors manually
                }
                // jeq rs1, rs2, label  / jlt rs1, rs2, label  / jleq rs1, rs2, label
                // Conditional branch: successors = fall-through + label target
                "jeq" | "jlt" | "jleq" => {
                    if inst.operands.len() >= 3 {
                        let label = &inst.operands[2];
                        if let Some(idx) = label_map.get(label) {
                            succs.push(*idx);
                        }
                    }
                    if i + 1 < analyzed.len() {
                        succs.push(i + 1);
                    }
                    is_terminator = true;
                }
                "jmp" => {
                    // jmp is used for both control transfer and calls.
                    // call form: jmp %i3, off(base)
                    //   - writes return address to %i3
                    //   - returns to next instruction
                    // For liveness safety in stage3 peephole, model call-jmp with
                    // fall-through successor only (do not jump into callee body).
                    if inst.operands.first().map(|s| s == "%i3").unwrap_or(false) {
                        if i + 1 < analyzed.len() {
                            succs.push(i + 1);
                        }
                        analyzed[i].succ = succs;
                        continue;
                    }

                    // Non-call jmp: unconditional jump. Need to resolve target.
                    let mut resolved = false;

                    // Check if the previous instruction is set_label
                    if i > 0 && inst.operands.len() >= 2 {
                        let addr_op = &inst.operands[1];
                        if let Some(start) = addr_op.find('(') {
                            if let Some(end) = addr_op.find(')') {
                                let reg_used = &addr_op[start + 1..end];
                                let prev = &analyzed[i - 1].instruction;
                                if let Some(prev_mnem) = &prev.mnemonic {
                                    if prev_mnem == "set_label" && prev.operands.len() >= 2 {
                                        if prev.operands[0] == reg_used {
                                            let label = &prev.operands[1];
                                            if let Some(idx) = label_map.get(label) {
                                                succs.push(*idx);
                                                resolved = true;
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }

                    // If we couldn't resolve, check if operand is a direct label
                    if !resolved && !inst.operands.is_empty() {
                        let target = &inst.operands[0];
                        if let Some(idx) = label_map.get(target) {
                            succs.push(*idx);
                            resolved = true;
                        }
                    }

                    // If unresolved, treat as having no known successors (conservative)
                    if !resolved && call_debug_enabled() {
                        eprintln!(
                            "[call-debug][cfg] unresolved jmp at idx={} operands={:?}",
                            i, inst.operands
                        );
                    }
                    is_terminator = true;
                }
                "ret" => {
                    is_terminator = true;
                    // No successors
                }
                "call_dir" | "call_cls" => {
                    // Call returns to next instruction
                    // Fall-through handled below
                }
                _ => {}
            }
        }

        if !is_terminator && i + 1 < analyzed.len() {
            succs.push(i + 1);
        }

        analyzed[i].succ = succs;
    }

    if cfg_debug_enabled() {
        let mut pred0: Vec<usize> = Vec::new();
        for (i, ai) in analyzed.iter().enumerate() {
            if ai.succ.iter().any(|&s| s == 0) {
                pred0.push(i);
            }
        }
        eprintln!("[cfg-debug] preds_of_0_count={}", pred0.len());
        for i in pred0.into_iter().take(20) {
            let inst = &analyzed[i].instruction;
            eprintln!(
                "[cfg-debug] edge {} -> 0  label={:?} mnem={:?} ops={:?}",
                i, inst.label, inst.mnemonic, inst.operands
            );
        }
    }

    // Pass 3: Liveness Analysis (pair-propagation worklist)
    // Q <- {(n, v) | v in use(n)}
    // seen is a hash set of (instruction index, variable id)
    // This avoids whole-function set unions/clones on each iteration.
    let n = analyzed.len();
    let mut preds: Vec<Vec<usize>> = vec![Vec::new(); n];
    for (i, inst) in analyzed.iter().enumerate() {
        for &s in &inst.succ {
            if s < n {
                preds[s].push(i);
            }
        }
    }

    // Coordinate-compress register names to integer ids.
    let mut reg_to_id: HashMap<String, usize> = HashMap::new();
    let mut id_to_reg: Vec<String> = Vec::new();
    let mut intern_reg = |r: &str| -> usize {
        if let Some(&id) = reg_to_id.get(r) {
            id
        } else {
            let id = id_to_reg.len();
            reg_to_id.insert(r.to_string(), id);
            id_to_reg.push(r.to_string());
            id
        }
    };

    let mut defs_ids: Vec<HashSet<usize>> = Vec::with_capacity(n);
    let mut uses_ids: Vec<Vec<usize>> = Vec::with_capacity(n);
    let mut uses_set_ids: Vec<HashSet<usize>> = Vec::with_capacity(n);
    for inst in &analyzed {
        let mut dset = HashSet::new();
        for r in &inst.defs {
            dset.insert(intern_reg(r));
        }
        defs_ids.push(dset);

        let mut uvec = Vec::new();
        let mut uset = HashSet::new();
        for r in &inst.uses {
            let id = intern_reg(r);
            uvec.push(id);
            uset.insert(id);
        }
        uses_ids.push(uvec);
        uses_set_ids.push(uset);
    }

    let encode_pair = |i: usize, v: usize| -> u64 { ((i as u64) << 32) | (v as u64) };
    let decode_pair = |k: u64| -> (usize, usize) { ((k >> 32) as usize, (k as u32) as usize) };

    let mut seen: HashSet<u64> = HashSet::new();
    let mut queued: HashSet<u64> = HashSet::new();
    let mut wl: VecDeque<u64> = VecDeque::new();
    let live_debug = live_debug_enabled();
    let mut pop_count: usize = 0;
    let mut push_count: usize = 0;
    for i in 0..n {
        for &v in &uses_ids[i] {
            let k = encode_pair(i, v);
            if queued.insert(k) {
                wl.push_back(k);
                push_count += 1;
            }
        }
    }
    while let Some(k) = wl.pop_front() {
        let (i, v) = decode_pair(k);
        pop_count += 1;
        if live_debug && pop_count % 1_000_000 == 0 {
            eprintln!(
                "[live-debug] pops={} pushes={} seen={} queued={}",
                pop_count,
                push_count,
                seen.len(),
                queued.len()
            );
        }
        queued.remove(&k);
        if !seen.insert(k) {
            continue;
        }

        // Stop at definitions unless this instruction also uses the value.
        if defs_ids[i].contains(&v) && !uses_set_ids[i].contains(&v) {
            continue;
        }

        for &p in &preds[i] {
            let pk = encode_pair(p, v);
            if !seen.contains(&pk) && queued.insert(pk) {
                wl.push_back(pk);
                push_count += 1;
            }
        }
    }
    if live_debug {
        eprintln!(
            "[live-debug] done pops={} pushes={} seen={}",
            pop_count,
            push_count,
            seen.len()
        );
    }

    if let Some(var) = debug_var_name() {
        if let Some(&vid) = reg_to_id.get(&var) {
            let mut seen_idx: Vec<usize> = seen
                .iter()
                .filter_map(|&k| {
                    let (i, v) = decode_pair(k);
                    if v == vid { Some(i) } else { None }
                })
                .collect();
            seen_idx.sort_unstable();
            seen_idx.dedup();
            let mut def_idx: Vec<usize> = Vec::new();
            let mut use_idx: Vec<usize> = Vec::new();
            for i in 0..n {
                if defs_ids[i].contains(&vid) {
                    def_idx.push(i);
                }
                if uses_set_ids[i].contains(&vid) {
                    use_idx.push(i);
                }
            }
            eprintln!(
                "[live-debug-var] var={} defs={} uses={} seen_nodes={}",
                var,
                def_idx.len(),
                use_idx.len(),
                seen_idx.len()
            );
            eprintln!(
                "[live-debug-var] first_defs={:?}",
                def_idx.iter().take(8).collect::<Vec<_>>()
            );
            eprintln!(
                "[live-debug-var] first_uses={:?}",
                use_idx.iter().take(8).collect::<Vec<_>>()
            );
            eprintln!(
                "[live-debug-var] first_seen={:?}",
                seen_idx.iter().take(16).collect::<Vec<_>>()
            );
        } else {
            eprintln!("[live-debug-var] var={} not found in reg table", var);
        }
    }

    let mut live_in_ids: Vec<HashSet<usize>> = vec![HashSet::new(); n];
    for &k in &seen {
        let (i, v) = decode_pair(k);
        if i < n {
            live_in_ids[i].insert(v);
        }
    }

    for i in 0..n {
        let mut live_in = BTreeSet::new();
        for &v in &live_in_ids[i] {
            live_in.insert(id_to_reg[v].clone());
        }
        analyzed[i].live_in = live_in;

        let mut live_out_ids: HashSet<usize> = HashSet::new();
        for &s in &analyzed[i].succ {
            if s < n {
                for &v in &live_in_ids[s] {
                    live_out_ids.insert(v);
                }
            }
        }
        let mut live_out = BTreeSet::new();
        for v in live_out_ids {
            live_out.insert(id_to_reg[v].clone());
        }
        analyzed[i].live_out = live_out;
    }

    analyzed
}

#[derive(Debug)]
pub struct InterferenceGraph {
    pub adj: BTreeMap<String, BTreeSet<String>>,
    pub forbidden: BTreeMap<String, BTreeSet<usize>>,
}

impl InterferenceGraph {
    pub fn new() -> Self {
        InterferenceGraph {
            adj: BTreeMap::new(),
            forbidden: BTreeMap::new(),
        }
    }

    pub fn add_edge(&mut self, u: &str, v: &str) {
        if u == v {
            return;
        }
        self.adj
            .entry(u.to_string())
            .or_default()
            .insert(v.to_string());
        self.adj
            .entry(v.to_string())
            .or_default()
            .insert(u.to_string());
    }

    pub fn add_node(&mut self, u: &str) {
        self.adj.entry(u.to_string()).or_default();
    }

    pub fn add_forbidden_color(&mut self, u: &str, color: usize) {
        self.forbidden
            .entry(u.to_string())
            .or_default()
            .insert(color);
    }

    /// Build the interference graph from analyzed instructions.
    /// Graph nodes are virtual registers only. Constraints against fixed physical
    /// registers are recorded as per-node forbidden colors.
    pub fn build(analyzed: &[AnalyzedInstruction]) -> Self {
        let mut graph = InterferenceGraph::new();

        // Ensure all registers that appear in DEF/USE are in the graph
        for inst in analyzed {
            for def in &inst.defs {
                if is_graph_register(def) {
                    graph.add_node(def);
                }
            }
            for use_reg in &inst.uses {
                if is_graph_register(use_reg) {
                    graph.add_node(use_reg);
                }
            }
        }

        // Build interference edges and forbidden colors
        for inst in analyzed {
            let is_move = if let Some(mnemonic) = &inst.instruction.mnemonic {
                mnemonic == "mov" || mnemonic == "fmov"
            } else {
                false
            };
            let move_src = if is_move && inst.instruction.operands.len() > 1 {
                Some(inst.instruction.operands[1].as_str())
            } else {
                None
            };

            for def in &inst.defs {
                for live in &inst.live_out {
                    if def == live {
                        continue;
                    }

                    // Move exception: don't add edge between def and source of move
                    if let Some(src) = move_src {
                        if src == live {
                            continue;
                        }
                    }

                    // Only add edge if registers are of the same class
                    let def_is_int = def.starts_with("%i") || def.starts_with("%vi");
                    let live_is_int = live.starts_with("%i") || live.starts_with("%vi");
                    let def_is_float = def.starts_with("%f") || def.starts_with("%vf");
                    let live_is_float = live.starts_with("%f") || live.starts_with("%vf");

                    if !(def_is_int && live_is_int || def_is_float && live_is_float) {
                        continue;
                    }

                    let def_is_graph = is_graph_register(def);
                    let live_is_graph = is_graph_register(live);

                    if def_is_graph && live_is_graph {
                        graph.add_edge(def, live);
                    } else if def_is_graph {
                        if let Some(c) = physical_color(live) {
                            graph.add_forbidden_color(def, c);
                        }
                    } else if live_is_graph {
                        if let Some(c) = physical_color(def) {
                            graph.add_forbidden_color(live, c);
                        }
                    }
                }
            }
        }

        graph
    }
}

fn physical_color(reg: &str) -> Option<usize> {
    if let Some(rest) = reg.strip_prefix("%i") {
        if let Ok(idx) = rest.parse::<usize>() {
            if (4..=29).contains(&idx) {
                return Some(idx - 4);
            }
        }
    }
    if let Some(rest) = reg.strip_prefix("%f") {
        if let Ok(idx) = rest.parse::<usize>() {
            if (1..=30).contains(&idx) {
                return Some(idx - 1);
            }
        }
    }
    None
}
