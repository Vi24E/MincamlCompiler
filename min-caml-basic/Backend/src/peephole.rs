use crate::analysis;
use crate::input::Instruction;
use std::collections::{HashMap, HashSet};
use std::fs;

#[derive(Debug, Clone)]
struct RuleInst {
    mnemonic: String,
    operands: Vec<String>,
    operand_parts: Vec<Vec<Part>>,
}

#[derive(Debug, Clone)]
struct Rule {
    lhs: Vec<RuleInst>,
    rhs: Vec<RuleInst>,
}

#[derive(Default)]
struct BlockRegIndex {
    defs: HashMap<String, Vec<usize>>,
    uses: HashMap<String, Vec<usize>>,
}

#[derive(Debug, Clone)]
enum Part {
    Lit(String),
    Var(String),
}

pub struct OptimizeResult {
    pub instructions: Vec<Instruction>,
    pub rewrites: usize,
}

pub fn optimize(
    instructions: Vec<Instruction>,
    rules_path: &str,
    call_arity_map: &HashMap<String, (usize, usize)>,
    stage_name: &str,
) -> OptimizeResult {
    let rules = load_rules(rules_path);
    if rules.is_empty() {
        return OptimizeResult {
            instructions,
            rewrites: 0,
        };
    }
    let rule_index = build_rule_index(&rules);
    let trace_rule_counts = std::env::var("BACKEND_TRACE_RULE_COUNTS")
        .map(|v| v != "0")
        .unwrap_or(false);
    let mut rule_hits = vec![0usize; rules.len()];

    let mut current = instructions;
    let mut rewrites = 0usize;
    const MAX_SWEEPS: usize = 200;

    for _ in 0..MAX_SWEEPS {
        let analyzed = analysis::analyze(&current);
        let mut changed = false;
        let mut out = Vec::with_capacity(current.len());
        let mut block_start = 0usize;

        while block_start < current.len() {
            let mut block_end = block_start + 1;
            while block_end < current.len() {
                if is_block_boundary(&current[block_end - 1], &current[block_end]) {
                    break;
                }
                block_end += 1;
            }

            let block_slice = &current[block_start..block_end];
            if let Some((rule_idx, anchor, matched, bindings)) =
                find_match_in_block(
                    block_slice,
                    &rules,
                    &rule_index,
                    &analyzed,
                    block_start,
                    call_arity_map,
                    stage_name,
                )
            {
                let mut block = block_slice.to_vec();
                apply_rule(&mut block, anchor, &matched, &rules[rule_idx], &bindings);
                rewrites += 1;
                if trace_rule_counts {
                    rule_hits[rule_idx] += 1;
                }
                changed = true;
                out.extend(block);
            } else {
                out.extend(block_slice.iter().cloned());
            }
            block_start = block_end;
        }

        let (out, sandwich_rewrites) = fold_sp_addi_subi_sandwich_opt(out);
        if sandwich_rewrites > 0 {
            rewrites += sandwich_rewrites;
            changed = true;
        }
        current = out;
        if !changed {
            break;
        }
    }

    // Apply simple local folds once at the end so they do not keep feeding
    // additional rule matches across sweeps.
    let (out, trivial_rewrites) = fold_trivial_identities(current);
    current = out;
    rewrites += trivial_rewrites;

    if trace_rule_counts {
        eprintln!(
            "[peephole-rule-count] stage={} rules_path={} total_rewrites={}",
            stage_name, rules_path, rewrites
        );
        for (idx, cnt) in rule_hits.iter().enumerate() {
            if *cnt == 0 {
                continue;
            }
            eprintln!(
                "[peephole-rule-hit] stage={} rule={} count={} pattern=\"{}\"",
                stage_name,
                idx,
                cnt,
                rule_brief(&rules[idx])
            );
        }
    }

    OptimizeResult {
        instructions: current,
        rewrites,
    }
}

