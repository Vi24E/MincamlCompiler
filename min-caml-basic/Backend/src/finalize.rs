/// Finalize: expand pseudo-instructions (call_dir, call_cls, ret) and insert prologue/epilogue.
use crate::analysis;
use crate::coloring::Allocation;
use crate::input::Instruction;
use crate::program;
use std::collections::{BTreeMap, BTreeSet, HashSet, VecDeque};
use std::ops::Range;

fn is_create_array_call_dir_target(inst: &Instruction) -> bool {
    let Some(mnemonic) = inst.mnemonic.as_deref() else {
        return false;
    };
    if mnemonic != "call_dir" {
        return false;
    }
    let Some(label) = inst.operands.get(0) else {
        return false;
    };
    matches!(
        label.as_str(),
        "min_caml_create_array" | "min_caml_create_float_array"
    )
}

#[derive(Clone, Default)]
struct FunctionSavePolicy {
    // Callee-save filtering: save only registers used by ancestors.
    ancestor_used: BTreeSet<String>,
    // Caller-save filtering: save only registers clobbered by offsprings.
    offspring_caller_clobber: BTreeSet<String>,
    // Per direct-call target caller-save clobber set.
    call_dir_clobber: BTreeMap<String, BTreeSet<String>>,
}

#[derive(Clone, Default)]
struct FunctionInterprocMeta {
    name: String,
    direct_calls: Vec<String>,
    edge_need_callee: BTreeMap<String, BTreeSet<String>>,
    local_caller_clobber: BTreeSet<String>,
    /// Callee-save registers that this function defines (writes to).
    /// Used for smart transitive propagation: if a function saves a callee-save
    /// register (because it defs it and it's in ancestor_used), its callees
    /// don't need to preserve that register for the function's ancestors.
    local_callee_defs: BTreeSet<String>,
    self_recursive: bool,
}

fn infer_function_name_for_range(func_insts: &[Instruction]) -> String {
    let starts_with_func_entry = func_insts
        .first()
        .and_then(|i| i.mnemonic.as_ref())
        .map(|m| m == ".func_entry")
        .unwrap_or(false);
    if starts_with_func_entry {
        return func_insts
            .get(1)
            .and_then(|i| i.label.clone())
            .unwrap_or_default();
    }
    func_insts
        .iter()
        .find_map(|i| i.label.clone())
        .unwrap_or_default()
}

fn collect_direct_calls_in_range(func_insts: &[Instruction]) -> Vec<String> {
    let mut out = BTreeSet::new();
    for inst in func_insts {
        if inst.mnemonic.as_deref() == Some("call_dir") {
            if let Some(label) = inst.operands.first() {
                out.insert(label.clone());
            }
        }
    }
    out.into_iter().collect()
}

fn external_caller_clobber_regs(name: &str) -> BTreeSet<String> {
    let all_caller = std::env::var("BACKEND_ALL_CALLER_SAVE")
        .map(|v| v != "0")
        .unwrap_or(true);
    let mut out = BTreeSet::new();
    match name {
        // print_newline clobbers %i4 (movi %i4, 10) and %i5 (movui %i5, addr).
        "min_caml_print_newline" => {
            out.insert("%i4".to_string());
            out.insert("%i5".to_string());
            return out;
        }
        // print_char/read_char clobber %i5 only.
        "min_caml_print_char" | "min_caml_read_char" => {
            out.insert("%i5".to_string());
            return out;
        }
        // array creators use %i15 as temporary under current ABI.
        "min_caml_create_array" | "min_caml_create_float_array" => {
            out.insert("%i15".to_string());
            return out;
        }
        // rsqrt/floor/fabs write only %f30 (not caller-save).
        "min_caml_rsqrt" | "min_caml_floor" | "min_caml_fabs" => return out,
        _ => {}
    }
    // Unknown external call: conservative fallback.
    if all_caller {
        for i in 4..=29 {
            out.insert(format!("%i{}", i));
        }
        for i in 1..=29 {
            out.insert(format!("%f{}", i));
        }
    } else {
        for i in 4..=15 {
            out.insert(format!("%i{}", i));
        }
        for i in 1..=15 {
            out.insert(format!("%f{}", i));
        }
    }
    out
}

