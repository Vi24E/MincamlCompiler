use crate::coloring::Allocation;
/// Spill rewriting with quick/slow wrappers.
///
/// quick_spill (one spilled vreg in a class):
///   scratch <- [slot]
///   op using scratch
///   [slot] <- scratch
///
/// slow_spill (two or more spilled vregs in a class):
///   scratch <- victim
///   victim <- [slot]
///   [slot] <- scratch
///   ... inner process (quick/slow) ...
///   scratch <- [slot]
///   [slot] <- victim
///   victim <- scratch
use crate::input::Instruction;
use crate::program;
use std::collections::{BTreeSet, HashMap, HashSet};

// Integer temp/victim candidates for spill expansion.
// %i30 is preferred when clean (closure register; often unused in minrt).
const INT_VICTIMS: [&str; 27] = [
    "%i30", "%i4", "%i5", "%i6", "%i7", "%i8", "%i9", "%i10", "%i11", "%i12", "%i13", "%i14",
    "%i15", "%i16", "%i17", "%i18", "%i19", "%i20", "%i21", "%i22", "%i23", "%i24", "%i25", "%i26",
    "%i27", "%i28", "%i29",
];

const FLOAT_VICTIMS: [&str; 30] = [
    "%f1", "%f2", "%f3", "%f4", "%f5", "%f6", "%f7", "%f8", "%f9", "%f10", "%f11", "%f12", "%f13",
    "%f14", "%f15", "%f16", "%f17", "%f18", "%f19", "%f20", "%f21", "%f22", "%f23", "%f24", "%f25",
    "%f26", "%f27", "%f28", "%f29", "%f30",
];

#[derive(Default)]
struct ClassPlan {
    map: HashMap<String, String>,
    pre: Vec<Instruction>,
    post: Vec<Instruction>,
}

fn spill_debug_enabled() -> bool {
    std::env::var("BACKEND_DEBUG_SPILL")
        .map(|v| v != "0")
        .unwrap_or(false)
}