// Fold:
//   addi %i1, %i1, K
//   <inst that does not touch %i1>
//   subi %i1, %i1, K
// into:
//   <inst>
//
// We keep this intentionally narrow/safe:
// - %i1-only (stack pointer),
// - all three instructions are unlabeled,
// - middle instruction is a real non-terminator instruction and does not mention %i1.
fn fold_sp_addi_subi_sandwich_opt(instructions: Vec<Instruction>) -> (Vec<Instruction>, usize) {
    let mut out = Vec::with_capacity(instructions.len());
    let mut rewrites = 0usize;
    let mut i = 0usize;
    let n = instructions.len();

    while i < n {
        if i + 2 < n {
            if let Some(mid) = fold_sp_addi_subi_triplet(&instructions[i], &instructions[i + 1], &instructions[i + 2]) {
                out.push(mid);
                rewrites += 1;
                i += 3;
                continue;
            }
        }
        out.push(instructions[i].clone());
        i += 1;
    }

    (out, rewrites)
}

fn fold_sp_addi_subi_triplet(i0: &Instruction, i1: &Instruction, i2: &Instruction) -> Option<Instruction> {
    if i0.label.is_some() || i1.label.is_some() || i2.label.is_some() {
        return None;
    }
    if i0.mnemonic.as_deref() != Some("addi") || i2.mnemonic.as_deref() != Some("subi") {
        return None;
    }
    if i0.operands.len() != 3 || i2.operands.len() != 3 {
        return None;
    }
    if !is_real_instruction(i1) || is_terminator(i1) {
        return None;
    }

    let sp = "%i1";
    if i0.operands[0] != sp || i0.operands[1] != sp {
        return None;
    }
    if i2.operands[0] != sp || i2.operands[1] != sp {
        return None;
    }
    if i0.operands[2] != i2.operands[2] {
        return None;
    }
    if inst_mentions_reg(i1, sp) {
        return None;
    }

    Some(i1.clone())
}

fn fold_trivial_identities(instructions: Vec<Instruction>) -> (Vec<Instruction>, usize) {
    let mut out = Vec::with_capacity(instructions.len());
    let mut rewrites = 0usize;

    for inst in instructions {
        let mut replaced: Option<Instruction> = None;
        let mut remove_noop = false;

        if let Some(mn) = inst.mnemonic.as_deref() {
            match mn {
                // addi/subi/slli/sari dst, src, 0 -> mov dst, src
                "addi" | "subi" | "slli" | "sari" if inst.operands.len() == 3 => {
                    let dst = &inst.operands[0];
                    let src = &inst.operands[1];
                    let imm = &inst.operands[2];
                    if imm_is_zero(imm) {
                        if dst == src {
                            remove_noop = true;
                        } else {
                            replaced = Some(rewrite_like(&inst, "mov", vec![dst.clone(), src.clone()]));
                        }
                    }
                }
                // Self-compare is constant.
                "ceq" | "cleq" | "clt" | "feq" | "fleq" | "flt" if inst.operands.len() == 3 => {
                    let dst = &inst.operands[0];
                    let lhs = &inst.operands[1];
                    let rhs = &inst.operands[2];
                    if lhs == rhs {
                        let value = match mn {
                            "clt" | "flt" => "0",
                            _ => "1",
                        };
                        if dst == "%i0" {
                            remove_noop = true;
                        } else {
                            replaced = Some(rewrite_like(
                                &inst,
                                "movi",
                                vec![dst.clone(), value.to_string()],
                            ));
                        }
                    }
                }
                // tern/ftern with identical branches does not depend on condition.
                "tern" if inst.operands.len() == 4 => {
                    let dst = &inst.operands[0];
                    let y = &inst.operands[2];
                    let z = &inst.operands[3];
                    if y == z {
                        if dst == y {
                            remove_noop = true;
                        } else {
                            replaced = Some(rewrite_like(&inst, "mov", vec![dst.clone(), y.clone()]));
                        }
                    }
                }
                "ftern" if inst.operands.len() == 4 => {
                    let dst = &inst.operands[0];
                    let y = &inst.operands[2];
                    let z = &inst.operands[3];
                    if y == z {
                        if dst == y {
                            remove_noop = true;
                        } else {
                            replaced = Some(rewrite_like(&inst, "fmov", vec![dst.clone(), y.clone()]));
                        }
                    }
                }
                _ => {}
            }
        }

        if let Some(new_inst) = replaced {
            rewrites += 1;
            out.push(new_inst);
            continue;
        }
        if remove_noop {
            rewrites += 1;
            if let Some(label) = inst.label.clone() {
                out.push(Instruction {
                    label: Some(label),
                    mnemonic: None,
                    operands: Vec::new(),
                });
            }
            continue;
        }
        out.push(inst);
    }

    (out, rewrites)
}

