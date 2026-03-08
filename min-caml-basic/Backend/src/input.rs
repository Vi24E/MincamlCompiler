/// Assembly parser: reads virtual register assembly text into a Vec<Instruction>.
use std::collections::HashSet;
use std::fs;
use std::io;

#[derive(Debug, Clone)]
pub struct Instruction {
    pub label: Option<String>,
    pub mnemonic: Option<String>,
    pub operands: Vec<String>,
}

/// Read an assembly file and parse it into a list of Instructions.
/// Each line becomes one Instruction. Labels are attached to the same Instruction
/// as the following mnemonic if on the same line, or standalone if the line is just a label.
pub fn read_assembly_file(path: &str) -> io::Result<Vec<Instruction>> {
    let content = fs::read_to_string(path)?;
    let mut instructions = Vec::new();
    let mut pending_label: Option<String> = None;

    for line in content.lines() {
        let line = line.trim_end();

        // Skip empty lines
        if line.is_empty() {
            continue;
        }

        // Check for comment-only lines
        let line_no_comment = if let Some(idx) = line.find('#') {
            // but don't strip # inside strings... for assembly it's fine
            line[..idx].trim_end()
        } else {
            line
        };

        if line_no_comment.is_empty() {
            continue;
        }

        // Check if line starts with a label (non-whitespace, ends with ':')
        if !line_no_comment.starts_with('\t') && !line_no_comment.starts_with(' ') {
            // Could be a label or a directive
            if let Some(colon_pos) = line_no_comment.find(':') {
                let label = line_no_comment[..colon_pos].trim().to_string();
                let rest = line_no_comment[colon_pos + 1..].trim();

                if rest.is_empty() {
                    // Label only
                    // Flush any existing pending_label first
                    if let Some(prev_label) = pending_label.take() {
                        instructions.push(Instruction {
                            label: Some(prev_label),
                            mnemonic: None,
                            operands: Vec::new(),
                        });
                    }
                    pending_label = Some(label);
                    continue;
                } else {
                    // Label + instruction on same line
                    let inst = parse_instruction_text(rest);
                    instructions.push(Instruction {
                        label: Some(label),
                        mnemonic: inst.mnemonic,
                        operands: inst.operands,
                    });
                    pending_label = None;
                    continue;
                }
            }
        }

        // Parse the line as an instruction
        let trimmed = line_no_comment.trim();
        if trimmed.is_empty() {
            continue;
        }

        // Check for directives
        if trimmed.starts_with('.') {
            // Directives like .data, .text, .align, .global, .func_entry, .long
            let inst = parse_instruction_text(trimmed);
            instructions.push(Instruction {
                label: pending_label.take(),
                mnemonic: inst.mnemonic,
                operands: inst.operands,
            });
            continue;
        }

        // Regular instruction
        let inst = parse_instruction_text(trimmed);
        instructions.push(Instruction {
            label: pending_label.take(),
            mnemonic: inst.mnemonic,
            operands: inst.operands,
        });
    }

    // If there's a dangling label at the end
    if let Some(label) = pending_label {
        instructions.push(Instruction {
            label: Some(label),
            mnemonic: None,
            operands: Vec::new(),
        });
    }

    Ok(prune_unused_labels(instructions))
}

/// Drop label definitions that are never referenced by any operand.
/// This runs at parse-time so later passes operate on a cleaner IR.
fn prune_unused_labels(instructions: Vec<Instruction>) -> Vec<Instruction> {
    let mut defined_labels: HashSet<String> = HashSet::new();
    for inst in &instructions {
        if let Some(lbl) = inst.label.as_ref() {
            if !lbl.is_empty() {
                defined_labels.insert(lbl.clone());
            }
        }
    }
    if defined_labels.is_empty() {
        return instructions;
    }

    let mut used_labels: HashSet<String> = HashSet::new();
    for inst in &instructions {
        for op in &inst.operands {
            if defined_labels.contains(op.as_str()) {
                used_labels.insert(op.clone());
            }
        }
    }

    // Keep entry label even when not explicitly referenced.
    if defined_labels.contains("min_caml_start") {
        used_labels.insert("min_caml_start".to_string());
    }

    let mut out: Vec<Instruction> = Vec::with_capacity(instructions.len());
    for mut inst in instructions {
        if let Some(lbl) = inst.label.as_ref() {
            if !used_labels.contains(lbl.as_str()) {
                inst.label = None;
            }
        }
        if inst.label.is_none() && inst.mnemonic.is_none() {
            continue;
        }
        out.push(inst);
    }
    out
}

/// Parse an instruction text (without label) into mnemonic + operands.
fn parse_instruction_text(text: &str) -> Instruction {
    let text = text.trim();

    // Split on whitespace to get mnemonic
    let mut parts = text.splitn(2, |c: char| c == '\t' || c == ' ');
    let mnemonic = parts.next().unwrap_or("").trim().to_string();
    let rest = parts.next().unwrap_or("").trim();

    if mnemonic.is_empty() {
        return Instruction {
            label: None,
            mnemonic: None,
            operands: Vec::new(),
        };
    }

    let operands = if rest.is_empty() {
        Vec::new()
    } else {
        parse_operands(rest)
    };

    Instruction {
        label: None,
        mnemonic: Some(mnemonic),
        operands,
    }
}

/// Parse operands separated by commas, handling offset(reg) syntax.
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
                let trimmed = current.trim().to_string();
                if !trimmed.is_empty() {
                    operands.push(trimmed);
                }
                current.clear();
            }
            _ => {
                current.push(ch);
            }
        }
    }

    let trimmed = current.trim().to_string();
    if !trimmed.is_empty() {
        operands.push(trimmed);
    }

    operands
}