pub fn perform_spilling(
    instructions: Vec<Instruction>,
    spilled_vars: &HashMap<String, ()>,
    allocation: &Allocation,
) -> Vec<Instruction> {
    let mut new_insts = Vec::new();
    let debug = spill_debug_enabled();
    let mut debug_ctrl_slow = 0usize;
    let mut debug_ctrl_post = 0usize;
    let mut debug_examples = 0usize;
    let functions = program::partition_function_ranges(&instructions);

    // Assign spill slots per function.
    let mut func_spill_maps: Vec<HashMap<String, i32>> = vec![HashMap::new(); functions.len()];
    for (func_idx, range) in functions.iter().enumerate() {
        let mut existing_max = 0i32;
        for i in range.clone() {
            let inst = &instructions[i];
            for op in &inst.operands {
                if let Some((off, base)) = parse_offset(op) {
                    if base == "%i1" && off >= 0 && off + 4 > existing_max {
                        existing_max = off + 4;
                    }
                }
            }
        }

        let mut slot_counter = existing_max / 4;
        for i in range.clone() {
            let inst = &instructions[i];
            for op in &inst.operands {
                for token in extract_regs_from_op(op) {
                    if spilled_vars.contains_key(&token)
                        && !func_spill_maps[func_idx].contains_key(&token)
                    {
                        func_spill_maps[func_idx].insert(token, slot_counter);
                        slot_counter += 1;
                    }
                }
            }
        }
    }

    // Rewrite instructions.
    for (func_idx, range) in functions.iter().enumerate() {
        let spill_map = &func_spill_maps[func_idx];
        if spill_map.is_empty() {
            for i in range.clone() {
                new_insts.push(instructions[i].clone());
            }
            continue;
        }
        let (int_use_counts, float_use_counts) =
            collect_physical_use_counts(&instructions, range.clone());

        let starts_with_func_entry =
            instructions[range.start].mnemonic.as_deref() == Some(".func_entry");
        let label_idx = if starts_with_func_entry { 1 } else { 0 };

        let actual_label = if starts_with_func_entry {
            if range.start + 1 < range.end {
                instructions[range.start + 1].label.as_deref().unwrap_or("")
            } else {
                ""
            }
        } else {
            instructions[range.start].label.as_deref().unwrap_or("")
        };

        // Keep fin untouched.
        if actual_label == "fin" {
            for i in range.clone() {
                new_insts.push(instructions[i].clone());
            }
            continue;
        }

        for (i_rel, i_abs) in range.clone().enumerate() {
            let inst = &instructions[i_abs];
            let mnem = inst.mnemonic.as_deref().unwrap_or("");

            if mnem == ".func_entry" {
                new_insts.push(inst.clone());
                continue;
            }
            if i_rel == label_idx && inst.label.is_some() && mnem.is_empty() {
                new_insts.push(inst.clone());
                continue;
            }
            if actual_label == "min_caml_start" && i_rel == 0 {
                new_insts.push(inst.clone());
                continue;
            }

            let (def_indices, use_indices) = get_def_use_indices(mnem, &inst.operands);
            let (int_spills, float_spills) = collect_spilled_vars_by_class(inst, spill_map);

            if int_spills.is_empty() && float_spills.is_empty() {
                new_insts.push(inst.clone());
                continue;
            }

            let used_int_regs = collect_used_regs(inst, false, spill_map, allocation);
            let used_float_regs = collect_used_regs(inst, true, spill_map, allocation);

            let is_ctrl = is_control_transfer(mnem);
            let int_plan = if is_ctrl {
                build_control_transfer_class_plan(
                    &int_spills,
                    spill_map,
                    false,
                    &used_int_regs,
                    &int_use_counts,
                    &inst.operands,
                    &def_indices,
                    &use_indices,
                )
            } else {
                build_class_plan(
                    &int_spills,
                    spill_map,
                    false,
                    &used_int_regs,
                    &int_use_counts,
                    &inst.operands,
                    &def_indices,
                    &use_indices,
                )
            };
            let float_plan = if is_ctrl {
                build_control_transfer_class_plan(
                    &float_spills,
                    spill_map,
                    true,
                    &used_float_regs,
                    &float_use_counts,
                    &inst.operands,
                    &def_indices,
                    &use_indices,
                )
            } else {
                build_class_plan(
                    &float_spills,
                    spill_map,
                    true,
                    &used_float_regs,
                    &float_use_counts,
                    &inst.operands,
                    &def_indices,
                    &use_indices,
                )
            };

            let mut op_map = int_plan.map;
            op_map.extend(float_plan.map);

            let mut rewritten = inst.clone();
            rewritten.operands = inst
                .operands
                .iter()
                .map(|op| rewrite_operand(op, &op_map))
                .collect();

            // Nest int(outside) -> float(inside).
            let mut pre_ops = int_plan.pre;
            pre_ops.extend(float_plan.pre);

            let mut post_ops = float_plan.post;
            post_ops.extend(int_plan.post);

            if debug && is_control_transfer(mnem) {
                if int_spills.len() >= 2 || float_spills.len() >= 2 {
                    debug_ctrl_slow += 1;
                    if debug_examples < 20 {
                        eprintln!(
                            "[spill-debug] control-with-slow mnem={} ops={:?} int_spills={} float_spills={}",
                            mnem,
                            inst.operands,
                            int_spills.len(),
                            float_spills.len()
                        );
                        debug_examples += 1;
                    }
                }
                if !post_ops.is_empty() {
                    debug_ctrl_post += 1;
                    if debug_examples < 20 {
                        eprintln!(
                            "[spill-debug] control-with-post mnem={} ops={:?} post_ops={}",
                            mnem,
                            inst.operands,
                            post_ops.len()
                        );
                        debug_examples += 1;
                    }
                }
            }

            if !pre_ops.is_empty() && rewritten.label.is_some() {
                pre_ops[0].label = rewritten.label.take();
            }

            new_insts.extend(pre_ops);
            new_insts.push(rewritten);
            new_insts.extend(post_ops);
        }
    }

    if debug {
        eprintln!(
            "[spill-debug] summary control_with_slow={} control_with_post={}",
            debug_ctrl_slow, debug_ctrl_post
        );
    }

    new_insts
}