fn rewrite_like(orig: &Instruction, mnemonic: &str, operands: Vec<String>) -> Instruction {
    Instruction {
        label: orig.label.clone(),
        mnemonic: Some(mnemonic.to_string()),
        operands,
    }
}

fn imm_is_zero(s: &str) -> bool {
    let t = s.trim();
    if t == "0" || t == "+0" || t == "-0" {
        return true;
    }
    if let Ok(v) = t.parse::<i64>() {
        return v == 0;
    }
    let lower = t.to_ascii_lowercase();
    if let Some(rest) = lower.strip_prefix("0x") {
        return i64::from_str_radix(rest, 16).map(|v| v == 0).unwrap_or(false);
    }
    false
}

fn rule_brief(rule: &Rule) -> String {
    let lhs = rule
        .lhs
        .iter()
        .map(rule_inst_text)
        .collect::<Vec<_>>()
        .join(" ; ");
    let rhs = rule
        .rhs
        .iter()
        .map(rule_inst_text)
        .collect::<Vec<_>>()
        .join(" ; ");
    format!("{} -> {}", lhs, rhs)
}

fn rule_inst_text(ri: &RuleInst) -> String {
    if ri.operands.is_empty() {
        ri.mnemonic.clone()
    } else {
        format!("{} {}", ri.mnemonic, ri.operands.join(", "))
    }
}

fn inst_text(inst: &Instruction) -> String {
    let mut out = String::new();
    if let Some(label) = &inst.label {
        out.push_str(label);
        out.push(':');
        if inst.mnemonic.is_some() {
            out.push(' ');
        }
    }
    if let Some(mn) = &inst.mnemonic {
        out.push_str(mn);
        if !inst.operands.is_empty() {
            out.push(' ');
            out.push_str(&inst.operands.join(", "));
        }
    }
    out
}

fn is_stage3_disabled_rule(rule: &Rule) -> bool {
    // Disable only the integer beta-move chain on stage3:
    //   mov %r1, %r2 ; mov %r3, %r1 -> mov %r3, %r2
    if rule.lhs.len() != 2 || rule.rhs.len() != 1 {
        return false;
    }
    let a = &rule.lhs[0];
    let b = &rule.lhs[1];
    let c = &rule.rhs[0];
    a.mnemonic == "mov"
        && b.mnemonic == "mov"
        && c.mnemonic == "mov"
        && a.operands == ["%r1", "%r2"]
        && b.operands == ["%r3", "%r1"]
        && c.operands == ["%r3", "%r2"]
}

fn stage3_disable_rule21() -> bool {
    std::env::var("BACKEND_STAGE3_DISABLE_RULE21")
        .map(|v| v != "0")
        .unwrap_or(false)
}

fn trace_rule21_enabled() -> bool {
    std::env::var("BACKEND_TRACE_RULE21")
        .map(|v| v != "0")
        .unwrap_or(false)
}

fn load_rules(path: &str) -> Vec<Rule> {
    let Ok(content) = fs::read_to_string(path) else {
        return Vec::new();
    };

    let mut rules = Vec::new();
    let mut lhs = Vec::new();
    let mut rhs = Vec::new();
    let mut in_rhs = false;

    for raw in content.lines() {
        let line = strip_comment(raw).trim();
        if line.is_empty() {
            continue;
        }

        if line == "->" {
            in_rhs = true;
            continue;
        }

        if !in_rhs {
            if let Some(inst) = parse_rule_inst(line) {
                lhs.push(inst);
            }
            continue;
        }

        let mut end_rule = false;
        let mut rhs_line = line;
        if rhs_line.ends_with(';') {
            end_rule = true;
            rhs_line = rhs_line.trim_end_matches(';').trim();
        }

        if let Some(inst) = parse_rule_inst(rhs_line) {
            rhs.push(inst);
        }

        if end_rule {
            if !lhs.is_empty() {
                rules.push(Rule {
                    lhs: std::mem::take(&mut lhs),
                    rhs: std::mem::take(&mut rhs),
                });
            } else {
                lhs.clear();
                rhs.clear();
            }
            in_rhs = false;
        }
    }

    if in_rhs && !lhs.is_empty() {
        rules.push(Rule { lhs, rhs });
    }

    rules
}

