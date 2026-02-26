use crate::input::Instruction;
use std::collections::HashMap;
use std::collections::HashSet;

pub struct OptimizeResult {
    pub instructions: Vec<Instruction>,
    pub global_access_rewrites: usize,
    pub zero_base_fold_rewrites: usize,
    pub word_offset_rewrites: usize,
    pub val_trace_rewrites: usize,
    pub trampoline_elim_rewrites: usize,
    pub branch_relax_rewrites: usize,
    pub short_jump_fold_rewrites: usize,
}

pub fn optimize(instructions: Vec<Instruction>) -> OptimizeResult {
    // Pass 1: eliminate trampolines that are clearly visible before relaxation
    let (instructions, trampoline_elim_rewrites_1) = jump_trampoline_elim(instructions);
    // Relax far conditional branches (those rewritten to far targets by pass 1)
    let (instructions, branch_relax_rewrites) = relax_branches_opt(instructions);
    // Pass 2: eliminate any remaining or newly visible trampolines
    let (instructions, trampoline_elim_rewrites_2) = jump_trampoline_elim(instructions);
    let trampoline_elim_rewrites = trampoline_elim_rewrites_1 + trampoline_elim_rewrites_2;
    // Fold short unconditional jumps: set_label + jmp → jzero %i0, %i0, label
    let (instructions, short_jump_fold_rewrites) = fold_short_unconditional_jumps_opt(instructions);
    let (instructions, global_access_rewrites) = global_access_opt(instructions);
    let (instructions, zero_base_fold_rewrites) = fold_zero_base_addr_opt(instructions);
    let (instructions, word_offset_rewrites) = scale_word_mem_offset_opt(instructions);
    let (instructions, val_trace_rewrites) = const_reuse_with_val_trace_opt(instructions);
    OptimizeResult {
        instructions,
        global_access_rewrites,
        zero_base_fold_rewrites,
        word_offset_rewrites,
        val_trace_rewrites,
        trampoline_elim_rewrites,
        branch_relax_rewrites,
        short_jump_fold_rewrites,
    }
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
                "feq" | "fleq" | "flt" => {
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
    let mut out = Vec::with_capacity(instructions.len());
    let mut rewrites = 0usize;
    let mut trace = ValTrace::new();
    let mut i = 0usize;
    let n = instructions.len();

    while i < n {
        if instructions[i].label.is_some() {
            trace.clear_for_new_block();
        }

        if i + 2 < n {
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

        if i + 1 < n {
            if let Some(new_inst) = fold_xor_ceqi_pattern(&instructions[i], &instructions[i + 1]) {
                trace.observe_instruction(&new_inst);
                out.push(new_inst);
                rewrites += 1;
                i += 2;
                continue;
            }
        }

        if i + 3 < n {
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

        if i + 1 < n {
            if let Some(new_inst) = fold_bool_neg_pattern(&instructions[i], &instructions[i + 1], &trace) {
                trace.observe_instruction(&new_inst);
                out.push(new_inst);
                rewrites += 1;
                i += 2;
                continue;
            }
        }

        if i + 1 < n {
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
/// A block of the form:
///   LABEL:
///       set_label  %rX, TARGET
///       jmp        %i0, 0(%rX)   ← %i0 = zero reg (return addr discarded = pure forward)
/// is a pure trampoline.
/// - `set_label` references to the trampoline are always rewritten (full-range).
/// - Conditional branch (`jzero` etc.) references are rewritten AND the trampoline
///   is removed only if every branch referencing it is within BRANCH_THRESHOLD
///   instructions of the trampoline block.
const BRANCH_THRESHOLD: usize = usize::MAX;

pub fn jump_trampoline_elim(instructions: Vec<Instruction>) -> (Vec<Instruction>, usize) {
    let n = instructions.len();
    // Map: trampoline_label -> (instruction_index_of_set_label, target_label)
    let mut trampoline_map: HashMap<String, (usize, String)> = HashMap::new();
    // Indices of the two instructions forming each trampoline block
    let mut trampoline_indices: HashSet<usize> = HashSet::new();

    // Detect trampoline blocks:
    //   inst[i]  : label=Some(L), mnemonic="set_label", operands=[reg, TARGET]
    //   inst[i+1]: label=None,    mnemonic="jmp",       operands=["%i0", "0(reg)"]
    for i in 0..n.saturating_sub(1) {
        let inst = &instructions[i];
        let Some(label) = inst.label.as_deref() else {
            continue;
        };
        if inst.mnemonic.as_deref() != Some("set_label") || inst.operands.len() != 2 {
            continue;
        }
        let reg = &inst.operands[0];
        let target = &inst.operands[1];

        let next = &instructions[i + 1];
        if next.label.is_some() {
            continue;
        }
        if next.mnemonic.as_deref() != Some("jmp") || next.operands.len() != 2 {
            continue;
        }
        if next.operands[1] != format!("0({})", reg) {
            continue;
        }
        // Only pure trampolines: jmp first operand must be %i0 (zero register,
        // return address discarded).  If it's %i3 etc., the jmp is a function
        // CALL that saves PC+4 into that register — not a transparent forward.
        if next.operands[0] != "%i0" {
            continue;
        }

        trampoline_map.insert(label.to_string(), (i, target.clone()));
        trampoline_indices.insert(i);
        trampoline_indices.insert(i + 1);
    }

    // Transitively resolve chains (A -> B -> C  ==>  A -> C).
    loop {
        let mut changed = false;
        let pairs: Vec<(String, usize, String)> = trampoline_map
            .iter()
            .map(|(k, (idx, v))| (k.clone(), *idx, v.clone()))
            .collect();
        for (k, idx, v) in pairs {
            if let Some((_, vv)) = trampoline_map.get(&v).cloned() {
                let entry = trampoline_map.get_mut(&k).unwrap();
                if entry.1 != vv {
                    entry.1 = vv;
                    // keep idx (the block's own position) unchanged
                    let _ = idx;
                    changed = true;
                }
            }
        }
        if !changed {
            break;
        }
    }

    // For each trampoline, decide if it is safe to physically remove the block.
    // A trampoline is safe to remove when every non-set_label instruction referencing
    // its label, when rewritten to the final resolved target, would still be within
    // BRANCH_THRESHOLD instructions of the branch site.
    // We need a label-to-index map for the final target distance check.
    let mut label_index: HashMap<String, usize> = HashMap::new();
    for (idx, inst) in instructions.iter().enumerate() {
        if let Some(label) = inst.label.as_deref() {
            label_index.insert(label.to_string(), idx);
        }
    }

    let mut safe_to_remove: HashSet<String> = trampoline_map.keys().cloned().collect();

    // Never remove self-referential trampolines (e.g. `fin: set_label %rX, fin; jmp %i0`).
    // These are intentional infinite loops used as program termination markers.
    for (lbl, (_, tgt)) in &trampoline_map {
        if lbl == tgt {
            safe_to_remove.remove(lbl.as_str());
        }
    }

    for (ref_idx, inst) in instructions.iter().enumerate() {
        let Some(mnem) = inst.mnemonic.as_deref() else {
            continue;
        };
        if mnem == "set_label" {
            continue; // unconditional indirect jmp — full range, never a problem
        }
        for op in &inst.operands {
            if let Some((_, final_target)) = trampoline_map.get(op.as_str()) {
                // Distance to the final resolved target (not the intermediate trampoline).
                let target_idx = label_index.get(final_target).copied().unwrap_or(usize::MAX);
                let dist = ref_idx.abs_diff(target_idx);
                if dist > BRANCH_THRESHOLD {
                    safe_to_remove.remove(op.as_str());
                }
            }
        }
    }

    // Additional safety: a trampoline block at index `i` can only be removed if
    // there is NO fall-through into it.  Fall-through exists when instruction
    // `i-1` is not a terminator.  If the predecessor is not a terminator, code
    // can reach the block by falling through, and removing the `set_label + jmp`
    // would redirect that fall-through to wrong code.
    let is_terminator =
        |mnem: &str| matches!(mnem, "jmp" | "jzero" | "jeq" | "jlt" | "jleq" | "ret");
    for (lbl, (block_idx, _)) in &trampoline_map {
        if !safe_to_remove.contains(lbl.as_str()) {
            continue;
        }
        // block_idx is the set_label instruction; check predecessor at block_idx-1.
        if *block_idx == 0 {
            safe_to_remove.remove(lbl.as_str());
            continue;
        }
        let pred = &instructions[*block_idx - 1];
        let pred_mnem = pred.mnemonic.as_deref().unwrap_or("");
        if !is_terminator(pred_mnem) {
            safe_to_remove.remove(lbl.as_str());
        }
    }

    // Indices to actually drop (only safe-to-remove trampoline blocks).
    let drop_indices: HashSet<usize> = trampoline_indices
        .iter()
        .copied()
        .filter(|&idx| {
            let label = if let Some(l) = instructions[idx].label.as_deref() {
                l
            } else if idx > 0 {
                instructions[idx - 1].label.as_deref().unwrap_or("")
            } else {
                ""
            };
            safe_to_remove.contains(label)
        })
        .collect();

    // Rebuild instructions.
    let mut rewrites = 0usize;
    let mut out = Vec::with_capacity(n);

    for (i, mut inst) in instructions.into_iter().enumerate() {
        if drop_indices.contains(&i) {
            continue;
        }
        let mnem = inst.mnemonic.as_deref().unwrap_or("");
        if mnem == "set_label" && inst.operands.len() == 2 {
            // Always rewrite set_label targets (full-range indirect jmp).
            if let Some((_, new_target)) = trampoline_map.get(&inst.operands[1]).cloned() {
                inst.operands[1] = new_target;
                rewrites += 1;
            }
        } else {
            // Rewrite branch operands only for safe-to-remove trampolines
            // (distance was within threshold, so direct branch is valid).
            for op in inst.operands.iter_mut() {
                if safe_to_remove.contains(op.as_str()) {
                    if let Some((_, new_target)) = trampoline_map.get(op.as_str()).cloned() {
                        *op = new_target;
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
/// backward or if they jump forward by more than 2048 instructions.
/// tkasm limits conditional branch offsets to 12-bit unsigned (max 4095).
/// Uses %i30 as a scratch register (safe: not used as return address at this point).
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
                    target_idx < idx || target_idx.abs_diff(idx) > 2048
                } else {
                    // Unknown label (possibly external), assume far
                    true
                };

                if is_far_or_backward {
                    let rs1 = &ops[0];
                    let rs2 = &ops[1];
                    let skip_label = format!("Lrelax_skip_{}", relax_id);
                    relax_id += 1;

                    // Compute comparison into %i30 (not %i31, which may be live)
                    let cmp_mnem = match mnem {
                        "jeq"  => "ceq",
                        "jleq" => "cleq",
                        "jlt"  => "clt",
                        "jzero" => "ceq", // jzero rd, rs, tgt -> ceq %i30, rs, %i0
                        _ => unreachable!(),
                    };

                    let orig_label = inst.label.take();

                    if mnem == "jzero" {
                        // jzero rd, rs, tgt => ceq %i30, rs, %i0
                        out.push(Instruction {
                            label: orig_label,
                            mnemonic: Some("ceq".to_string()),
                            operands: vec!["%i30".to_string(), rs2.clone(), "%i0".to_string()],
                        });
                    } else {
                        // jeq/jleq/jlt rs1, rs2, tgt => ceq/cleq/clt %i30, rs1, rs2
                        out.push(Instruction {
                            label: orig_label,
                            mnemonic: Some(cmp_mnem.to_string()),
                            operands: vec!["%i30".to_string(), rs1.clone(), rs2.clone()],
                        });
                    }

                    // Branch over the jump if condition is false (%i30 == 0)
                    out.push(Instruction {
                        label: None,
                        mnemonic: Some("jzero".to_string()),
                        operands: vec!["%i0".to_string(), "%i30".to_string(), skip_label.clone()],
                    });

                    // Emit indirect jump to target via %i30
                    out.push(Instruction {
                        label: None,
                        mnemonic: Some("set_label".to_string()),
                        operands: vec!["%i30".to_string(), target_label.clone()],
                    });
                    out.push(Instruction {
                        label: None,
                        mnemonic: Some("jmp".to_string()),
                        operands: vec!["%i0".to_string(), "0(%i30)".to_string()],
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
/// when TARGET is a FORWARD label within 2048 instructions from current position.
/// jzero uses %i0 (zero register) as comparison: always 0 = unconditional branch.
/// Since each replacement removes 1 instruction, the actual offset is ≤ pre-computed
/// distance - 1, so the 2048 threshold is always safe.
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
                    // Check forward + within 2048 (original coordinates; actual is ≤ this - 1)
                    if let Some(&target_idx) = label_index.get(target.as_str()) {
                        if target_idx > i && target_idx - i <= 2048 {
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