fn build_class_plan(
    vars: &[String],
    spill_map: &HashMap<String, i32>,
    is_float: bool,
    used_regs: &HashSet<String>,
    use_counts: &HashMap<String, usize>,
    operands: &[String],
    def_indices: &[usize],
    use_indices: &[usize],
) -> ClassPlan {
    let mut sorted = vars.to_vec();
    sorted.sort();

    let mut used = used_regs.clone();
    build_class_plan_rec(
        &sorted,
        spill_map,
        is_float,
        &mut used,
        use_counts,
        operands,
        def_indices,
        use_indices,
    )
}

fn build_control_transfer_class_plan(
    vars: &[String],
    spill_map: &HashMap<String, i32>,
    is_float: bool,
    used_regs: &HashSet<String>,
    use_counts: &HashMap<String, usize>,
    operands: &[String],
    def_indices: &[usize],
    use_indices: &[usize],
) -> ClassPlan {
    let mut sorted = vars.to_vec();
    sorted.sort();

    let mut plan = ClassPlan::default();
    let mut used = used_regs.clone();

    for var in sorted {
        let offset = spill_map
            .get(&var)
            .copied()
            .unwrap_or_else(|| panic!("missing spill slot for {}", var))
            * 4;
        let reg = choose_victim(is_float, &used, use_counts)
            .unwrap_or_else(|| panic!("no victim register available for {}", var));
        used.insert(reg.clone());
        plan.map.insert(var.clone(), reg.clone());

        let (need_load, need_store) = need_load_store(&var, operands, def_indices, use_indices);
        if need_load {
            emit_mem_load(
                &mut plan.pre,
                if is_float { "lf" } else { "lw" },
                &reg,
                offset,
                &used,
            );
        }
        if need_store {
            // For control-transfer instructions, post-restores can be skipped on taken edges.
            // Keep this for rare DEF cases only; conditional branches in this IR are USE-only.
            emit_mem_store(
                &mut plan.post,
                if is_float { "sf" } else { "sw" },
                &reg,
                offset,
                &used,
            );
        }
    }

    plan
}