fn build_rule_index(rules: &[Rule]) -> HashMap<String, Vec<usize>> {
    let mut index: HashMap<String, Vec<usize>> = HashMap::new();
    for (rule_idx, rule) in rules.iter().enumerate() {
        if let Some(last) = rule.lhs.last() {
            index
                .entry(last.mnemonic.clone())
                .or_default()
                .push(rule_idx);
        }
    }
    index
}

fn strip_comment(s: &str) -> &str {
    if let Some(idx) = s.find("//") {
        &s[..idx]
    } else {
        s
    }
}

fn parse_rule_inst(line: &str) -> Option<RuleInst> {
    let mut parts = line.splitn(2, |c: char| c == '\t' || c == ' ');
    let mnemonic = parts.next()?.trim();
    if mnemonic.is_empty() {
        return None;
    }
    let rest = parts.next().unwrap_or("").trim();
    let operands = if rest.is_empty() {
        Vec::new()
    } else {
        parse_operands(rest)
    };
    let operand_parts = operands.iter().map(|op| split_parts(op)).collect();
    Some(RuleInst {
        mnemonic: mnemonic.to_string(),
        operands,
        operand_parts,
    })
}

fn parse_operands(text: &str) -> Vec<String> {
    let mut operands = Vec::new();
    let mut current = String::new();
    let mut paren_depth = 0;

    for ch in text.chars() {
        match ch {
            '(' => {
                paren_depth += 1;
                current.push(ch);
            }
            ')' => {
                paren_depth -= 1;
                current.push(ch);
            }
            ',' if paren_depth == 0 => {
                let trimmed = current.trim();
                if !trimmed.is_empty() {
                    operands.push(trimmed.to_string());
                }
                current.clear();
            }
            _ => current.push(ch),
        }
    }

    let trimmed = current.trim();
    if !trimmed.is_empty() {
        operands.push(trimmed.to_string());
    }
    operands
}

fn find_match_in_block(
    block: &[Instruction],
    rules: &[Rule],
    rule_index: &HashMap<String, Vec<usize>>,
    analyzed: &[analysis::AnalyzedInstruction],
    block_base: usize,
    call_arity_map: &HashMap<String, (usize, usize)>,
    stage_name: &str,
) -> Option<(usize, usize, Vec<usize>, HashMap<String, String>)> {
    let block_index = build_block_reg_index(block, call_arity_map);
    for anchor in (0..block.len()).rev() {
        let Some(anchor_mnemonic) = block[anchor].mnemonic.as_deref() else {
            continue;
        };
        if !is_real_instruction(&block[anchor]) {
            continue;
        }
        let Some(candidate_rules) = rule_index.get(anchor_mnemonic) else {
            continue;
        };

        for &rule_idx in candidate_rules {
            let rule = &rules[rule_idx];
            if stage_name == "stage3" && stage3_disable_rule21() && is_stage3_disabled_rule(rule) {
                continue;
            }
            if let Some((matched, bindings)) =
                try_match(block, anchor, rule, analyzed, block_base, &block_index)
            {
                if stage_name == "stage3" && trace_rule21_enabled() && is_stage3_disabled_rule(rule)
                {
                    let start = *matched.iter().min().unwrap_or(&anchor);
                    let end = *matched.iter().max().unwrap_or(&anchor);
                    eprintln!(
                        "[rule21-match] block_base={} anchor={} span={}..{} matched={:?}",
                        block_base, anchor, start, end, matched
                    );
                    for idx in start..=end {
                        eprintln!("[rule21-match]   [{}] {}", idx, inst_text(&block[idx]));
                    }
                }
                if labels_are_safe(block, &matched, anchor) {
                    return Some((rule_idx, anchor, matched, bindings));
                }
            }
        }
    }
    None
}