fn build_interproc_save_policies(
    instructions: &[Instruction],
    allocation: &Allocation,
    ranges: &[Range<usize>],
) -> Vec<FunctionSavePolicy> {
    let mut metas = Vec::with_capacity(ranges.len());
    for range in ranges {
        let func_insts = &instructions[range.clone()];
        let name = infer_function_name_for_range(func_insts);
        let direct_calls = collect_direct_calls_in_range(func_insts);
        let analyzed = analysis::analyze(func_insts);
        let mut edge_need_callee: BTreeMap<String, BTreeSet<String>> = BTreeMap::new();
        let mut local_caller_clobber = BTreeSet::new();
        let mut local_callee_defs = BTreeSet::new();
        let mut has_call_cls = false;
        for (idx, info) in analyzed.iter().enumerate() {
            for d in &info.defs {
                if let Some(phys) = resolve_reg_to_physical(d, allocation) {
                    if is_caller_save_int_reg(&phys) || is_caller_save_float_reg(&phys) {
                        local_caller_clobber.insert(phys.clone());
                    }
                    if is_callee_save_int_reg(&phys) || is_callee_save_float_reg(&phys) {
                        local_callee_defs.insert(phys);
                    }
                }
            }
            let is_call = matches!(
                func_insts[idx].mnemonic.as_deref(),
                Some("call_dir") | Some("call_cls")
            );
            if func_insts[idx].mnemonic.as_deref() == Some("call_cls") {
                has_call_cls = true;
            }
            if is_call && func_insts[idx].mnemonic.as_deref() == Some("call_dir") {
                let Some(callee) = func_insts[idx].operands.first() else {
                    continue;
                };
                if callee == "min_caml_create_array" || callee == "min_caml_create_float_array" {
                    // Finalize expands these helpers with %i15 as jump target scratch.
                    // This clobber is not visible in pre-finalize DEF sets.
                    local_caller_clobber.insert("%i15".to_string());
                }
                let edge_set = edge_need_callee.entry(callee.clone()).or_default();
                for r in &info.live_out {
                    if let Some(phys) = resolve_reg_to_physical(r, allocation) {
                        if is_callee_save_int_reg(&phys) || is_callee_save_float_reg(&phys) {
                            edge_set.insert(phys);
                        }
                    }
                }
            }
        }
        // If this function contains call_cls (closure call), the target is
        // unknown at compile time, so conservatively assume all caller-save
        // registers may be clobbered.
        if has_call_cls {
            for i in 4..=15 {
                local_caller_clobber.insert(format!("%i{}", i));
            }
            for i in 1..=15 {
                local_caller_clobber.insert(format!("%f{}", i));
            }
        }
        let self_recursive = !name.is_empty() && direct_calls.iter().any(|c| c == &name);
        metas.push(FunctionInterprocMeta {
            name,
            direct_calls,
            edge_need_callee,
            local_caller_clobber,
            local_callee_defs,
            self_recursive,
        });
    }

    let n = metas.len();
    let mut name_to_idx = BTreeMap::new();
    for (i, m) in metas.iter().enumerate() {
        if !m.name.is_empty() {
            name_to_idx.entry(m.name.clone()).or_insert(i);
        }
    }

    let mut adj: Vec<Vec<usize>> = vec![Vec::new(); n];
    for (i, m) in metas.iter().enumerate() {
        for callee in &m.direct_calls {
            if let Some(&j) = name_to_idx.get(callee) {
                adj[i].push(j);
            }
        }
    }

    struct TarjanCtx {
        index: usize,
        stack: Vec<usize>,
        on_stack: Vec<bool>,
        indices: Vec<Option<usize>>,
        lowlink: Vec<usize>,
        comps: Vec<Vec<usize>>,
    }
    fn strong_connect(v: usize, adj: &[Vec<usize>], ctx: &mut TarjanCtx) {
        let v_index = ctx.index;
        ctx.indices[v] = Some(v_index);
        ctx.lowlink[v] = v_index;
        ctx.index += 1;
        ctx.stack.push(v);
        ctx.on_stack[v] = true;
        for &w in &adj[v] {
            if ctx.indices[w].is_none() {
                strong_connect(w, adj, ctx);
                ctx.lowlink[v] = ctx.lowlink[v].min(ctx.lowlink[w]);
            } else if ctx.on_stack[w] {
                let w_index = ctx.indices[w].unwrap_or(usize::MAX);
                ctx.lowlink[v] = ctx.lowlink[v].min(w_index);
            }
        }
        if ctx.lowlink[v] == v_index {
            let mut comp = Vec::new();
            loop {
                let w = ctx.stack.pop().unwrap_or(v);
                ctx.on_stack[w] = false;
                comp.push(w);
                if w == v {
                    break;
                }
            }
            ctx.comps.push(comp);
        }
    }

    let mut tarjan = TarjanCtx {
        index: 0,
        stack: Vec::new(),
        on_stack: vec![false; n],
        indices: vec![None; n],
        lowlink: vec![0; n],
        comps: Vec::new(),
    };
    for v in 0..n {
        if tarjan.indices[v].is_none() {
            strong_connect(v, &adj, &mut tarjan);
        }
    }
    let comps = tarjan.comps;
    let m = comps.len();

    let mut comp_of = vec![0usize; n];
    for (cid, comp) in comps.iter().enumerate() {
        for &v in comp {
            comp_of[v] = cid;
        }
    }

    let mut dag: Vec<BTreeSet<usize>> = vec![BTreeSet::new(); m];
    let mut indeg = vec![0usize; m];
    for u in 0..n {
        let cu = comp_of[u];
        for &v in &adj[u] {
            let cv = comp_of[v];
            if cu != cv && dag[cu].insert(cv) {
                indeg[cv] += 1;
            }
        }
    }

    let mut q = VecDeque::new();
    for (cid, &deg) in indeg.iter().enumerate() {
        if deg == 0 {
            q.push_back(cid);
        }
    }
    let mut topo = Vec::new();
    while let Some(cid) = q.pop_front() {
        topo.push(cid);
        for &nxt in &dag[cid] {
            indeg[nxt] = indeg[nxt].saturating_sub(1);
            if indeg[nxt] == 0 {
                q.push_back(nxt);
            }
        }
    }

    // Bottom-up summary of caller-save clobbers.
    let mut summary = vec![BTreeSet::new(); n];
    for i in 0..n {
        summary[i] = metas[i].local_caller_clobber.clone();
    }
    for &cid in topo.iter().rev() {
        let comp = &comps[cid];
        let mut changed = true;
        let mut iter = 0usize;
        while changed && iter < 64 {
            changed = false;
            iter += 1;
            for &u in comp {
                let mut next = metas[u].local_caller_clobber.clone();
                for callee in &metas[u].direct_calls {
                    if let Some(&v) = name_to_idx.get(callee) {
                        next.extend(summary[v].iter().cloned());
                    } else {
                        next.extend(external_caller_clobber_regs(callee));
                    }
                }
                if next != summary[u] {
                    summary[u] = next;
                    changed = true;
                }
            }
        }
    }

    let mut policies = vec![FunctionSavePolicy::default(); n];
    for i in 0..n {
        let mut off = BTreeSet::new();
        for callee in &metas[i].direct_calls {
            let clobber_set = if let Some(&v) = name_to_idx.get(callee) {
                summary[v].clone()
            } else {
                external_caller_clobber_regs(callee)
            };
            policies[i]
                .call_dir_clobber
                .insert(callee.clone(), clobber_set.clone());
            off.extend(clobber_set);
        }
        policies[i].offspring_caller_clobber = off;
    }

    // Ancestor requirement for callee-save:
    // For each call edge (u -> v), propagate only the callee-save registers
    // that are actually live-out at that edge.
    for (_u, meta) in metas.iter().enumerate() {
        for (callee, need) in &meta.edge_need_callee {
            if let Some(&v) = name_to_idx.get(callee) {
                policies[v].ancestor_used.extend(need.iter().cloned());
            }
        }
    }

    // For call_cls (closure calls), the target is unknown.  Conservatively
    // collect all callee-save registers that are live-out at any call_cls site
    // and mark them as needed in ALL functions (any could be the target).
    {
        let mut cls_callee_need: BTreeSet<String> = BTreeSet::new();
        for range in ranges {
            let func_insts = &instructions[range.clone()];
            let analyzed_cls = analysis::analyze(func_insts);
            for (idx, info) in analyzed_cls.iter().enumerate() {
                if func_insts[idx].mnemonic.as_deref() == Some("call_cls") {
                    for r in &info.live_out {
                        if let Some(phys) = resolve_reg_to_physical(r, allocation) {
                            if is_callee_save_int_reg(&phys) || is_callee_save_float_reg(&phys) {
                                cls_callee_need.insert(phys);
                            }
                        }
                    }
                }
            }
        }
        if !cls_callee_need.is_empty() {
            for policy in &mut policies {
                policy.ancestor_used.extend(cls_callee_need.iter().cloned());
            }
        }
    }

    // Recursive SCC/self-edge: keep intra-component edge requirements.
    for comp in &comps {
        let is_recursive_comp = comp.len() > 1;
        for &u in comp {
            if !is_recursive_comp && !metas[u].self_recursive {
                continue;
            }
            for (callee, need) in &metas[u].edge_need_callee {
                if let Some(&v) = name_to_idx.get(callee) {
                    if comp_of[v] == comp_of[u] {
                        policies[v].ancestor_used.extend(need.iter().cloned());
                    }
                }
            }
        }
    }

    // Transitive propagation of ancestor_used down the call graph.
    //
    // If function F has %r in ancestor_used (an ancestor of F needs %r
    // preserved) but F itself does not def %r, F will not save/restore %r.
    // Any callee G of F that clobbers %r would corrupt the ancestor's value.
    //
    // Smart propagation: only propagate registers that the intermediate
    // function does NOT save.  A function saves %r iff %r ∈ ancestor_used ∩
    // local_callee_defs.  So we propagate:
    //   parent.ancestor_used \ parent.local_callee_defs
    // (registers in ancestor_used that the parent doesn't def → won't save →
    // must be preserved by callees).
    for &cid in &topo {
        let comp = &comps[cid];
        // Unify ancestor_used within the SCC (fixed-point).
        let mut changed = true;
        let mut iter = 0usize;
        while changed && iter < 64 {
            changed = false;
            iter += 1;
            for &u in comp {
                let propagate: BTreeSet<String> = policies[u]
                    .ancestor_used
                    .difference(&metas[u].local_callee_defs)
                    .cloned()
                    .collect();
                if propagate.is_empty() {
                    continue;
                }
                for callee in &metas[u].direct_calls {
                    if let Some(&v) = name_to_idx.get(callee) {
                        if comp_of[v] == cid {
                            let before = policies[v].ancestor_used.len();
                            policies[v].ancestor_used.extend(propagate.iter().cloned());
                            if policies[v].ancestor_used.len() > before {
                                changed = true;
                            }
                        }
                    }
                }
            }
        }
        // Propagate to callees in downstream SCCs.
        for &u in comp {
            let propagate: BTreeSet<String> = policies[u]
                .ancestor_used
                .difference(&metas[u].local_callee_defs)
                .cloned()
                .collect();
            if propagate.is_empty() {
                continue;
            }
            for callee in &metas[u].direct_calls {
                if let Some(&v) = name_to_idx.get(callee) {
                    if comp_of[v] != cid {
                        policies[v].ancestor_used.extend(propagate.iter().cloned());
                    }
                }
            }
        }
    }

    policies
}