fn build_class_plan_rec(
    vars: &[String],
    spill_map: &HashMap<String, i32>,
    is_float: bool,
    used_regs: &mut HashSet<String>,
    use_counts: &HashMap<String, usize>,
    operands: &[String],
    def_indices: &[usize],
    use_indices: &[usize],
) -> ClassPlan {
    if vars.is_empty() {
        return ClassPlan::default();
    }

    if vars.len() == 1 {
        let var = vars[0].clone();
        let offset = spill_map
            .get(&var)
            .copied()
            .unwrap_or_else(|| panic!("missing spill slot for {}", var))
            * 4;
        let scratch = if is_float { "%f31" } else { "%i31" };

        let mut plan = ClassPlan::default();
        let (need_load, need_store) = need_load_store(&var, operands, def_indices, use_indices);

        if used_regs.contains(scratch) {
            // User policy: if %i30 is clean, prefer quick_spill with %i30
            // instead of slow_swap.
            if !is_float && !used_regs.contains("%i30") {
                plan.map.insert(var.clone(), "%i30".to_string());
                if need_load {
                    emit_mem_load(&mut plan.pre, "lw", "%i30", offset, used_regs);
                }
                if need_store {
                    emit_mem_store(&mut plan.post, "sw", "%i30", offset, used_regs);
                }
                return plan;
            }

            // If scratch is not read by this instruction, we can still use quick_spill safely.
            // Typical case: `cleq %i31, ...` where %i31 is DEF-only.
            if !reg_is_used_as_use(scratch, operands, use_indices) {
                plan.map.insert(var.clone(), scratch.to_string());
                if need_load {
                    emit_mem_load(
                        &mut plan.pre,
                        if is_float { "lf" } else { "lw" },
                        scratch,
                        offset,
                        used_regs,
                    );
                }
                if need_store {
                    emit_mem_store(
                        &mut plan.post,
                        if is_float { "sf" } else { "sw" },
                        scratch,
                        offset,
                        used_regs,
                    );
                }
                return plan;
            }

            // %i31/%f31 is already used by the instruction.
            // Use slow-style swap to preserve victim's live value.
            let swap_scratch = choose_victim(is_float, used_regs, use_counts)
                .unwrap_or_else(|| panic!("no swap scratch available for {}", var));
            let mut used2 = used_regs.clone();
            used2.insert(swap_scratch.clone());
            let victim = choose_victim(is_float, &used2, use_counts)
                .unwrap_or_else(|| panic!("no victim register available for {}", var));

            plan.map.insert(var.clone(), victim.clone());
            emit_reg_move(&mut plan.pre, is_float, &swap_scratch, &victim);
            emit_mem_load(
                &mut plan.pre,
                if is_float { "lf" } else { "lw" },
                &victim,
                offset,
                &used2,
            );
            emit_mem_store(
                &mut plan.pre,
                if is_float { "sf" } else { "sw" },
                &swap_scratch,
                offset,
                &used2,
            );
            // If the operand is never defined, restore victim immediately after use.
            // If defined, write back through the same slot during restore.
            if need_load || need_store {
                emit_mem_load(
                    &mut plan.post,
                    if is_float { "lf" } else { "lw" },
                    &swap_scratch,
                    offset,
                    &used2,
                );
                emit_mem_store(
                    &mut plan.post,
                    if is_float { "sf" } else { "sw" },
                    &victim,
                    offset,
                    &used2,
                );
                emit_reg_move(&mut plan.post, is_float, &victim, &swap_scratch);
            }
        } else {
            plan.map.insert(var.clone(), scratch.to_string());
            // quick_spill: load/store only when semantically needed.
            if need_load {
                emit_mem_load(
                    &mut plan.pre,
                    if is_float { "lf" } else { "lw" },
                    scratch,
                    offset,
                    used_regs,
                );
            }
            if need_store {
                emit_mem_store(
                    &mut plan.post,
                    if is_float { "sf" } else { "sw" },
                    scratch,
                    offset,
                    used_regs,
                );
            }
        }
        return plan;
    }

    // slow_spill as an outer wrapper.
    let slow_var = vars[0].clone();
    let rest = &vars[1..];

    let default_scratch = if is_float { "%f31" } else { "%i31" };
    let scratch = if used_regs.contains(default_scratch) {
        choose_victim(is_float, used_regs, use_counts)
            .unwrap_or_else(|| panic!("no scratch register available for {}", slow_var))
    } else {
        default_scratch.to_string()
    };
    used_regs.insert(scratch.clone());

    let victim = choose_victim(is_float, used_regs, use_counts)
        .unwrap_or_else(|| panic!("no victim register available for {}", slow_var));
    used_regs.insert(victim.clone());

    let offset = spill_map
        .get(&slow_var)
        .copied()
        .unwrap_or_else(|| panic!("missing spill slot for {}", slow_var))
        * 4;

    let mut inner = build_class_plan_rec(
        rest,
        spill_map,
        is_float,
        used_regs,
        use_counts,
        operands,
        def_indices,
        use_indices,
    );

    let mut pre = Vec::new();
    emit_reg_move(&mut pre, is_float, &scratch, &victim);
    emit_mem_load(
        &mut pre,
        if is_float { "lf" } else { "lw" },
        &victim,
        offset,
        used_regs,
    );
    emit_mem_store(
        &mut pre,
        if is_float { "sf" } else { "sw" },
        &scratch,
        offset,
        used_regs,
    );
    pre.extend(inner.pre);

    let mut post = inner.post;
    emit_mem_load(
        &mut post,
        if is_float { "lf" } else { "lw" },
        &scratch,
        offset,
        used_regs,
    );
    emit_mem_store(
        &mut post,
        if is_float { "sf" } else { "sw" },
        &victim,
        offset,
        used_regs,
    );
    emit_reg_move(&mut post, is_float, &victim, &scratch);

    inner.map.insert(slow_var, victim);
    inner.pre = pre;
    inner.post = post;
    inner
}