fn try_match(
    block: &[Instruction],
    anchor: usize,
    rule: &Rule,
    analyzed: &[analysis::AnalyzedInstruction],
    block_base: usize,
    block_index: &BlockRegIndex,
) -> Option<(Vec<usize>, HashMap<String, String>)> {
    let mut bindings = HashMap::new();
    if !match_inst(&rule.lhs[rule.lhs.len() - 1], &block[anchor], &mut bindings) {
        return None;
    }

    let mut tracked = tracked_registers(&bindings);
    let mut matched = vec![anchor];
    let mut cursor = anchor as isize - 1;

    for pat_idx in (0..rule.lhs.len() - 1).rev() {
        let mut found = None;
        let mut pos = cursor;

        while pos >= 0 {
            let idx = pos as usize;
            let inst = &block[idx];

            let mut next_bindings = bindings.clone();
            if match_inst(&rule.lhs[pat_idx], inst, &mut next_bindings) {
                found = Some((idx, next_bindings));
                break;
            }

            if touches_tracked(inst, &tracked) {
                return None;
            }

            pos -= 1;
        }

        let (idx, next_bindings) = found?;
        bindings = next_bindings;
        tracked.extend(tracked_registers(&bindings));
        matched.push(idx);
        cursor = idx as isize - 1;
    }

    matched.sort_unstable();

    // Safety check for non-contiguous matches:
    // after all bindings are known, reject if any bound register is touched
    // by instructions between matched points.
    let all_tracked = tracked_registers(&bindings);
    if !all_tracked.is_empty() {
        let matched_set: HashSet<usize> = matched.iter().copied().collect();
        let start = *matched.first().unwrap();
        let end = *matched.last().unwrap();
        for idx in start..=end {
            if matched_set.contains(&idx) {
                continue;
            }
            if touches_tracked(&block[idx], &all_tracked) {
                return None;
            }
        }
    }

    // If we remove instructions that define registers, those definitions must not
    // be needed after the anchor. Without full liveness here, use a conservative
    // check: reject when any removed-def register appears later in the block.
    let removed_defs: HashSet<String> = matched
        .iter()
        .copied()
        .flat_map(|idx| def_regs(&block[idx]))
        .collect();

    // Deadness requirement:
    // if a removed definition is not redefined by RHS, it must be dead at the
    // rewrite point (anchor live-out).
    let rhs_defs: HashSet<String> = rule
        .rhs
        .iter()
        .map(|ri| instantiate_inst(ri, &bindings))
        .flat_map(|inst| def_regs(&inst))
        .collect();
    let anchor_global = block_base + anchor;
    let live_out = analyzed.get(anchor_global).map(|a| &a.live_out)?;
    for d in &removed_defs {
        if !rhs_defs.contains(d) && live_out.contains(d) {
            return None;
        }
    }

    // Block-local deadness:
    // if a removed def is used before its next overwrite, the rewrite is invalid.
    // This is precomputed by per-block DEF/USE position indexes.
    for d in &removed_defs {
        if rhs_defs.contains(d) {
            continue;
        }
        let next_use = next_after(block_index.uses.get(d), anchor);
        let next_def = next_after(block_index.defs.get(d), anchor);
        if let Some(use_pos) = next_use {
            // use_pos == def_pos means read-modify-write form (e.g. addi r, r, 1),
            // where the old value is consumed before overwrite.
            if next_def.map_or(true, |def_pos| use_pos <= def_pos) {
                return None;
            }
        }
    }

    Some((matched, bindings))
}

fn match_inst(pat: &RuleInst, inst: &Instruction, bindings: &mut HashMap<String, String>) -> bool {
    let Some(mnemonic) = inst.mnemonic.as_deref() else {
        return false;
    };

    if mnemonic != pat.mnemonic {
        return false;
    }
    if inst.operands.len() != pat.operands.len() {
        return false;
    }

    // %i0/%f0 are immutable zero registers. Treating them as ordinary
    // destinations makes move-chain rules unsound.
    if (mnemonic == "mov" || mnemonic == "fmov")
        && inst
            .operands
            .first()
            .map(|d| d == "%i0" || d == "%f0")
            .unwrap_or(false)
    {
        return false;
    }

    for (parts, a) in pat.operand_parts.iter().zip(inst.operands.iter()) {
        if !match_parts(parts, a, bindings) {
            return false;
        }
    }
    true
}