pub fn finalize_code(instructions: Vec<Instruction>, allocation: &Allocation) -> Vec<Instruction> {
    let mut final_insts = Vec::new();
    let functions = program::partition_function_ranges(&instructions);
    let save_policies = build_interproc_save_policies(&instructions, allocation, &functions);

    for (func_idx, range) in functions.iter().enumerate() {
        let policy = save_policies.get(func_idx).cloned().unwrap_or_default();
        let func_insts = &instructions[range.clone()];

        let starts_with_func_entry = func_insts
            .first()
            .and_then(|i| i.mnemonic.as_ref())
            .map(|m| m == ".func_entry")
            .unwrap_or(false);

        let label_name = if starts_with_func_entry {
            func_insts
                .get(1)
                .and_then(|i| i.label.as_ref())
                .map(|l| l.as_str())
                .unwrap_or("")
        } else {
            // Main region may start with directives (.data/.text/.global), so
            // use the first available label instead of only the first instruction.
            func_insts
                .iter()
                .find_map(|i| i.label.as_deref())
                .unwrap_or("")
        };

        // Special functions: min_caml_start, fin, library functions, empty label
        // .func_entry means it's a user-defined function
        // No .func_entry means it's either main/fin region or library function
        let is_library =
            !starts_with_func_entry && label_name != "min_caml_start" && !label_name.is_empty();

        let is_main_or_fin = !starts_with_func_entry && !is_library;

        if is_library {
            // Library functions: pass through completely unchanged
            for inst in func_insts {
                final_insts.push(inst.clone());
            }
            continue;
        }

        let analyzed_func = analysis::analyze(func_insts);

        if is_main_or_fin || label_name.is_empty() {
            // min_caml_start, fin, or empty: no prologue/epilogue, but expand call_dir/call_cls/ret
            let main_extra_frame = if label_name == "min_caml_start" {
                compute_main_extra_frame(func_insts)
            } else {
                0
            };
            let mut inserted_main_extra = main_extra_frame == 0;
            let has_main_anchor = func_insts.iter().any(is_main_sp_anchor);
            if !inserted_main_extra && !has_main_anchor {
                // Fallback: if the expected anchor is missing, still reserve space to keep spills safe.
                emit_subi(&mut final_insts, "%i1", "%i1", main_extra_frame);
                inserted_main_extra = true;
            }
            for (idx, inst) in func_insts.iter().enumerate() {
                let mnemonic = inst.mnemonic.as_deref().unwrap_or("");
                if mnemonic == ".func_entry" || mnemonic == ".end_function" {
                    continue;
                }
                if mnemonic == "call_dir" {
                    let call_dir_hint = inst
                        .operands
                        .first()
                        .and_then(|lbl| policy.call_dir_clobber.get(lbl))
                        .or(Some(&policy.offspring_caller_clobber));
                    let defined_before_call = collect_defined_regs_before_call_in_block(
                        func_insts,
                        &analyzed_func,
                        idx,
                        allocation,
                    );
                    let live_in_at_block_entry = collect_live_in_regs_at_block_entry(
                        func_insts,
                        &analyzed_func,
                        idx,
                        allocation,
                    );
                    let (save_int, save_float) = collect_call_save_regs(
                        &analyzed_func[idx].live_out,
                        &defined_before_call,
                        &live_in_at_block_entry,
                        call_dir_hint,
                        allocation,
                    );
                    if is_create_array_call_dir_target(inst) {
                        let create_save_int = filter_create_array_save_int(&save_int);
                        expand_call_dir_create_array(&mut final_insts, inst, &create_save_int);
                    } else {
                        expand_call_dir(&mut final_insts, inst, &save_int, &save_float);
                    }
                } else if mnemonic == "call_cls" {
                    let defined_before_call = collect_defined_regs_before_call_in_block(
                        func_insts,
                        &analyzed_func,
                        idx,
                        allocation,
                    );
                    let live_in_at_block_entry = collect_live_in_regs_at_block_entry(
                        func_insts,
                        &analyzed_func,
                        idx,
                        allocation,
                    );
                let (save_int, save_float) =
                    collect_call_save_regs(
                        &analyzed_func[idx].live_out,
                        &defined_before_call,
                        &live_in_at_block_entry,
                        None, // call_cls target is unknown; conservatively save all live caller-save
                        allocation,
                    );
                expand_call_cls(&mut final_insts, inst, &save_int, &save_float);
                } else if mnemonic == "ret" {
                    // ret in main/fin: just jump to return address (no frame to restore)
                    // Return convention in v2: %i30/%f30 hold return values.
                    final_insts.push(Instruction {
                        label: inst.label.clone(),
                        mnemonic: Some("mov".to_string()),
                        operands: vec!["%i30".to_string(), "%i4".to_string()],
                    });
                    final_insts.push(Instruction {
                        label: None,
                        mnemonic: Some("fmov".to_string()),
                        operands: vec!["%f30".to_string(), "%f1".to_string()],
                    });
                    final_insts.push(Instruction {
                        label: None,
                        mnemonic: Some("jmp".to_string()),
                        operands: vec!["%i0".to_string(), "0(%i3)".to_string()],
                    });
                } else {
                    final_insts.push(inst.clone());
                }
                if !inserted_main_extra && is_main_sp_anchor(inst) {
                    // Reserve additional frame space for spills in min_caml_start.
                    // Without this, spill slots can overlap global memory at 0x0700_0000.
                    emit_subi(&mut final_insts, "%i1", "%i1", main_extra_frame);
                    inserted_main_extra = true;
                }
            }
            continue;
        }

        // Regular function: analyze frame, emit prologue, body, epilogue
        let (max_spill_offset, has_call) = analyze_function_frame(func_insts);
        let (mut callee_save_int, mut callee_save_float) =
            collect_used_callee_save_regs(&analyzed_func, allocation);
        let disable_callee_filter = std::env::var("BACKEND_DISABLE_CALLEE_FILTER")
            .map(|v| v != "0")
            .unwrap_or(false); // enabled by default (transitive propagation fixed)
        if !disable_callee_filter {
            let before_int = callee_save_int.len();
            let before_float = callee_save_float.len();
            callee_save_int.retain(|r| policy.ancestor_used.contains(r));
            callee_save_float.retain(|r| policy.ancestor_used.contains(r));
            let removed = (before_int - callee_save_int.len()) + (before_float - callee_save_float.len());
            if removed > 0 {
                eprintln!(
                    "[callee-filter] {}: removed {} callee-save regs (int: {}->{}, float: {}->{}), ancestor_used={}",
                    label_name, removed,
                    before_int, callee_save_int.len(),
                    before_float, callee_save_float.len(),
                    policy.ancestor_used.len()
                );
            }
        }

        // Frame layout:
        //   [spill slots]         0 .. spill_size-1
        //   [RA save]             next (if has_call)
        //   [callee-save int]     next
        //   [callee-save float]   next
        let spill_size = max_spill_offset;
        let mut next_off = spill_size;
        let ra_offset = if has_call {
            let off = next_off;
            next_off += 4;
            Some(off)
        } else {
            None
        };

        let mut callee_int_slots = Vec::new();
        for reg in &callee_save_int {
            callee_int_slots.push((reg.clone(), next_off));
            next_off += 4;
        }
        let mut callee_float_slots = Vec::new();
        for reg in &callee_save_float {
            callee_float_slots.push((reg.clone(), next_off));
            next_off += 4;
        }

        let mut frame_size = next_off;

        // Align to 8 bytes
        if frame_size % 8 != 0 {
            frame_size += 8 - (frame_size % 8);
        }

        // Emit label only (not the mnemonic, which belongs to the body)
        let label_inst_idx = if starts_with_func_entry { 1 } else { 0 };
        if let Some(label_inst) = func_insts.get(label_inst_idx) {
            if label_inst.label.is_some() {
                final_insts.push(Instruction {
                    label: label_inst.label.clone(),
                    mnemonic: None,
                    operands: Vec::new(),
                });
            }
        }

        // Emit prologue
        if frame_size > 0 {
            emit_subi(&mut final_insts, "%i1", "%i1", frame_size);
        }
        if let Some(off) = ra_offset {
            emit_store(&mut final_insts, "sw", "%i3", off, "%i1");
        }
        for (reg, off) in &callee_int_slots {
            emit_store(&mut final_insts, "sw", reg, *off, "%i1");
        }
        for (reg, off) in &callee_float_slots {
            emit_store(&mut final_insts, "sf", reg, *off, "%i1");
        }

        // Emit body (start from label_inst_idx; strip label from the label instruction
        // since it was already emitted above)
        let mut idx = label_inst_idx;
        while idx < func_insts.len() {
            let inst = &func_insts[idx];
            let mnemonic = inst.mnemonic.as_deref().unwrap_or("");

            if mnemonic.is_empty() && inst.label.is_some() && idx == label_inst_idx {
                // Label-only instruction already emitted above
                idx += 1;
                continue;
            }

            if mnemonic == ".func_entry" {
                idx += 1;
                continue;
            }

            if mnemonic == ".end_function" {
                idx += 1;
                continue;
            }

            // Strip label if it was already emitted as the function label
            let emit_label = if idx == label_inst_idx {
                None
            } else {
                inst.label.clone()
            };

            if mnemonic == "ret" {
                // Emit epilogue.
                // IMPORTANT: if this ret has a label (branch target), the label must
                // be attached to the *first* expanded instruction, not the final jmp.
                // Otherwise control can jump into the middle of epilogue and skip
                // frame/RA restoration.
                let ret_start_idx = final_insts.len();
                // Return convention in v2: %i30/%f30 hold return values.
                final_insts.push(Instruction {
                    label: None,
                    mnemonic: Some("mov".to_string()),
                    operands: vec!["%i30".to_string(), "%i4".to_string()],
                });
                final_insts.push(Instruction {
                    label: None,
                    mnemonic: Some("fmov".to_string()),
                    operands: vec!["%f30".to_string(), "%f1".to_string()],
                });
                for (reg, off) in &callee_int_slots {
                    emit_load(&mut final_insts, "lw", reg, *off, "%i1");
                }
                for (reg, off) in &callee_float_slots {
                    emit_load(&mut final_insts, "lf", reg, *off, "%i1");
                }
                if let Some(off) = ra_offset {
                    emit_load(&mut final_insts, "lw", "%i3", off, "%i1");
                }
                if frame_size > 0 {
                    emit_addi(&mut final_insts, "%i1", "%i1", frame_size);
                }
                final_insts.push(Instruction {
                    label: None,
                    mnemonic: Some("jmp".to_string()),
                    operands: vec!["%i0".to_string(), "0(%i3)".to_string()],
                });
                if let Some(lbl) = emit_label {
                    if has_call || frame_size > 0 {
                        if let Some(first) = final_insts.get_mut(ret_start_idx) {
                            first.label = Some(lbl);
                        }
                    } else if let Some(last) = final_insts.last_mut() {
                        last.label = Some(lbl);
                    }
                }
                idx += 1;
            } else if mnemonic == "call_dir" {
                let call_dir_hint = inst
                    .operands
                    .first()
                    .and_then(|lbl| policy.call_dir_clobber.get(lbl))
                    .or(Some(&policy.offspring_caller_clobber));
                // Simple tail-call optimization:
                // call_dir <f>; ret  => epilogue + jmp %i0, f
                if is_tail_call_pair(func_insts, idx) {
                    let stripped = Instruction {
                        label: emit_label,
                        mnemonic: inst.mnemonic.clone(),
                        operands: inst.operands.clone(),
                    };
                    expand_tail_call_dir(
                        &mut final_insts,
                        &stripped,
                        has_call,
                        ra_offset.unwrap_or(0),
                        frame_size,
                        &callee_int_slots,
                        &callee_float_slots,
                    );
                    idx += 2;
                    continue;
                }
                // Pass instruction with stripped label
                let stripped = Instruction {
                    label: emit_label,
                    mnemonic: inst.mnemonic.clone(),
                    operands: inst.operands.clone(),
                };
                let defined_before_call = collect_defined_regs_before_call_in_block(
                    func_insts,
                    &analyzed_func,
                    idx,
                    allocation,
                );
                let live_in_at_block_entry = collect_live_in_regs_at_block_entry(
                    func_insts,
                    &analyzed_func,
                    idx,
                    allocation,
                );
                let (save_int, save_float) = collect_call_save_regs(
                    &analyzed_func[idx].live_out,
                    &defined_before_call,
                    &live_in_at_block_entry,
                    call_dir_hint,
                    allocation,
                );
                if is_create_array_call_dir_target(&stripped) {
                    let create_save_int = filter_create_array_save_int(&save_int);
                    expand_call_dir_create_array(&mut final_insts, &stripped, &create_save_int);
                } else {
                    expand_call_dir(&mut final_insts, &stripped, &save_int, &save_float);
                }
                idx += 1;
            } else if mnemonic == "call_cls" {
                // call_cls <r>; ret => epilogue + jmp %i0, 0(closure_entry)
                if is_tail_call_pair(func_insts, idx) {
                    let stripped = Instruction {
                        label: emit_label,
                        mnemonic: inst.mnemonic.clone(),
                        operands: inst.operands.clone(),
                    };
                    expand_tail_call_cls(
                        &mut final_insts,
                        &stripped,
                        has_call,
                        ra_offset.unwrap_or(0),
                        frame_size,
                        &callee_int_slots,
                        &callee_float_slots,
                    );
                    idx += 2;
                    continue;
                }
                let stripped = Instruction {
                    label: emit_label,
                    mnemonic: inst.mnemonic.clone(),
                    operands: inst.operands.clone(),
                };
                let defined_before_call = collect_defined_regs_before_call_in_block(
                    func_insts,
                    &analyzed_func,
                    idx,
                    allocation,
                );
                let live_in_at_block_entry = collect_live_in_regs_at_block_entry(
                    func_insts,
                    &analyzed_func,
                    idx,
                    allocation,
                );
                let (save_int, save_float) =
                    collect_call_save_regs(
                        &analyzed_func[idx].live_out,
                        &defined_before_call,
                        &live_in_at_block_entry,
                        None, // call_cls target is unknown; conservatively save all live caller-save
                        allocation,
                    );
                expand_call_cls(&mut final_insts, &stripped, &save_int, &save_float);
                idx += 1;
            } else {
                final_insts.push(Instruction {
                    label: emit_label,
                    mnemonic: inst.mnemonic.clone(),
                    operands: inst.operands.clone(),
                });
                idx += 1;
            }
        }
    }

    final_insts
}