fn collect_spilled_vars_by_class(
    inst: &Instruction,
    spill_map: &HashMap<String, i32>,
) -> (Vec<String>, Vec<String>) {
    let mut ints: BTreeSet<String> = BTreeSet::new();
    let mut floats: BTreeSet<String> = BTreeSet::new();

    for op in &inst.operands {
        if is_virtual_register(op) && spill_map.contains_key(op) {
            if op.starts_with("%vf") {
                floats.insert(op.clone());
            } else {
                ints.insert(op.clone());
            }
        }
        if let Some(base) = extract_base(op) {
            if is_virtual_register(base) && spill_map.contains_key(base) {
                if base.starts_with("%vf") {
                    floats.insert(base.to_string());
                } else {
                    ints.insert(base.to_string());
                }
            }
        }
    }

    (ints.into_iter().collect(), floats.into_iter().collect())
}

fn collect_used_regs(
    inst: &Instruction,
    is_float: bool,
    spill_map: &HashMap<String, i32>,
    allocation: &Allocation,
) -> HashSet<String> {
    let mut used = HashSet::new();
    for op in &inst.operands {
        for r in extract_regs_from_op(op) {
            if is_float {
                if r.starts_with("%f") {
                    used.insert(r);
                } else if r.starts_with("%vf") && !spill_map.contains_key(&r) {
                    if let Some(Ok(c)) = allocation.get(&r) {
                        used.insert(format!("%f{}", c + 1));
                    }
                }
            } else if r.starts_with("%i") {
                used.insert(r);
            } else if r.starts_with("%vi") && !spill_map.contains_key(&r) {
                if let Some(Ok(c)) = allocation.get(&r) {
                    used.insert(format!("%i{}", c + 4));
                }
            }
        }
    }
    used
}

fn collect_physical_use_counts(
    instructions: &[Instruction],
    range: std::ops::Range<usize>,
) -> (HashMap<String, usize>, HashMap<String, usize>) {
    let mut int_use_counts: HashMap<String, usize> = HashMap::new();
    let mut float_use_counts: HashMap<String, usize> = HashMap::new();

    for i in range {
        let inst = &instructions[i];
        let mnem = inst.mnemonic.as_deref().unwrap_or("");
        let (_, use_indices) = get_def_use_indices(mnem, &inst.operands);
        for idx in use_indices {
            if let Some(op) = inst.operands.get(idx) {
                for reg in extract_regs_from_op(op) {
                    if reg.starts_with("%i") {
                        *int_use_counts.entry(reg).or_insert(0) += 1;
                    } else if reg.starts_with("%f") {
                        *float_use_counts.entry(reg).or_insert(0) += 1;
                    }
                }
            }
        }
    }

    (int_use_counts, float_use_counts)
}

fn choose_victim(
    is_float: bool,
    used_regs: &HashSet<String>,
    use_counts: &HashMap<String, usize>,
) -> Option<String> {
    let candidates: &[&str] = if is_float {
        &FLOAT_VICTIMS
    } else {
        &INT_VICTIMS
    };

    let mut best_reg: Option<&str> = None;
    let mut best_count: usize = usize::MAX;
    for r in candidates {
        if used_regs.contains(*r) {
            continue;
        }
        let cnt = *use_counts.get(*r).unwrap_or(&0);
        if best_reg.is_none() || cnt < best_count {
            best_reg = Some(*r);
            best_count = cnt;
        }
    }

    best_reg.map(|r| r.to_string())
}

fn need_load_store(
    var: &str,
    operands: &[String],
    def_indices: &[usize],
    use_indices: &[usize],
) -> (bool, bool) {
    let mut has_def = false;
    let mut has_use = false;

    for (idx, op) in operands.iter().enumerate() {
        if op == var {
            if def_indices.contains(&idx) {
                has_def = true;
            }
            if use_indices.contains(&idx) {
                has_use = true;
            }
        }
        if let Some(base) = extract_base(op) {
            if base == var {
                has_use = true;
            }
        }
    }

    // If classification missed a direct occurrence, treat it as USE to preserve safety.
    if !has_use && !has_def && operands.iter().any(|op| op == var) {
        has_use = true;
    }

    (has_use, has_def)
}