fn match_parts(parts: &[Part], actual: &str, bindings: &mut HashMap<String, String>) -> bool {
    if parts.is_empty() {
        return actual.is_empty();
    }

    let mut idx = 0usize;
    for i in 0..parts.len() {
        match &parts[i] {
            Part::Lit(lit) => {
                if !actual[idx..].starts_with(lit) {
                    return false;
                }
                idx += lit.len();
            }
            Part::Var(v) => {
                let next_lit = parts[i + 1..].iter().find_map(|p| match p {
                    Part::Lit(l) if !l.is_empty() => Some(l.as_str()),
                    _ => None,
                });

                let val = if let Some(nl) = next_lit {
                    let rel = match actual[idx..].find(nl) {
                        Some(r) => r,
                        None => return false,
                    };
                    let s = &actual[idx..idx + rel];
                    idx += rel;
                    s.to_string()
                } else {
                    let s = &actual[idx..];
                    idx = actual.len();
                    s.to_string()
                };

                if let Some(old) = bindings.get(v) {
                    if old != &val {
                        return false;
                    }
                } else {
                    if bindings
                        .iter()
                        .any(|(other_var, other_val)| other_var != v && other_val == &val)
                    {
                        return false;
                    }
                    bindings.insert(v.clone(), val);
                }
            }
        }
    }

    idx == actual.len()
}

fn split_parts(template: &str) -> Vec<Part> {
    let chars: Vec<char> = template.chars().collect();
    let mut i = 0usize;
    let mut lit = String::new();
    let mut out = Vec::new();

    while i < chars.len() {
        if chars[i] == '%'
            && i + 2 < chars.len()
            && chars[i + 1] == 'r'
            && chars[i + 2].is_ascii_digit()
        {
            if !lit.is_empty() {
                out.push(Part::Lit(std::mem::take(&mut lit)));
            }
            let mut j = i + 2;
            while j < chars.len() && chars[j].is_ascii_digit() {
                j += 1;
            }
            let var: String = chars[i..j].iter().collect();
            out.push(Part::Var(var));
            i = j;
            continue;
        }
        lit.push(chars[i]);
        i += 1;
    }

    if !lit.is_empty() {
        out.push(Part::Lit(lit));
    }

    out
}

fn tracked_registers(bindings: &HashMap<String, String>) -> HashSet<String> {
    bindings
        .values()
        .filter(|v| v.starts_with('%'))
        .cloned()
        .collect()
}

fn touches_tracked(inst: &Instruction, tracked: &HashSet<String>) -> bool {
    for op in &inst.operands {
        if op.starts_with('%') && tracked.contains(op) {
            return true;
        }
        if let Some(start) = op.find('(') {
            if let Some(end) = op[start + 1..].find(')') {
                let base = op[start + 1..start + 1 + end].trim();
                if base.starts_with('%') && tracked.contains(base) {
                    return true;
                }
            }
        }
    }
    false
}

fn def_regs(inst: &Instruction) -> Vec<String> {
    let Some(mnemonic) = inst.mnemonic.as_deref() else {
        return Vec::new();
    };
    if inst.operands.is_empty() {
        return Vec::new();
    }

    // Store/branch-like instructions do not define destination registers.
    let no_def = matches!(mnemonic, "sw" | "sb" | "sf" | "jzero" | "ret" | "call_dir" | "call_cls")
        || mnemonic.starts_with('.')
        || (mnemonic.starts_with('j') && mnemonic != "jmp");
    if no_def || inst.operands.is_empty() {
        return Vec::new();
    }

    if mnemonic == "jmp" {
        let dst = &inst.operands[0];
        if dst.starts_with('%') && dst != "%i0" && dst != "%f0" {
            return vec![dst.clone()];
        }
        return Vec::new();
    }

    let dst = &inst.operands[0];
    if dst.starts_with('%') && dst != "%i0" && dst != "%f0" {
        vec![dst.clone()]
    } else {
        Vec::new()
    }
}

fn build_block_reg_index(
    block: &[Instruction],
    call_arity_map: &HashMap<String, (usize, usize)>,
) -> BlockRegIndex {
    let mut index = BlockRegIndex::default();
    for (i, inst) in block.iter().enumerate() {
        for d in def_regs(inst) {
            index.defs.entry(d).or_default().push(i);
        }
        for u in use_regs(block, i, call_arity_map) {
            index.uses.entry(u).or_default().push(i);
        }
    }
    index
}

