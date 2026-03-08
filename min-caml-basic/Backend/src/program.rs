use crate::analysis;
use crate::input::Instruction;
use std::collections::BTreeMap;
use std::collections::BTreeSet;
use std::collections::VecDeque;
use std::ops::Range;

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum FunctionKind {
    MainRegion,
    UserFunction,
    LibraryFunction,
    Unknown,
}

#[allow(dead_code)]
#[derive(Debug, Clone)]
pub struct FunctionProg {
    pub name: String,
    pub prolog: Vec<Instruction>,
    pub body: Vec<Instruction>,
    pub epilog: Vec<Instruction>,
    pub used_regs: BTreeSet<String>,
    pub def_regs: BTreeSet<String>,
    pub kind: FunctionKind,
    pub direct_calls: BTreeSet<String>,
    pub entry_int_args: BTreeMap<String, usize>,
    pub entry_float_args: BTreeMap<String, usize>,
    pub int_arity: usize,
    pub float_arity: usize,
    pub local_caller_clobber: BTreeSet<String>,
    pub local_caller_used: BTreeSet<String>,
    pub local_callee_used: BTreeSet<String>,
    pub caller_clobber_regs: BTreeSet<String>,
    pub callee_clobber_union: BTreeSet<String>,
    pub caller_used_regs: BTreeSet<String>,
    pub callee_used_regs: BTreeSet<String>,
    pub recent_call_depth: BTreeMap<String, usize>,
}

impl FunctionProg {
    #[allow(dead_code)]
    pub fn instructions(&self) -> Vec<Instruction> {
        let mut out =
            Vec::with_capacity(self.prolog.len() + self.body.len() + self.epilog.len());
        out.extend(self.prolog.iter().cloned());
        out.extend(self.body.iter().cloned());
        out.extend(self.epilog.iter().cloned());
        out
    }
}

pub fn from_instructions(insts: Vec<Instruction>) -> Vec<FunctionProg> {
    let ranges = partition_function_ranges(&insts);
    let mut functions = Vec::with_capacity(ranges.len());

    for range in ranges {
        let slice = &insts[range];
        functions.push(build_function_prog(slice));
    }

    ensure_main_first(&mut functions);
    functions
}