/// Expand call_dir pseudo-instruction.
/// %i3 is callee-save (saved in function prologue), so call sites do NOT save %i3.
/// call_dir <label> →
///   subi %i1, %i1, <frame>    (skipped if frame == 0)
///   save caller-save regs
///   set_label %i31, <label>
///   jmp  %i3, 0(%i31)
///   restore caller-save regs
///   addi %i1, %i1, <frame>    (skipped if frame == 0)
fn expand_call_dir_inner(
    out: &mut Vec<Instruction>,
    inst: &Instruction,
    save_int: &[String],
    save_float: &[String],
) {
    let label = &inst.operands[0];
    let int_base = 0;
    let float_base = int_base + (save_int.len() as i32) * 4;
    let call_frame = align8(float_base + (save_float.len() as i32) * 4);

    let start_idx = out.len();
    emit_subi(out, "%i1", "%i1", call_frame);
    if let Some(lbl) = inst.label.clone() {
        if let Some(first) = out.get_mut(start_idx) {
            first.label = Some(lbl);
        }
    }
    for (i, reg) in save_int.iter().enumerate() {
        emit_store(out, "sw", reg, int_base + (i as i32) * 4, "%i1");
    }
    for (i, reg) in save_float.iter().enumerate() {
        emit_store(out, "sf", reg, float_base + (i as i32) * 4, "%i1");
    }
    out.push(Instruction {
        label: None,
        mnemonic: Some("set_label".to_string()),
        operands: vec!["%i31".to_string(), label.clone()],
    });
    out.push(Instruction {
        label: None,
        mnemonic: Some("jmp".to_string()),
        operands: vec!["%i3".to_string(), "0(%i31)".to_string()],
    });

    for (i, reg) in save_int.iter().enumerate() {
        emit_load(out, "lw", reg, int_base + (i as i32) * 4, "%i1");
    }
    for (i, reg) in save_float.iter().enumerate() {
        emit_load(out, "lf", reg, float_base + (i as i32) * 4, "%i1");
    }
    emit_addi(out, "%i1", "%i1", call_frame);

    // If call_frame was 0 (no saves), attach label to the set_label instruction.
    if call_frame == 0 {
        if let Some(lbl) = inst.label.clone() {
            // Find set_label instruction (first after start_idx when no subi emitted)
            if let Some(first) = out.get_mut(start_idx) {
                first.label = Some(lbl);
            }
        }
    }
}