fn next_after(positions: Option<&Vec<usize>>, idx: usize) -> Option<usize> {
    let positions = positions?;
    let mut lo = 0usize;
    let mut hi = positions.len();
    while lo < hi {
        let mid = (lo + hi) / 2;
        if positions[mid] <= idx {
            lo = mid + 1;
        } else {
            hi = mid;
        }
    }
    positions.get(lo).copied()
}

fn use_regs(
    block: &[Instruction],
    idx: usize,
    call_arity_map: &HashMap<String, (usize, usize)>,
) -> Vec<String> {
    let inst = &block[idx];
    let Some(mnemonic) = inst.mnemonic.as_deref() else {
        return Vec::new();
    };
    if mnemonic.starts_with('.') {
        return Vec::new();
    }

    // If instruction has destination DEF, sources are operands[1..].
    // If it has no DEF (store/branch/call/ret), all register operands are USE.
    let has_def = inst
        .mnemonic
        .as_deref()
        .map(|m| {
            !(matches!(
                m,
                "sw" | "sb" | "sf" | "jzero" | "ret" | "call_dir" | "call_cls"
            ) || m.starts_with('.')
                || (m.starts_with('j') && m != "jmp"))
        })
        .unwrap_or(false)
        && !inst.operands.is_empty();
    let ops: &[String] = if has_def && inst.operands.len() > 1 {
        &inst.operands[1..]
    } else if has_def {
        &[]
    } else {
        &inst.operands
    };

    let mut out: Vec<String> = Vec::new();
    for op in ops {
        if op.starts_with('%') && !out.iter().any(|x| x == op) {
            out.push(op.clone());
        }
        if let Some(start) = op.find('(') {
            if let Some(end) = op[start + 1..].find(')') {
                let base = op[start + 1..start + 1 + end].trim();
                if base.starts_with('%') && !out.iter().any(|x| x == base) {
                    out.push(base.to_string());
                }
            }
        }
    }

    // Return-jump convention: jmp %i0, 0(%i3)
    // This consumes return value registers.
    if is_return_jmp(inst) {
        for r in ["%i30", "%f30"] {
            if !out.iter().any(|x| x == r) {
                out.push(r.to_string());
            }
        }
    }

    // Call-like instructions implicitly consume argument registers.
    // This includes:
    //  - call_dir / call_cls (pre-finalize)
    //  - jmp %i3, 0(%reg) in expanded calls (post-finalize)
    if mnemonic == "call_dir" || mnemonic == "call_cls" || is_call_jmp(inst) {
        let (int_arity, float_arity) = resolve_call_arity(block, idx, call_arity_map);
        let int_n = int_arity.clamp(0, 12);
        let float_n = float_arity.clamp(0, 15);
        for i in 0..int_n {
            let r = format!("%i{}", i + 4);
            if !out.iter().any(|x| x == &r) {
                out.push(r);
            }
        }
        for i in 0..float_n {
            let r = format!("%f{}", i + 1);
            if !out.iter().any(|x| x == &r) {
                out.push(r);
            }
        }
    }

    out
}

fn is_call_jmp(inst: &Instruction) -> bool {
    if inst.mnemonic.as_deref() != Some("jmp") || inst.operands.len() < 2 {
        return false;
    }
    inst.operands[0] == "%i3"
}

fn is_return_jmp(inst: &Instruction) -> bool {
    if inst.mnemonic.as_deref() != Some("jmp") || inst.operands.len() < 2 {
        return false;
    }
    if inst.operands[0] != "%i0" {
        return false;
    }
    parse_mem_base(inst.operands.get(1).map(|s| s.as_str()).unwrap_or(""))
        .map(|b| b == "%i3")
        .unwrap_or(false)
}