fn reg_is_used_as_use(reg: &str, operands: &[String], use_indices: &[usize]) -> bool {
    for idx in use_indices {
        if let Some(op) = operands.get(*idx) {
            if op == reg {
                return true;
            }
            if let Some(base) = extract_base(op) {
                if base == reg {
                    return true;
                }
            }
        }
    }
    false
}

fn rewrite_operand(op: &str, op_map: &HashMap<String, String>) -> String {
    if let Some(mapped) = op_map.get(op) {
        return mapped.clone();
    }

    if let Some((off, base)) = parse_offset(op) {
        if let Some(mapped) = op_map.get(&base) {
            return format!("{}({})", off, mapped);
        }
    }

    op.to_string()
}

fn emit_reg_move(out: &mut Vec<Instruction>, is_float: bool, dst: &str, src: &str) {
    out.push(Instruction {
        label: None,
        mnemonic: Some(if is_float { "fmov" } else { "mov" }.to_string()),
        operands: vec![dst.to_string(), src.to_string()],
    });
}

fn emit_mem_load(
    out: &mut Vec<Instruction>,
    mnem: &str,
    reg: &str,
    off: i32,
    used_regs: &HashSet<String>,
) {
    if (-2048..2048).contains(&off) {
        out.push(Instruction {
            label: None,
            mnemonic: Some(mnem.to_string()),
            operands: vec![reg.to_string(), format!("{}(%i1)", off)],
        });
        return;
    }

    let addr = choose_addr_temp(used_regs)
        .unwrap_or_else(|| panic!("no free integer register for large offset {}", off));
    emit_movi(out, &addr, off);
    out.push(Instruction {
        label: None,
        mnemonic: Some("add".to_string()),
        operands: vec![addr.clone(), "%i1".to_string(), addr.clone()],
    });
    out.push(Instruction {
        label: None,
        mnemonic: Some(mnem.to_string()),
        operands: vec![reg.to_string(), format!("0({})", addr)],
    });
}

fn emit_mem_store(
    out: &mut Vec<Instruction>,
    mnem: &str,
    reg: &str,
    off: i32,
    used_regs: &HashSet<String>,
) {
    if (-2048..2048).contains(&off) {
        out.push(Instruction {
            label: None,
            mnemonic: Some(mnem.to_string()),
            operands: vec![reg.to_string(), format!("{}(%i1)", off)],
        });
        return;
    }

    let addr = choose_addr_temp(used_regs)
        .unwrap_or_else(|| panic!("no free integer register for large offset {}", off));
    emit_movi(out, &addr, off);
    out.push(Instruction {
        label: None,
        mnemonic: Some("add".to_string()),
        operands: vec![addr.clone(), "%i1".to_string(), addr.clone()],
    });
    out.push(Instruction {
        label: None,
        mnemonic: Some(mnem.to_string()),
        operands: vec![reg.to_string(), format!("0({})", addr)],
    });
}

fn choose_addr_temp(used_regs: &HashSet<String>) -> Option<String> {
    for r in INT_VICTIMS {
        if !used_regs.contains(r) {
            return Some(r.to_string());
        }
    }
    None
}

fn emit_movi(out: &mut Vec<Instruction>, reg: &str, value: i32) {
    if (-2048..2048).contains(&value) {
        out.push(Instruction {
            label: None,
            mnemonic: Some("movi".to_string()),
            operands: vec![reg.to_string(), value.to_string()],
        });
        return;
    }

    let n = value as u32;
    let lower = n & 0xFFF;
    let upper = (n >> 12) & 0xFFFFF;
    out.push(Instruction {
        label: None,
        mnemonic: Some("movui".to_string()),
        operands: vec![reg.to_string(), upper.to_string()],
    });
    if lower != 0 {
        let lower_imm = if lower >= 2048 {
            lower as i32 - 4096
        } else {
            lower as i32
        };
        out.push(Instruction {
            label: None,
            mnemonic: Some("ori".to_string()),
            operands: vec![reg.to_string(), reg.to_string(), lower_imm.to_string()],
        });
    }
}