/// Expand call_cls pseudo-instruction.
/// %i3 is callee-save (saved in function prologue), so call sites do NOT save %i3.
/// call_cls <reg> →
///   subi %i1, %i1, <frame>    (skipped if frame == 0)
///   save caller-save regs
///   mov  %i30, <reg>       (if reg != %i30)
///   lw   %i31, 0(%i30)
///   jmp  %i3, 0(%i31)
///   restore caller-save regs
///   addi %i1, %i1, <frame>    (skipped if frame == 0)
fn expand_call_cls_inner(
    out: &mut Vec<Instruction>,
    inst: &Instruction,
    save_int: &[String],
    save_float: &[String],
) {
    let reg = &inst.operands[0];
    let int_base = 0;
    let float_base = int_base + (save_int.len() as i32) * 4;
    let call_frame = align8(float_base + (save_float.len() as i32) * 4);

    let start_idx = out.len();
    emit_subi(out, "%i1", "%i1", call_frame);
    if let Some(lbl) = inst.label.clone() {
        if let Some(first) = out.get_mut(start_idx) {
            first.label = Some(lbl);
        }
    }
    for (i, reg) in save_int.iter().enumerate() {
        emit_store(out, "sw", reg, int_base + (i as i32) * 4, "%i1");
    }
    for (i, reg) in save_float.iter().enumerate() {
        emit_store(out, "sf", reg, float_base + (i as i32) * 4, "%i1");
    }

    if reg != "%i30" {
        out.push(Instruction {
            label: None,
            mnemonic: Some("mov".to_string()),
            operands: vec!["%i30".to_string(), reg.clone()],
        });
    }
    out.push(Instruction {
        label: None,
        mnemonic: Some("lw".to_string()),
        operands: vec!["%i31".to_string(), "0(%i30)".to_string()],
    });
    out.push(Instruction {
        label: None,
        mnemonic: Some("jmp".to_string()),
        operands: vec!["%i3".to_string(), "0(%i31)".to_string()],
    });

    for (i, reg) in save_int.iter().enumerate() {
        emit_load(out, "lw", reg, int_base + (i as i32) * 4, "%i1");
    }
    for (i, reg) in save_float.iter().enumerate() {
        emit_load(out, "lf", reg, float_base + (i as i32) * 4, "%i1");
    }
    emit_addi(out, "%i1", "%i1", call_frame);

    // If call_frame was 0, attach label to the first emitted instruction.
    if call_frame == 0 {
        if let Some(lbl) = inst.label.clone() {
            if let Some(first) = out.get_mut(start_idx) {
                first.label = Some(lbl);
            }
        }
    }
}