fn resolve_call_arity(
    block: &[Instruction],
    idx: usize,
    call_arity_map: &HashMap<String, (usize, usize)>,
) -> (usize, usize) {
    let inst = &block[idx];
    let mnem = inst.mnemonic.as_deref().unwrap_or("");

    if mnem == "call_dir" {
        if let Some(label) = inst.operands.first() {
            return call_arity_map.get(label).copied().unwrap_or((12, 15));
        }
        return (12, 15);
    }
    if mnem == "call_cls" {
        return (12, 15);
    }
    if mnem == "jmp" && is_call_jmp(inst) {
        if idx > 0 {
            let prev = &block[idx - 1];
            if prev.mnemonic.as_deref() == Some("set_label") && prev.operands.len() >= 2 {
                let set_reg = &prev.operands[0];
                if let Some(base) = parse_mem_base(inst.operands.get(1).map(|s| s.as_str()).unwrap_or("")) {
                    if set_reg == &base {
                        let label = &prev.operands[1];
                        return call_arity_map.get(label).copied().unwrap_or((12, 15));
                    }
                }
            }
        }
        return (12, 15);
    }
    (0, 0)
}

fn parse_mem_base(op: &str) -> Option<String> {
    let start = op.find('(')?;
    let end = op.find(')')?;
    if end <= start + 1 {
        return None;
    }
    Some(op[start + 1..end].trim().to_string())
}

fn inst_mentions_reg(inst: &Instruction, reg: &str) -> bool {
    for op in &inst.operands {
        if op == reg {
            return true;
        }
        if let Some(base) = parse_mem_base(op) {
            if base == reg {
                return true;
            }
        }
    }
    false
}

fn labels_are_safe(block: &[Instruction], matched: &[usize], anchor: usize) -> bool {
    for &idx in matched {
        if idx != anchor && block[idx].label.is_some() {
            return false;
        }
    }
    true
}

fn apply_rule(
    block: &mut Vec<Instruction>,
    anchor: usize,
    matched: &[usize],
    rule: &Rule,
    bindings: &HashMap<String, String>,
) {
    let mut anchor_new = anchor;
    let anchor_label = block[anchor].label.clone();

    for &idx in matched.iter().rev() {
        if idx == anchor {
            continue;
        }
        block.remove(idx);
        if idx < anchor_new {
            anchor_new -= 1;
        }
    }

    let mut new_insts: Vec<Instruction> = rule
        .rhs
        .iter()
        .map(|ri| instantiate_inst(ri, bindings))
        .collect();

    if let Some(lbl) = anchor_label {
        if let Some(first) = new_insts.first_mut() {
            first.label = Some(lbl);
        } else {
            new_insts.push(Instruction {
                label: Some(lbl),
                mnemonic: None,
                operands: Vec::new(),
            });
        }
    }

    block.remove(anchor_new);
    for (k, inst) in new_insts.into_iter().enumerate() {
        block.insert(anchor_new + k, inst);
    }
}

fn instantiate_inst(ri: &RuleInst, bindings: &HashMap<String, String>) -> Instruction {
    Instruction {
        label: None,
        mnemonic: Some(substitute_template(&ri.mnemonic, bindings)),
        operands: ri
            .operands
            .iter()
            .map(|op| substitute_template(op, bindings))
            .collect(),
    }
}

fn substitute_template(template: &str, bindings: &HashMap<String, String>) -> String {
    let parts = split_parts(template);
    let mut out = String::new();
    for p in parts {
        match p {
            Part::Lit(l) => out.push_str(&l),
            Part::Var(v) => {
                if let Some(val) = bindings.get(&v) {
                    out.push_str(val);
                } else {
                    out.push_str(&v);
                }
            }
        }
    }
    out
}

fn is_real_instruction(inst: &Instruction) -> bool {
    match inst.mnemonic.as_deref() {
        Some(m) => !m.starts_with('.'),
        None => false,
    }
}

fn is_terminator(inst: &Instruction) -> bool {
    if let Some(mnemonic) = inst.mnemonic.as_deref() {
        mnemonic.starts_with('j') || mnemonic == "ret" || mnemonic.starts_with("call_")
    } else {
        false
    }
}

fn is_block_boundary(prev: &Instruction, curr: &Instruction) -> bool {
    if curr.label.is_some() {
        return true;
    }
    if is_terminator(prev) {
        return true;
    }
    if !is_real_instruction(prev) || !is_real_instruction(curr) {
        return true;
    }
    false
}