fn is_virtual_register(s: &str) -> bool {
    s.starts_with("%vi") || s.starts_with("%vf")
}

fn parse_offset(s: &str) -> Option<(i32, String)> {
    let start = s.find('(')?;
    let end = s.find(')')?;
    let off_str = s[0..start].trim();
    let base = s[start + 1..end].trim();

    let off = if off_str.is_empty() {
        0
    } else {
        off_str.parse::<i32>().ok()?
    };

    Some((off, base.to_string()))
}

fn expect_operand<'a>(operands: &'a [String], mnemonic: &str, index: usize) -> &'a str {
    operands.get(index).map(String::as_str).unwrap_or_else(|| {
        panic!(
            "spilling::get_def_use_indices: missing operand {} for '{}' operands={:?}",
            index, mnemonic, operands
        )
    })
}

fn expect_direct_reg_operand(operands: &[String], mnemonic: &str, index: usize) {
    let op = expect_operand(operands, mnemonic, index);
    if !op.starts_with('%') {
        panic!(
            "spilling::get_def_use_indices: expected register at {}[{}], got '{}'",
            mnemonic, index, op
        );
    }
}

fn expect_offset_base_reg_operand(operands: &[String], mnemonic: &str, index: usize) {
    let op = expect_operand(operands, mnemonic, index);
    let Some((_, base)) = parse_offset(op) else {
        panic!(
            "spilling::get_def_use_indices: expected offset(base) at {}[{}], got '{}'",
            mnemonic, index, op
        );
    };
    if !base.starts_with('%') {
        panic!(
            "spilling::get_def_use_indices: expected base register at {}[{}], got '{}'",
            mnemonic, index, base
        );
    }
}

fn extract_base(s: &str) -> Option<&str> {
    let start = s.find('(')?;
    let end = s.find(')')?;
    let base = &s[start + 1..end];
    if !base.starts_with('%') {
        panic!(
            "spilling::extract_base: non-register base '{}' in operand '{}'",
            base, s
        );
    }
    Some(base)
}

fn extract_regs_from_op(s: &str) -> Vec<String> {
    let mut out = Vec::new();
    if s.starts_with('%') {
        out.push(s.to_string());
        return out;
    }

    if let Some((_, base)) = parse_offset(s) {
        if !base.starts_with('%') {
            panic!(
                "spilling::extract_regs_from_op: non-register base '{}' in operand '{}'",
                base, s
            );
        }
        out.push(base);
    }

    out
}