fn collect_call_save_regs(
    live_out: &BTreeSet<String>,
    defined_before_call: &HashSet<String>,
    live_in_at_block_entry: &HashSet<String>,
    clobber_hint: Option<&BTreeSet<String>>,
    allocation: &Allocation,
) -> (Vec<String>, Vec<String>) {
    let disable_hint = std::env::var("BACKEND_DISABLE_CALLER_HINT")
        .map(|v| v != "0")
        .unwrap_or(false); // enabled: call_cls uses None hint (conservative), call_dir uses clobber summary
    let mut int_regs: HashSet<String> = HashSet::new();
    let mut float_regs: HashSet<String> = HashSet::new();

    for r in live_out {
        if let Some(phys) = resolve_reg_to_physical(r, allocation) {
            // Liveness refinement: skip registers that were neither defined in
            // this basic block before the call, nor live-in at block entry.
            // Such registers hold stale values that do not need saving.
            if !defined_before_call.contains(&phys) && !live_in_at_block_entry.contains(&phys) {
                continue;
            }
            if !disable_hint {
                if let Some(mask) = clobber_hint {
                    if !mask.contains(&phys) {
                        continue;
                    }
                }
            }
            if is_caller_save_int_reg(&phys) {
                int_regs.insert(phys);
                continue;
            }
            if is_caller_save_float_reg(&phys) {
                float_regs.insert(phys);
            }
        }
    }

    let mut int_vec: Vec<String> = int_regs.into_iter().collect();
    int_vec.sort_by_key(|r| reg_index(r).unwrap_or(usize::MAX));
    let mut float_vec: Vec<String> = float_regs.into_iter().collect();
    float_vec.sort_by_key(|r| reg_index(r).unwrap_or(usize::MAX));
    (int_vec, float_vec)
}

fn collect_used_callee_save_regs(
    analyzed_func: &[analysis::AnalyzedInstruction],
    allocation: &Allocation,
) -> (Vec<String>, Vec<String>) {
    let mut int_regs: HashSet<String> = HashSet::new();
    let mut float_regs: HashSet<String> = HashSet::new();

    for info in analyzed_func {
        for r in info.defs.iter() {
            if let Some(phys) = resolve_reg_to_physical(r, allocation) {
                if is_callee_save_int_reg(&phys) {
                    int_regs.insert(phys);
                    continue;
                }
                if is_callee_save_float_reg(&phys) {
                    float_regs.insert(phys);
                }
            }
        }
    }

    let mut int_vec: Vec<String> = int_regs.into_iter().collect();
    int_vec.sort_by_key(|r| reg_index(r).unwrap_or(usize::MAX));
    let mut float_vec: Vec<String> = float_regs.into_iter().collect();
    float_vec.sort_by_key(|r| reg_index(r).unwrap_or(usize::MAX));
    (int_vec, float_vec)
}

fn collect_defined_regs_before_call_in_block(
    func_insts: &[Instruction],
    analyzed_func: &[analysis::AnalyzedInstruction],
    call_idx: usize,
    allocation: &Allocation,
) -> HashSet<String> {
    let block_start = find_block_start(func_insts, call_idx);
    let mut out = HashSet::new();
    for info in analyzed_func.iter().take(call_idx).skip(block_start) {
        for d in &info.defs {
            if let Some(phys) = resolve_reg_to_physical(d, allocation) {
                if is_caller_save_int_reg(&phys) || is_caller_save_float_reg(&phys) {
                    out.insert(phys);
                }
            }
        }
    }
    out
}

fn collect_live_in_regs_at_block_entry(
    func_insts: &[Instruction],
    analyzed_func: &[analysis::AnalyzedInstruction],
    call_idx: usize,
    allocation: &Allocation,
) -> HashSet<String> {
    let block_start = find_block_start(func_insts, call_idx);
    let mut out = HashSet::new();
    if let Some(entry) = analyzed_func.get(block_start) {
        for r in &entry.live_in {
            if let Some(phys) = resolve_reg_to_physical(r, allocation) {
                if is_caller_save_int_reg(&phys) || is_caller_save_float_reg(&phys) {
                    out.insert(phys);
                }
            }
        }
    }
    out
}

fn find_block_start(func_insts: &[Instruction], call_idx: usize) -> usize {
    let mut start = call_idx;
    while start > 0 {
        if func_insts[start].label.is_some() {
            break;
        }
        let prev = &func_insts[start - 1];
        if prev.mnemonic.as_deref().is_none() {
            break;
        }
        if is_block_terminator(prev.mnemonic.as_deref().unwrap_or("")) {
            break;
        }
        start -= 1;
    }
    start
}

fn is_block_terminator(mnemonic: &str) -> bool {
    matches!(mnemonic, "jmp" | "jzero" | "jeq" | "jlt" | "jleq" | "ret")
}

fn resolve_reg_to_physical(reg: &str, allocation: &Allocation) -> Option<String> {
    if let Some(rest) = reg.strip_prefix("%vi") {
        if !rest.is_empty() {
            if let Some(Ok(c)) = allocation.get(reg) {
                return Some(format!("%i{}", c + 4));
            }
            return None;
        }
    }
    if let Some(rest) = reg.strip_prefix("%vf") {
        if !rest.is_empty() {
            if let Some(Ok(c)) = allocation.get(reg) {
                return Some(format!("%f{}", c + 1));
            }
            return None;
        }
    }
    if reg.starts_with("%i") || reg.starts_with("%f") {
        return Some(reg.to_string());
    }
    None
}

