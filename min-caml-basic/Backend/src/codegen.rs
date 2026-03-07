/// Code generation: resolve virtual register names to physical names and emit text assembly.
use crate::coloring::Allocation;
use crate::input::Instruction;

/// Resolve a register name using the allocation map.
/// Virtual integer registers: color c -> %i(c+4)
/// Virtual float registers: color c -> %f(c+1)
/// Physical registers pass through unchanged.
fn resolve_reg(reg: &str, allocation: &Allocation) -> String {
    if let Some(result) = allocation.get(reg) {
        match result {
            Ok(color) => {
                if reg.starts_with("%vf") {
                    format!("%f{}", color + 1)
                } else if reg.starts_with("%vi") {
                    format!("%i{}", color + 4)
                } else {
                    // Physical register with known color - return as-is
                    reg.to_string()
                }
            }
            Err(()) => {
                // Spilled - shouldn't happen after successful coloring
                // Return as-is; spilling should have already replaced it
                reg.to_string()
            }
        }
    } else {
        // Not in allocation (physical register or special) - pass through
        reg.to_string()
    }
}

/// Resolve an operand, handling offset(reg) syntax.
fn resolve_operand(op: &str, allocation: &Allocation) -> String {
    // Check for offset(reg) pattern
    if let Some(paren_start) = op.find('(') {
        if let Some(paren_end) = op.find(')') {
            let offset_part = &op[..paren_start];
            let reg_part = &op[paren_start + 1..paren_end];
            let resolved = resolve_reg(reg_part, allocation);
            return format!("{}({})", offset_part, resolved);
        }
    }

    // Check if it's a register
    if op.starts_with('%') {
        return resolve_reg(op, allocation);
    }

    // Label, immediate, or other literal - pass through
    op.to_string()
}

/// Resolve virtual registers in an instruction stream to physical registers.
pub fn resolve_instructions(
    instructions: &[Instruction],
    allocation: &Allocation,
) -> Vec<Instruction> {
    instructions
        .iter()
        .map(|inst| {
            let mut out = inst.clone();
            if let Some(mnemonic) = inst.mnemonic.as_deref() {
                if !mnemonic.starts_with('.') {
                    out.operands = inst
                        .operands
                        .iter()
                        .map(|op| resolve_operand(op, allocation))
                        .collect();
                }
            }
            out
        })
        .collect()
}

/// Emit assembly text from already-resolved instructions.
pub fn emit_assembly(instructions: &[Instruction]) -> String {
    let mut output = String::new();

    for inst in instructions {
        let mut line = String::new();

        // Emit label
        if let Some(label) = &inst.label {
            line.push_str(label);
            line.push(':');
            if inst.mnemonic.is_none() {
                line.push('\n');
                output.push_str(&line);
                continue;
            }
            line.push('\n');
            output.push_str(&line);
            line = String::new();
        }

        if let Some(mnemonic) = &inst.mnemonic {
            // Skip directives that don't need register resolution
            match mnemonic.as_str() {
                ".virtual_def" => {
                    // Liveness-only pseudo-instruction: strip from output.
                    continue;
                }
                ".data" | ".text" | ".align" | ".global" | ".section" | ".func_entry" => {
                    // Pass through as-is
                    line.push_str(mnemonic);
                    if !inst.operands.is_empty() {
                        line.push('\t');
                        line.push_str(&inst.operands.join(", "));
                    }
                    line.push('\n');
                    output.push_str(&line);
                    continue;
                }
                ".long" => {
                    line.push('\t');
                    line.push_str(mnemonic);
                    if !inst.operands.is_empty() {
                        line.push('\t');
                        line.push_str(&inst.operands.join(", "));
                    }
                    line.push('\n');
                    output.push_str(&line);
                    continue;
                }
                _ => {}
            }

            let operands = &inst.operands;

            // Check for mov/fmov identity (mov %x, %x -> skip)
            match mnemonic.as_str() {
                "mov" | "fmov" => {
                    if operands.len() == 2 && operands[0] == operands[1] {
                        continue;
                    }
                }
                _ => {}
            }

            // Format the instruction
            line.push('\t');
            line.push_str(mnemonic);
            if !operands.is_empty() {
                line.push('\t');
                line.push_str(&operands.join(", "));
            }
            line.push('\n');
            output.push_str(&line);
        }
    }

    // Drop placeholder nop-only lines while keeping label lines.
    let mut filtered = String::with_capacity(output.len());
    for line in output.lines() {
        if line.trim() == "nop" {
            continue;
        }
        filtered.push_str(line);
        filtered.push('\n');
    }
    filtered
}

/// Resolve then emit (legacy single-step API).
#[allow(dead_code)]
pub fn generate_assembly(instructions: &[Instruction], allocation: &Allocation) -> String {
    let resolved = resolve_instructions(instructions, allocation);
    emit_assembly(&resolved)
}