fn get_def_use_indices(mnemonic: &str, operands: &[String]) -> (Vec<usize>, Vec<usize>) {
    let n = operands.len();
    let mut defs = Vec::new();
    let mut uses = Vec::new();

    match mnemonic {
        // 3-operand reg-reg/reg-float ops: dst, src1, src2
        "add" | "sub" | "sll" | "sar" | "or" | "xor" | "ceq" | "cleq" | "clt" | "feq"
        | "fneq" | "fleq" | "flt" | "fadd" | "fsub" | "fmul" | "fdiv" => {
            if n > 0 {
                expect_direct_reg_operand(operands, mnemonic, 0);
                defs.push(0);
            }
            if n > 1 {
                expect_direct_reg_operand(operands, mnemonic, 1);
                uses.push(1);
            }
            if n > 2 {
                expect_direct_reg_operand(operands, mnemonic, 2);
                uses.push(2);
            }
        }
        // 4-operand float fused multiply-add: dst, src1, src2, src3
        "fma" => {
            if n > 0 {
                expect_direct_reg_operand(operands, mnemonic, 0);
                defs.push(0);
            }
            if n > 1 {
                expect_direct_reg_operand(operands, mnemonic, 1);
                uses.push(1);
            }
            if n > 2 {
                expect_direct_reg_operand(operands, mnemonic, 2);
                uses.push(2);
            }
            if n > 3 {
                expect_direct_reg_operand(operands, mnemonic, 3);
                uses.push(3);
            }
        }
        // Ternary select: dst, cond, then, else
        "tern" | "ftern" => {
            if n > 0 {
                expect_direct_reg_operand(operands, mnemonic, 0);
                defs.push(0);
            }
            if n > 1 {
                expect_direct_reg_operand(operands, mnemonic, 1);
                uses.push(1);
            }
            if n > 2 {
                expect_direct_reg_operand(operands, mnemonic, 2);
                uses.push(2);
            }
            if n > 3 {
                expect_direct_reg_operand(operands, mnemonic, 3);
                uses.push(3);
            }
        }
        // 3-operand immediate ops: dst, src, imm
        "addi" | "subi" | "slli" | "sari" | "ori" | "xori" | "ceqi" | "cleqi" | "clti" => {
            if n > 0 {
                expect_direct_reg_operand(operands, mnemonic, 0);
                defs.push(0);
            }
            if n > 1 {
                expect_direct_reg_operand(operands, mnemonic, 1);
                uses.push(1);
            }
        }
        // 2-operand ops: dst, src
        "mov" | "neg" | "fmov" | "fneg" | "finv" | "frsqrt" | "ffloor" | "fabs" | "ftoi"
        | "itof" | "mif" => {
            if n > 0 {
                expect_direct_reg_operand(operands, mnemonic, 0);
                defs.push(0);
            }
            if n > 1 {
                expect_direct_reg_operand(operands, mnemonic, 1);
                uses.push(1);
            }
        }
        // Loads: dst, off(base)
        "lw" | "lf" | "lb" => {
            if n > 0 {
                expect_direct_reg_operand(operands, mnemonic, 0);
                defs.push(0);
            }
            if n > 1 {
                expect_offset_base_reg_operand(operands, mnemonic, 1);
                uses.push(1);
            }
        }
        "sw" | "sf" | "sb" => {
            if n > 0 {
                expect_direct_reg_operand(operands, mnemonic, 0);
                uses.push(0);
            }
            if n > 1 {
                expect_offset_base_reg_operand(operands, mnemonic, 1);
                uses.push(1);
            }
        }
        "jzero" => {
            if n > 1 {
                expect_direct_reg_operand(operands, mnemonic, 1);
                uses.push(1);
            }
        }
        // jeq rs1, rs2, label  / jlt rs1, rs2, label  / jleq rs1, rs2, label
        "jeq" | "jlt" | "jleq" => {
            if n > 0 {
                expect_direct_reg_operand(operands, mnemonic, 0);
                uses.push(0);
            }
            if n > 1 {
                expect_direct_reg_operand(operands, mnemonic, 1);
                uses.push(1);
            }
        }
        "jmp" => {
            if n > 0 && operands[0] != "%i0" {
                expect_direct_reg_operand(operands, mnemonic, 0);
                defs.push(0);
            }
            if n > 1 {
                expect_offset_base_reg_operand(operands, mnemonic, 1);
                uses.push(1);
            }
        }
        "call_dir" => {}
        "call_cls" => {
            if n > 0 {
                expect_direct_reg_operand(operands, mnemonic, 0);
                uses.push(0);
            }
        }
        "ret" => {}
        "movi" | "movui" => {
            if n > 0 {
                expect_direct_reg_operand(operands, mnemonic, 0);
                defs.push(0);
            }
        }
        "set_label" => {
            if n > 0 {
                expect_direct_reg_operand(operands, mnemonic, 0);
                defs.push(0);
            }
        }
        // .virtual_def: DEF of all operand registers, USE of none.
        ".virtual_def" => {
            for idx in 0..n {
                expect_direct_reg_operand(operands, mnemonic, idx);
                defs.push(idx);
            }
        }
        "" | "nop" | "print_debug" | ".data" | ".text" | ".align" | ".global" | ".section" | ".func_entry"
        | ".end_function" | ".long" => {}
        _ => panic!(
            "spilling::get_def_use_indices: unknown mnemonic '{}' operands={:?}",
            mnemonic, operands
        ),
    }

    (defs, uses)
}

fn is_control_transfer(mnem: &str) -> bool {
    matches!(mnem, "jzero" | "jeq" | "jlt" | "jleq" | "jmp" | "ret" | "call_dir" | "call_cls")
}
