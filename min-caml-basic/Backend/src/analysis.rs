/// Liveness analysis and interference graph construction.
use crate::input::Instruction;
use std::collections::{BTreeMap, BTreeSet};

fn call_debug_enabled() -> bool {
    std::env::var("BACKEND_DEBUG_CALL")
        .map(|v| v != "0")
        .unwrap_or(false)
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

/// Extract register names from an operand string.
/// Handles plain registers and offset(register) format.
fn extract_registers(s: &str) -> Vec<String> {
    let mut regs = Vec::new();
    if let Some(start) = s.find('(') {
        if let Some(end) = s.find(')') {
            let base = &s[start + 1..end];
            if is_register(base) {
                regs.push(base.to_string());
            }
            return regs;
        }
    }
    if is_register(s) {
        regs.push(s.to_string());
    }
    regs
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

/// Get DEF and USE sets for an instruction, following the plan's DEF/USE definitions.
fn get_def_use(inst: &Instruction) -> (BTreeSet<String>, BTreeSet<String>) {
    let mut defs = BTreeSet::new();
    let mut uses = BTreeSet::new();

    if let Some(mnemonic) = &inst.mnemonic {
        let args = &inst.operands;
        match mnemonic.as_str() {
            // 3-operand arithmetic/comparison: dest, src1, src2
            "add" | "sub" | "sll" | "sar" | "xor" | "ceq" | "cleq" | "clt" | "feq" | "fleq"
            | "flt" => {
                if args.len() >= 1 {
                    defs.insert(args[0].clone());
                }
                for arg in args.iter().skip(1) {
                    for r in extract_registers(arg) {
                        uses.insert(r);
                    }
                }
            }
            // 3-operand float arithmetic: dest, src1, src2
            "fadd" | "fsub" | "fmul" | "fdiv" => {
                if args.len() >= 1 {
                    defs.insert(args[0].clone());
                }
                for arg in args.iter().skip(1) {
                    for r in extract_registers(arg) {
                        uses.insert(r);
                    }
                }
            }
            // 3-operand immediate: dest, src, imm
            "addi" | "subi" | "slli" | "sari" | "ori" | "xori" | "ceqi" | "cleqi" | "clti" => {
                if args.len() >= 1 {
                    defs.insert(args[0].clone());
                }
                if args.len() > 1 {
                    for r in extract_registers(&args[1]) {
                        uses.insert(r);
                    }
                }
            }
            // 2-operand: dest, src
            "mov" | "neg" => {
                if args.len() >= 1 {
                    defs.insert(args[0].clone());
                }
                for arg in args.iter().skip(1) {
                    for r in extract_registers(arg) {
                        uses.insert(r);
                    }
                }
            }
            // 2-operand float: dest, src
            "fmov" | "fneg" | "finv" | "frsqrt" | "ffloor" => {
                if args.len() >= 1 {
                    defs.insert(args[0].clone());
                }
                for arg in args.iter().skip(1) {
                    for r in extract_registers(arg) {
                        uses.insert(r);
                    }
                }
            }
            // Cross-domain: ftoi rd, fs / itof fd, rs
            "ftoi" => {
                if args.len() >= 1 {
                    defs.insert(args[0].clone()); // int dest
                }
                for arg in args.iter().skip(1) {
                    for r in extract_registers(arg) {
                        uses.insert(r); // float src
                    }
                }
            }
            "itof" => {
                if args.len() >= 1 {
                    defs.insert(args[0].clone()); // float dest
                }
                for arg in args.iter().skip(1) {
                    for r in extract_registers(arg) {
                        uses.insert(r); // int src
                    }
                }
            }
            // Immediate load: dest only, no register source
            "movi" | "movui" => {
                if args.len() >= 1 {
                    defs.insert(args[0].clone());
                }
            }
            // mif fd, rs - move int to float
            "mif" => {
                if args.len() >= 1 {
                    defs.insert(args[0].clone()); // float dest
                }
                if args.len() > 1 {
                    for r in extract_registers(&args[1]) {
                        uses.insert(r); // int src
                    }
                }
            }
            // Load: lw/lf/lb dest, offset(base) -> DEF={dest}, USE={base}
            "lw" | "lf" | "lb" => {
                if args.len() >= 1 {
                    defs.insert(args[0].clone());
                }
                for arg in args.iter().skip(1) {
                    for r in extract_registers(arg) {
                        uses.insert(r);
                    }
                }
            }
            // Store: sw/sf/sb src, offset(base) -> DEF={}, USE={src, base}
            "sw" | "sf" | "sb" => {
                for arg in args {
                    for r in extract_registers(arg) {
                        uses.insert(r);
                    }
                }
            }
            // set_label: dest, label -> DEF={dest}, USE={}
            "set_label" => {
                if args.len() >= 1 {
                    defs.insert(args[0].clone());
                }
            }
            // jzero: jzero rd, rs, label -> DEF={}, USE={rs}
            // rd is %i0 (zero reg, writing is no-op)
            "jzero" => {
                if args.len() >= 2 {
                    // args[0] = rd (typically %i0, ignored for defs)
                    // args[1] = rs (condition register)
                    for r in extract_registers(&args[1]) {
                        uses.insert(r);
                    }
                }
            }
            // jeq rs1, rs2, offset -> DEF={}, USE={rs1, rs2}
            // jlt rs1, rs2, offset -> DEF={}, USE={rs1, rs2}
            // jleq rs1, rs2, offset -> DEF={}, USE={rs1, rs2}
            "jeq" | "jlt" | "jleq" => {
                for arg in args.iter().take(2) {
                    for r in extract_registers(arg) {
                        uses.insert(r);
                    }
                }
            }
            // jmp: jmp rd, offset(rb) -> DEF={rd if not %i0}, USE={rb}
            "jmp" => {
                if args.len() >= 1 {
                    let rd = &args[0];
                    if rd != "%i0" {
                        defs.insert(rd.clone());
                    }
                }
                for arg in args.iter().skip(1) {
                    for r in extract_registers(arg) {
                        uses.insert(r);
                    }
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
                if args.len() >= 1 {
                    for r in extract_registers(&args[0]) {
                        uses.insert(r);
                    }
                }
                // Same clobber/arg rules as call_dir.
                add_call_clobbers(&mut defs);
            }
            // ret: DEF={}, USE={%i30, %f30} (return value registers, conservative)
            "ret" => {
                uses.insert("%i30".to_string());
                uses.insert("%f30".to_string());
            }
            // nop and directives
            "nop" | ".data" | ".text" | ".align" | ".global" | ".section" | ".func_entry"
            | ".long" => {}
            // Unknown
            _ => {
                // Fallback: treat as generic instruction
                // First operand = def, rest = uses
                if args.len() >= 1 {
                    if is_register(&args[0]) {
                        defs.insert(args[0].clone());
                    }
                }
                for arg in args.iter().skip(1) {
                    for r in extract_registers(arg) {
                        uses.insert(r);
                    }
                }
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

    // Pass 3: Liveness Analysis (Mogensen/Rehof-style worklist fixed point)
    let n = analyzed.len();
    let mut preds: Vec<Vec<usize>> = vec![Vec::new(); n];
    for (i, inst) in analyzed.iter().enumerate() {
        for &s in &inst.succ {
            if s < n {
                preds[s].push(i);
            }
        }
    }

    let mut in_wl = vec![true; n];
    let mut wl: std::collections::VecDeque<usize> = (0..n).collect();

    while let Some(i) = wl.pop_front() {
        in_wl[i] = false;

        // live_out[i] = union(live_in[s]) for s in succ[i]
        let mut new_out = BTreeSet::new();
        for &s in &analyzed[i].succ {
            if s < n {
                for r in &analyzed[s].live_in {
                    new_out.insert(r.clone());
                }
            }
        }

        // live_in[i] = use[i] U (live_out[i] \ def[i])
        let mut new_in = analyzed[i].uses.clone();
        for r in &new_out {
            if !analyzed[i].defs.contains(r) {
                new_in.insert(r.clone());
            }
        }

        if new_in != analyzed[i].live_in || new_out != analyzed[i].live_out {
            analyzed[i].live_in = new_in;
            analyzed[i].live_out = new_out;
            for &p in &preds[i] {
                if !in_wl[p] {
                    wl.push_back(p);
                    in_wl[p] = true;
                }
            }
        }
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