fn reg_index(reg: &str) -> Option<usize> {
    if let Some(rest) = reg.strip_prefix("%i") {
        return rest.parse::<usize>().ok();
    }
    if let Some(rest) = reg.strip_prefix("%f") {
        return rest.parse::<usize>().ok();
    }
    None
}

fn is_caller_save_int_reg(reg: &str) -> bool {
    let all_caller = std::env::var("BACKEND_ALL_CALLER_SAVE")
        .map(|v| v != "0")
        .unwrap_or(true); // default: all caller-save
    if let Some(rest) = reg.strip_prefix("%i") {
        if let Ok(i) = rest.parse::<usize>() {
            if all_caller {
                return (4..=29).contains(&i);
            }
            // TKA/asm.ml: caller-save int regs are %i4..%i15.
            return (4..=15).contains(&i);
        }
    }
    false
}

fn is_caller_save_float_reg(reg: &str) -> bool {
    let all_caller = std::env::var("BACKEND_ALL_CALLER_SAVE")
        .map(|v| v != "0")
        .unwrap_or(true); // default: all caller-save
    if let Some(rest) = reg.strip_prefix("%f") {
        if let Ok(i) = rest.parse::<usize>() {
            if all_caller {
                return (1..=29).contains(&i);
            }
            // TKA/asm.ml: caller-save float regs are %f1..%f15.
            return (1..=15).contains(&i);
        }
    }
    false
}

fn is_callee_save_int_reg(reg: &str) -> bool {
    let all_caller = std::env::var("BACKEND_ALL_CALLER_SAVE")
        .map(|v| v != "0")
        .unwrap_or(true); // default: all caller-save
    if all_caller {
        return false;
    }
    if let Some(rest) = reg.strip_prefix("%i") {
        if let Ok(i) = rest.parse::<usize>() {
            return (16..=29).contains(&i);
        }
    }
    false
}

fn is_callee_save_float_reg(reg: &str) -> bool {
    let all_caller = std::env::var("BACKEND_ALL_CALLER_SAVE")
        .map(|v| v != "0")
        .unwrap_or(true); // default: all caller-save
    if all_caller {
        return false;
    }
    if let Some(rest) = reg.strip_prefix("%f") {
        if let Ok(i) = rest.parse::<usize>() {
            return (16..=29).contains(&i);
        }
    }
    false
}

fn expand_call_dir(
    out: &mut Vec<Instruction>,
    inst: &Instruction,
    save_int: &[String],
    save_float: &[String],
) {
    expand_call_dir_inner(out, inst, save_int, save_float);
}

fn filter_create_array_save_int(save_int: &[String]) -> Vec<String> {
    let mut out = Vec::new();
    if save_int.iter().any(|r| r == "%i15") {
        out.push("%i15".to_string());
    }
    out
}

/// Expand call_dir min_caml_create_array/min_caml_create_float_array.
/// Uses %i15 as temporary target register (clobbered by the helper).
/// %i3 is callee-save (prologue), so only %i15 needs save/restore (if live).
/// If %i15 is not live, the call expands to just set_label + jmp (zero frame).
fn expand_call_dir_create_array(out: &mut Vec<Instruction>, inst: &Instruction, save_int: &[String]) {
    let label = &inst.operands[0];
    // This helper clobbers %i15 as loop counter, so preserve only when live.
    let save_i15 = save_int.iter().any(|r| r == "%i15");

    let mut next_off = 0;
    let i15_off = if save_i15 {
        let off = next_off;
        next_off += 4;
        Some(off)
    } else {
        None
    };
    let call_frame = align8(next_off);

    let start_idx = out.len();
    if call_frame > 0 {
        emit_subi(out, "%i1", "%i1", call_frame);
    }
    if let Some(off) = i15_off {
        emit_store(out, "sw", "%i15", off, "%i1");
    }

    out.push(Instruction {
        label: None,
        mnemonic: Some("set_label".to_string()),
        operands: vec!["%i15".to_string(), label.clone()],
    });
    out.push(Instruction {
        label: None,
        mnemonic: Some("jmp".to_string()),
        operands: vec!["%i3".to_string(), "0(%i15)".to_string()],
    });

    if let Some(off) = i15_off {
        emit_load(out, "lw", "%i15", off, "%i1");
    }
    if call_frame > 0 {
        emit_addi(out, "%i1", "%i1", call_frame);
    }

    if let Some(lbl) = inst.label.clone() {
        if let Some(first) = out.get_mut(start_idx) {
            first.label = Some(lbl);
        }
    }
}

fn expand_call_cls(
    out: &mut Vec<Instruction>,
    inst: &Instruction,
    save_int: &[String],
    save_float: &[String],
) {
    expand_call_cls_inner(out, inst, save_int, save_float);
}

fn is_tail_call_pair(insts: &[Instruction], idx: usize) -> bool {
    if idx + 1 >= insts.len() {
        return false;
    }
    let next = &insts[idx + 1];
    if next.label.is_some() {
        // Keep labeled ret as-is to preserve branch targets.
        return false;
    }
    next.mnemonic.as_deref() == Some("ret")
}

fn expand_tail_call_dir(
    out: &mut Vec<Instruction>,
    inst: &Instruction,
    has_call: bool,
    ra_offset: i32,
    frame_size: i32,
    callee_int_slots: &[(String, i32)],
    callee_float_slots: &[(String, i32)],
) {
    let target = &inst.operands[0];
    let start_idx = out.len();

    for (reg, off) in callee_int_slots {
        emit_load(out, "lw", reg, *off, "%i1");
    }
    for (reg, off) in callee_float_slots {
        emit_load(out, "lf", reg, *off, "%i1");
    }
    if has_call {
        emit_load(out, "lw", "%i3", ra_offset, "%i1");
    }
    if frame_size > 0 {
        emit_addi(out, "%i1", "%i1", frame_size);
    }

    out.push(Instruction {
        label: None,
        mnemonic: Some("set_label".to_string()),
        operands: vec!["%i31".to_string(), target.clone()],
    });
    out.push(Instruction {
        label: None,
        mnemonic: Some("jmp".to_string()),
        operands: vec!["%i0".to_string(), "0(%i31)".to_string()],
    });

    if let Some(lbl) = inst.label.clone() {
        if let Some(first) = out.get_mut(start_idx) {
            first.label = Some(lbl);
        }
    }
}