pub fn annotate_interprocedural(functions: &mut [FunctionProg]) {
    for f in functions.iter_mut() {
        f.caller_clobber_regs.clear();
        f.callee_clobber_union.clear();
        f.caller_used_regs.clear();
        f.callee_used_regs.clear();
        f.recent_call_depth.clear();
    }
    if functions.is_empty() {
        return;
    }

    let mut name_to_idx: BTreeMap<String, usize> = BTreeMap::new();
    for (i, f) in functions.iter().enumerate() {
        name_to_idx.insert(f.name.clone(), i);
    }

    let n = functions.len();
    let mut adj: Vec<Vec<usize>> = vec![Vec::new(); n];
    for (i, f) in functions.iter().enumerate() {
        for callee in &f.direct_calls {
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

    // Bottom-up (leaves to root): summarize caller-save clobbers.
    let mut clobber_summary = vec![BTreeSet::new(); n];
    for (i, f) in functions.iter().enumerate() {
        clobber_summary[i] = f.local_caller_clobber.clone();
    }
    for &cid in topo.iter().rev() {
        let comp = &comps[cid];
        let mut changed = true;
        let mut iter = 0usize;
        while changed && iter < 32 {
            changed = false;
            iter += 1;
            for &u in comp {
                let mut next = functions[u].local_caller_clobber.clone();
                for callee in &functions[u].direct_calls {
                    if let Some(&v) = name_to_idx.get(callee) {
                        for r in &clobber_summary[v] {
                            next.insert(r.clone());
                        }
                    } else {
                        for r in library_caller_clobbers(callee) {
                            next.insert(r.to_string());
                        }
                    }
                }
                if next != clobber_summary[u] {
                    clobber_summary[u] = next;
                    changed = true;
                }
            }
        }
    }

    // Bottom-up summaries of "used regs by descendants", split by caller/callee classes.
    let mut caller_used_summary = vec![BTreeSet::new(); n];
    let mut callee_used_summary = vec![BTreeSet::new(); n];
    for (i, f) in functions.iter().enumerate() {
        caller_used_summary[i] = f.local_caller_used.clone();
        callee_used_summary[i] = f.local_callee_used.clone();
    }
    for &cid in topo.iter().rev() {
        let comp = &comps[cid];
        let mut changed = true;
        let mut iter = 0usize;
        while changed && iter < 32 {
            changed = false;
            iter += 1;
            for &u in comp {
                let mut next_caller = functions[u].local_caller_used.clone();
                let mut next_callee = functions[u].local_callee_used.clone();
                for callee in &functions[u].direct_calls {
                    if let Some(&v) = name_to_idx.get(callee) {
                        for r in &caller_used_summary[v] {
                            next_caller.insert(r.clone());
                        }
                        for r in &callee_used_summary[v] {
                            next_callee.insert(r.clone());
                        }
                    } else {
                        for r in library_caller_clobbers(callee) {
                            next_caller.insert(r.to_string());
                        }
                    }
                }
                if next_caller != caller_used_summary[u] {
                    caller_used_summary[u] = next_caller;
                    changed = true;
                }
                if next_callee != callee_used_summary[u] {
                    callee_used_summary[u] = next_callee;
                    changed = true;
                }
            }
        }
    }

    for i in 0..n {
        functions[i].caller_clobber_regs = clobber_summary[i].clone();
        functions[i].caller_used_regs = caller_used_summary[i].clone();
        functions[i].callee_used_regs = callee_used_summary[i].clone();
    }

    for i in 0..n {
        let mut union = BTreeSet::new();
        for callee in &functions[i].direct_calls {
            if let Some(&v) = name_to_idx.get(callee) {
                for r in &clobber_summary[v] {
                    union.insert(r.clone());
                }
            } else {
                for r in library_caller_clobbers(callee) {
                    union.insert(r.to_string());
                }
            }
        }
        functions[i].callee_clobber_union = union;
    }
}

pub fn flatten(functions: &[FunctionProg]) -> Vec<Instruction> {
    let cap = functions
        .iter()
        .map(|f| f.prolog.len() + f.body.len() + f.epilog.len())
        .sum();
    let mut out = Vec::with_capacity(cap);
    for f in functions {
        out.extend(f.prolog.iter().cloned());
        out.extend(f.body.iter().cloned());
        out.extend(f.epilog.iter().cloned());
    }
    out
}

#[allow(dead_code)]
pub fn refresh_reg_sets(functions: &mut [FunctionProg]) {
    for f in functions {
        let (used, defs) = collect_reg_sets(&f.instructions());
        f.used_regs = used;
        f.def_regs = defs;
    }
}

pub fn partition_function_ranges(insts: &[Instruction]) -> Vec<Range<usize>> {
    let mut ranges = Vec::new();

    let mut func_entries: Vec<usize> = Vec::new();
    let mut func_ends: Vec<usize> = Vec::new();
    for (i, inst) in insts.iter().enumerate() {
        if let Some(mnem) = &inst.mnemonic {
            if mnem == ".func_entry" {
                func_entries.push(i);
            } else if mnem == ".end_function" {
                func_ends.push(i);
            }
        }
    }

    let first_func = func_entries.first().copied().unwrap_or(insts.len());
    if first_func > 0 {
        ranges.push(0..first_func);
    }

    for (&entry, &end) in func_entries.iter().zip(func_ends.iter()) {
        ranges.push(entry..(end + 1));
    }

    let last_end = func_ends.last().map(|&e| e + 1).unwrap_or(first_func);
    if last_end < insts.len() {
        let mut lib_start = last_end;
        for i in (last_end + 1)..insts.len() {
            if let Some(lbl) = &insts[i].label {
                if insts[i].mnemonic.is_none() && !lbl.is_empty() {
                    ranges.push(lib_start..i);
                    lib_start = i;
                }
            }
        }
        ranges.push(lib_start..insts.len());
    }

    ranges
}

fn build_function_prog(slice: &[Instruction]) -> FunctionProg {
    let starts_with_func_entry = slice
        .first()
        .and_then(|i| i.mnemonic.as_deref())
        .map(|m| m == ".func_entry")
        .unwrap_or(false);

    let name = infer_name(slice);
    let kind = infer_kind(slice, starts_with_func_entry);
    let (prolog_end, epilog_start) = split_segments(slice);

    let prolog = slice[..prolog_end].to_vec();
    let body = slice[prolog_end..epilog_start].to_vec();
    let epilog = slice[epilog_start..].to_vec();

    let (used_regs, def_regs) = collect_reg_sets(slice);
    let direct_calls = collect_direct_calls(slice);
    let (entry_int_args, entry_float_args) = collect_entry_arg_positions(&body);
    let int_arity = entry_int_args.values().max().map(|v| v + 1).unwrap_or(0);
    let float_arity = entry_float_args.values().max().map(|v| v + 1).unwrap_or(0);
    let (int_arity, float_arity) = override_known_arity(&name, int_arity, float_arity);
    let local_caller_clobber = collect_local_caller_clobber(&def_regs);
    let (local_caller_used, local_callee_used) = collect_local_call_class_usage(&used_regs, &def_regs);

    FunctionProg {
        name,
        prolog,
        body,
        epilog,
        used_regs,
        def_regs,
        kind,
        direct_calls,
        entry_int_args,
        entry_float_args,
        int_arity,
        float_arity,
        local_caller_clobber,
        local_caller_used,
        local_callee_used,
        caller_clobber_regs: BTreeSet::new(),
        callee_clobber_union: BTreeSet::new(),
        caller_used_regs: BTreeSet::new(),
        callee_used_regs: BTreeSet::new(),
        recent_call_depth: BTreeMap::new(),
    }
}

fn override_known_arity(name: &str, int_arity: usize, float_arity: usize) -> (usize, usize) {
    match name {
        "min_caml_print_newline" => (0, 0),
        "min_caml_print_char" => (1, 0),
        "min_caml_read_char" => (0, 0),
        "min_caml_create_array" => (2, 0),
        "min_caml_create_float_array" => (1, 1),
        "min_caml_rsqrt" => (0, 1),
        "min_caml_floor" => (0, 1),
        "min_caml_fabs" => (0, 1),
        _ => (int_arity, float_arity),
    }
}

fn infer_name(slice: &[Instruction]) -> String {
    for inst in slice {
        if let Some(lbl) = &inst.label {
            if lbl == "min_caml_start" {
                return "min_caml_start".to_string();
            }
        }
    }
    for inst in slice {
        if let Some(lbl) = &inst.label {
            if !lbl.is_empty() {
                return lbl.clone();
            }
        }
    }
    "unknown".to_string()
}

fn infer_kind(slice: &[Instruction], starts_with_func_entry: bool) -> FunctionKind {
    if starts_with_func_entry {
        return FunctionKind::UserFunction;
    }
    for inst in slice {
        if inst.label.as_deref() == Some("min_caml_start") {
            return FunctionKind::MainRegion;
        }
    }
    for inst in slice {
        if let Some(lbl) = &inst.label {
            if !lbl.is_empty() {
                return FunctionKind::LibraryFunction;
            }
        }
    }
    FunctionKind::Unknown
}

fn split_segments(slice: &[Instruction]) -> (usize, usize) {
    let mut prolog_end = 0usize;
    while prolog_end < slice.len() {
        let inst = &slice[prolog_end];
        let mnem = inst.mnemonic.as_deref();
        let is_meta = mnem.map(|m| m.starts_with('.')).unwrap_or(false)
            || (inst.label.is_some() && inst.mnemonic.is_none());
        if is_meta {
            prolog_end += 1;
        } else {
            break;
        }
    }

    let mut epilog_start = slice.len();
    while epilog_start > prolog_end {
        let inst = &slice[epilog_start - 1];
        if inst.mnemonic.as_deref() == Some(".end_function") {
            epilog_start -= 1;
        } else {
            break;
        }
    }

    (prolog_end, epilog_start)
}

fn collect_reg_sets(slice: &[Instruction]) -> (BTreeSet<String>, BTreeSet<String>) {
    let mut used = BTreeSet::new();
    let mut defs = BTreeSet::new();

    for inst in slice {
        let (inst_defs, inst_uses) = analysis::collect_def_use(inst);
        used.extend(inst_uses);
        defs.extend(inst_defs);
    }

    (used, defs)
}

fn ensure_main_first(functions: &mut Vec<FunctionProg>) {
    if functions.is_empty() {
        return;
    }
    if functions[0].name == "min_caml_start" {
        return;
    }
    if let Some(pos) = functions.iter().position(|f| f.name == "min_caml_start") {
        let main = functions.remove(pos);
        functions.insert(0, main);
    }
}

fn collect_direct_calls(slice: &[Instruction]) -> BTreeSet<String> {
    let mut out = BTreeSet::new();
    for inst in slice {
        if inst.mnemonic.as_deref() != Some("call_dir") {
            continue;
        }
        if let Some(label) = inst.operands.first() {
            out.insert(label.clone());
        }
    }
    out
}

fn collect_entry_arg_positions(
    body: &[Instruction],
) -> (BTreeMap<String, usize>, BTreeMap<String, usize>) {
    let mut int_args = BTreeMap::new();
    let mut float_args = BTreeMap::new();

    for (i, inst) in body.iter().enumerate() {
        // Some parsers attach function label to the first executable instruction.
        // Allow that first label, but stop at labels after entry argument moves.
        if i > 0 && inst.label.is_some() {
            break;
        }
        let Some(mnem) = inst.mnemonic.as_deref() else {
            break;
        };
        if mnem == "mov" && inst.operands.len() == 2 {
            let dst = &inst.operands[0];
            let src = &inst.operands[1];
            if dst.starts_with("%vi") {
                if let Some(idx) = int_arg_index(src) {
                    int_args.entry(dst.clone()).or_insert(idx);
                    continue;
                }
            }
            break;
        }
        if mnem == "fmov" && inst.operands.len() == 2 {
            let dst = &inst.operands[0];
            let src = &inst.operands[1];
            if dst.starts_with("%vf") {
                if let Some(idx) = float_arg_index(src) {
                    float_args.entry(dst.clone()).or_insert(idx);
                    continue;
                }
            }
            break;
        }
        break;
    }

    (int_args, float_args)
}

fn collect_local_call_class_usage(
    used_regs: &BTreeSet<String>,
    def_regs: &BTreeSet<String>,
) -> (BTreeSet<String>, BTreeSet<String>) {
    let mut caller = BTreeSet::new();
    let mut callee = BTreeSet::new();
    for r in used_regs.iter().chain(def_regs.iter()) {
        if is_caller_save_int(r) || is_caller_save_float(r) {
            caller.insert(r.clone());
        } else if is_callee_save_int(r) || is_callee_save_float(r) {
            callee.insert(r.clone());
        }
    }
    (caller, callee)
}

fn collect_local_caller_clobber(def_regs: &BTreeSet<String>) -> BTreeSet<String> {
    let mut out = BTreeSet::new();
    for r in def_regs {
        if is_caller_save_int(r) || is_caller_save_float(r) {
            out.insert(r.clone());
        }
    }
    out
}

fn int_arg_index(reg: &str) -> Option<usize> {
    let rest = reg.strip_prefix("%i")?;
    let idx = rest.parse::<usize>().ok()?;
    if (4..=15).contains(&idx) {
        return Some(idx - 4);
    }
    None
}

fn float_arg_index(reg: &str) -> Option<usize> {
    let rest = reg.strip_prefix("%f")?;
    let idx = rest.parse::<usize>().ok()?;
    if (1..=15).contains(&idx) {
        return Some(idx - 1);
    }
    None
}

fn is_caller_save_int(reg: &str) -> bool {
    let all_caller = std::env::var("BACKEND_ALL_CALLER_SAVE")
        .map(|v| v != "0")
        .unwrap_or(true);
    let Some(rest) = reg.strip_prefix("%i") else {
        return false;
    };
    let Ok(idx) = rest.parse::<usize>() else {
        return false;
    };
    if all_caller {
        (4..=29).contains(&idx)
    } else {
        (4..=15).contains(&idx)
    }
}

fn is_caller_save_float(reg: &str) -> bool {
    let all_caller = std::env::var("BACKEND_ALL_CALLER_SAVE")
        .map(|v| v != "0")
        .unwrap_or(true);
    let Some(rest) = reg.strip_prefix("%f") else {
        return false;
    };
    let Ok(idx) = rest.parse::<usize>() else {
        return false;
    };
    if all_caller {
        (1..=29).contains(&idx)
    } else {
        (1..=15).contains(&idx)
    }
}

fn is_callee_save_int(reg: &str) -> bool {
    let all_caller = std::env::var("BACKEND_ALL_CALLER_SAVE")
        .map(|v| v != "0")
        .unwrap_or(true);
    if all_caller {
        return false;
    }
    let Some(rest) = reg.strip_prefix("%i") else {
        return false;
    };
    let Ok(idx) = rest.parse::<usize>() else {
        return false;
    };
    (16..=29).contains(&idx)
}

fn is_callee_save_float(reg: &str) -> bool {
    let all_caller = std::env::var("BACKEND_ALL_CALLER_SAVE")
        .map(|v| v != "0")
        .unwrap_or(true);
    if all_caller {
        return false;
    }
    let Some(rest) = reg.strip_prefix("%f") else {
        return false;
    };
    let Ok(idx) = rest.parse::<usize>() else {
        return false;
    };
    (16..=29).contains(&idx)
}

fn library_caller_clobbers(name: &str) -> &'static [&'static str] {
    match name {
        // print_newline clobbers %i4 (movi %i4, 10) and %i5 (movui %i5, addr).
        "min_caml_print_newline" => &["%i4", "%i5"],
        // print_char/read_char clobber %i5 only.
        "min_caml_print_char" | "min_caml_read_char" => &["%i5"],
        // array creators use %i29 as temporary under current ABI.
        "min_caml_create_array" | "min_caml_create_float_array" => &["%i29"],
        // rsqrt/floor/fabs write only return register %f30.
        "min_caml_rsqrt" | "min_caml_floor" | "min_caml_fabs" => &[],
        _ => &[],
    }
}