fn expand_tail_call_cls(
    out: &mut Vec<Instruction>,
    inst: &Instruction,
    has_call: bool,
    ra_offset: i32,
    frame_size: i32,
    callee_int_slots: &[(String, i32)],
    callee_float_slots: &[(String, i32)],
) {
    let closure_reg = &inst.operands[0];
    let start_idx = out.len();

    for (reg, off) in callee_int_slots {
        emit_load(out, "lw", reg, *off, "%i1");
    }
    for (reg, off) in callee_float_slots {
        emit_load(out, "lf", reg, *off, "%i1");
    }
    if has_call {
        emit_load(out, "lw", "%i3", ra_offset, "%i1");
    }
    if frame_size > 0 {
        emit_addi(out, "%i1", "%i1", frame_size);
    }

    if closure_reg != "%i30" {
        out.push(Instruction {
            label: None,
            mnemonic: Some("mov".to_string()),
            operands: vec!["%i30".to_string(), closure_reg.clone()],
        });
    }
    out.push(Instruction {
        label: None,
        mnemonic: Some("lw".to_string()),
        operands: vec!["%i31".to_string(), "0(%i30)".to_string()],
    });
    out.push(Instruction {
        label: None,
        mnemonic: Some("jmp".to_string()),
        operands: vec!["%i0".to_string(), "0(%i31)".to_string()],
    });

    if let Some(lbl) = inst.label.clone() {
        if let Some(first) = out.get_mut(start_idx) {
            first.label = Some(lbl);
        }
    }
}

/// Analyze a function's frame requirements.
/// Returns (max_spill_offset, has_call).
fn analyze_function_frame(insts: &[Instruction]) -> (i32, bool) {
    let mut max_offset = 0;
    let mut has_call = false;

    for inst in insts {
        if let Some(mnem) = &inst.mnemonic {
            if matches!(mnem.as_str(), "call_dir" | "call_cls") {
                has_call = true;
            }
        }

        // Check for spill slot accesses: offset(%i1)
        for op in &inst.operands {
            if let Some((off, base)) = parse_offset(op) {
                if base == "%i1" && off >= 0 {
                    if off + 4 > max_offset {
                        max_offset = off + 4;
                    }
                }
            }
        }
    }

    (max_offset, has_call)
}

/// For min_caml_start, compute how much extra stack frame we need to reserve
/// so that spill slots at offset(%i1) do not overlap global memory.
fn compute_main_extra_frame(insts: &[Instruction]) -> i32 {
    let required = align8(max_positive_sp_offset(insts));
    let existing = existing_main_sp_reserve(insts);
    if required > existing {
        required - existing
    } else {
        0
    }
}

fn align8(v: i32) -> i32 {
    if v % 8 == 0 {
        v
    } else {
        v + (8 - (v % 8))
    }
}

fn max_positive_sp_offset(insts: &[Instruction]) -> i32 {
    let mut max_offset = 0;
    for inst in insts {
        for op in &inst.operands {
            if let Some((off, base)) = parse_offset(op) {
                if base == "%i1" && off >= 0 && off + 4 > max_offset {
                    max_offset = off + 4;
                }
            }
        }
    }
    max_offset
}

fn existing_main_sp_reserve(insts: &[Instruction]) -> i32 {
    for inst in insts {
        if inst.mnemonic.as_deref() == Some("subi")
            && inst.operands.len() >= 3
            && inst.operands[0] == "%i1"
            && inst.operands[1] == "%i1"
        {
            if let Ok(v) = inst.operands[2].parse::<i32>() {
                if v > 0 {
                    return v;
                }
            }
        }
    }
    0
}

fn is_main_sp_anchor(inst: &Instruction) -> bool {
    inst.mnemonic.as_deref() == Some("set_label")
        && inst.operands.len() >= 2
        && inst.operands[0] == "%i3"
        && inst.operands[1] == "fin"
}

// Helper functions

fn emit_subi(out: &mut Vec<Instruction>, dst: &str, src: &str, val: i32) {
    if val == 0 {
        return;
    }
    if val >= -2048 && val < 2048 {
        out.push(Instruction {
            label: None,
            mnemonic: Some("subi".to_string()),
            operands: vec![dst.to_string(), src.to_string(), val.to_string()],
        });
    } else {
        emit_movi(out, "%i31", val);
        out.push(Instruction {
            label: None,
            mnemonic: Some("sub".to_string()),
            operands: vec![dst.to_string(), src.to_string(), "%i31".to_string()],
        });
    }
}

fn emit_addi(out: &mut Vec<Instruction>, dst: &str, src: &str, val: i32) {
    if val == 0 {
        return;
    }
    if val >= -2048 && val < 2048 {
        out.push(Instruction {
            label: None,
            mnemonic: Some("addi".to_string()),
            operands: vec![dst.to_string(), src.to_string(), val.to_string()],
        });
    } else {
        emit_movi(out, "%i31", val);
        out.push(Instruction {
            label: None,
            mnemonic: Some("add".to_string()),
            operands: vec![dst.to_string(), src.to_string(), "%i31".to_string()],
        });
    }
}

fn emit_store(out: &mut Vec<Instruction>, op: &str, reg: &str, off: i32, base: &str) {
    if off >= -2048 && off < 2048 {
        out.push(Instruction {
            label: None,
            mnemonic: Some(op.to_string()),
            operands: vec![reg.to_string(), format!("{}({})", off, base)],
        });
    } else {
        emit_movi(out, "%i31", off);
        out.push(Instruction {
            label: None,
            mnemonic: Some("add".to_string()),
            operands: vec!["%i31".to_string(), base.to_string(), "%i31".to_string()],
        });
        out.push(Instruction {
            label: None,
            mnemonic: Some(op.to_string()),
            operands: vec![reg.to_string(), "0(%i31)".to_string()],
        });
    }
}

fn emit_load(out: &mut Vec<Instruction>, op: &str, reg: &str, off: i32, base: &str) {
    if off >= -2048 && off < 2048 {
        out.push(Instruction {
            label: None,
            mnemonic: Some(op.to_string()),
            operands: vec![reg.to_string(), format!("{}({})", off, base)],
        });
    } else {
        emit_movi(out, "%i31", off);
        out.push(Instruction {
            label: None,
            mnemonic: Some("add".to_string()),
            operands: vec!["%i31".to_string(), base.to_string(), "%i31".to_string()],
        });
        out.push(Instruction {
            label: None,
            mnemonic: Some(op.to_string()),
            operands: vec![reg.to_string(), "0(%i31)".to_string()],
        });
    }
}

fn emit_movi(out: &mut Vec<Instruction>, reg: &str, val: i32) {
    if val >= -2048 && val < 2048 {
        out.push(Instruction {
            label: None,
            mnemonic: Some("movi".to_string()),
            operands: vec![reg.to_string(), val.to_string()],
        });
    } else {
        let n = val as u32;
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
