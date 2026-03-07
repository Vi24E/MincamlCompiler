use crate::analysis::AnalyzedInstruction;
use regalloc2::{
    run, Algorithm, AllocationKind, Block, Function, Inst, InstRange, MachineEnv, Operand, PReg,
    PRegSet, RegClass, RegAllocError, RegallocOptions, VReg,
};
use std::collections::{HashMap, HashSet};

#[derive(Debug, Clone)]
pub struct CompareResult {
    pub total_vregs: usize,
    pub spilled_vregs: usize,
    pub spilled_int_vregs: usize,
    pub spilled_float_vregs: usize,
    pub spillslots: usize,
}

struct AdapterFunction {
    inst_operands: Vec<Vec<Operand>>,
    inst_clobbers: Vec<PRegSet>,
    inst_is_ret: Vec<bool>,
    inst_is_branch: Vec<bool>,
    block_succs: Vec<Vec<Block>>,
    block_preds: Vec<Vec<Block>>,
    empty_vregs: Vec<VReg>,
    vreg_count: usize,
}

impl Function for AdapterFunction {
    fn num_insts(&self) -> usize {
        self.inst_operands.len()
    }

    fn num_blocks(&self) -> usize {
        self.inst_operands.len()
    }

    fn entry_block(&self) -> Block {
        Block::new(0)
    }

    fn block_insns(&self, block: Block) -> InstRange {
        let i = block.index();
        InstRange::new(Inst::new(i), Inst::new(i + 1))
    }

    fn block_succs(&self, block: Block) -> &[Block] {
        &self.block_succs[block.index()]
    }

    fn block_preds(&self, block: Block) -> &[Block] {
        &self.block_preds[block.index()]
    }

    fn block_params(&self, _block: Block) -> &[VReg] {
        &self.empty_vregs
    }

    fn is_ret(&self, insn: Inst) -> bool {
        self.inst_is_ret[insn.index()]
    }

    fn is_branch(&self, insn: Inst) -> bool {
        self.inst_is_branch[insn.index()]
    }

    fn branch_blockparams(&self, _block: Block, _insn: Inst, _succ_idx: usize) -> &[VReg] {
        &self.empty_vregs
    }

    fn inst_operands(&self, insn: Inst) -> &[Operand] {
        &self.inst_operands[insn.index()]
    }

    fn inst_clobbers(&self, insn: Inst) -> PRegSet {
        self.inst_clobbers[insn.index()]
    }

    fn num_vregs(&self) -> usize {
        self.vreg_count
    }

    fn spillslot_size(&self, _regclass: RegClass) -> usize {
        1
    }

    fn allow_multiple_vreg_defs(&self) -> bool {
        true
    }
}

fn virtual_reg_class(name: &str) -> Option<RegClass> {
    if name.starts_with("%vi") {
        Some(RegClass::Int)
    } else if name.starts_with("%vf") {
        Some(RegClass::Float)
    } else {
        None
    }
}

fn parse_preg(name: &str) -> Option<PReg> {
    if let Some(rest) = name.strip_prefix("%i") {
        let hw: usize = rest.parse().ok()?;
        if hw <= 63 {
            return Some(PReg::new(hw, RegClass::Int));
        }
    }
    if let Some(rest) = name.strip_prefix("%f") {
        let hw: usize = rest.parse().ok()?;
        if hw <= 63 {
            return Some(PReg::new(hw, RegClass::Float));
        }
    }
    None
}

fn build_machine_env() -> MachineEnv {
    let int_regs: Vec<PReg> = (4..=29).map(|i| PReg::new(i, RegClass::Int)).collect();
    let float_regs: Vec<PReg> = (1..=29).map(|i| PReg::new(i, RegClass::Float)).collect();
    MachineEnv {
        preferred_regs_by_class: [int_regs, float_regs, vec![]],
        non_preferred_regs_by_class: [vec![], vec![], vec![]],
        scratch_by_class: [
            Some(PReg::new(31, RegClass::Int)),
            Some(PReg::new(31, RegClass::Float)),
            None,
        ],
        fixed_stack_slots: vec![],
    }
}

struct AdapterBuild {
    func: AdapterFunction,
    vreg_class_by_id: Vec<RegClass>,
    name_by_vreg: Vec<String>,
}

fn build_adapter(analyzed: &[AnalyzedInstruction]) -> AdapterBuild {
    let n = analyzed.len();
    let mut name_to_vreg: HashMap<String, VReg> = HashMap::new();
    let mut vreg_class_by_id: Vec<RegClass> = Vec::new();
    let mut name_by_vreg: Vec<String> = Vec::new();
    let mut intern_vreg = |name: &str| -> Option<VReg> {
        let cls = virtual_reg_class(name)?;
        if let Some(v) = name_to_vreg.get(name) {
            return Some(*v);
        }
        let id = vreg_class_by_id.len();
        let vr = VReg::new(id, cls);
        name_to_vreg.insert(name.to_string(), vr);
        vreg_class_by_id.push(cls);
        name_by_vreg.push(name.to_string());
        Some(vr)
    };

    let mut inst_operands: Vec<Vec<Operand>> = Vec::with_capacity(n);
    let mut inst_clobbers: Vec<PRegSet> = Vec::with_capacity(n);
    let mut inst_is_ret: Vec<bool> = Vec::with_capacity(n);
    let mut inst_is_branch: Vec<bool> = Vec::with_capacity(n);
    let mut block_succs: Vec<Vec<Block>> = vec![Vec::new(); n];
    let mut block_preds: Vec<Vec<Block>> = vec![Vec::new(); n];

    for (i, inst) in analyzed.iter().enumerate() {
        let mut ops: Vec<Operand> = Vec::new();

        for u in &inst.uses {
            if let Some(vr) = intern_vreg(u) {
                ops.push(Operand::reg_use(vr));
            }
        }
        for d in &inst.defs {
            if let Some(vr) = intern_vreg(d) {
                ops.push(Operand::reg_def(vr));
            }
        }
        inst_operands.push(ops);

        let mut clobbers = PRegSet::empty();
        for d in &inst.defs {
            if virtual_reg_class(d).is_none() {
                if let Some(p) = parse_preg(d) {
                    clobbers.add(p);
                }
            }
        }
        inst_clobbers.push(clobbers);

        let mnemonic = inst.instruction.mnemonic.as_deref().unwrap_or("");
        inst_is_ret.push(mnemonic == "ret");
        inst_is_branch.push(false);

        if i + 1 < n {
            block_succs[i].push(Block::new(i + 1));
            block_preds[i + 1].push(Block::new(i));
        }
    }

    let func = AdapterFunction {
        inst_operands,
        inst_clobbers,
        inst_is_ret,
        inst_is_branch,
        block_succs,
        block_preds,
        empty_vregs: Vec::new(),
        vreg_count: vreg_class_by_id.len(),
    };
    AdapterBuild {
        func,
        vreg_class_by_id,
        name_by_vreg,
    }
}

fn preg_to_backend_color(p: PReg) -> Option<usize> {
    match p.class() {
        RegClass::Int => {
            let hw = p.hw_enc();
            if (4..=29).contains(&hw) {
                Some(hw - 4)
            } else {
                None
            }
        }
        RegClass::Float => {
            let hw = p.hw_enc();
            if (1..=29).contains(&hw) {
                Some(hw - 1)
            } else {
                None
            }
        }
        RegClass::Vector => None,
    }
}

fn seed_from_regalloc2(
    analyzed: &[AnalyzedInstruction],
) -> Result<(Vec<Option<usize>>, Vec<bool>, usize), RegAllocError> {
    let built = build_adapter(analyzed);
    let func = built.func;
    let vreg_count = built.vreg_class_by_id.len();
    let mut color_counts: Vec<HashMap<usize, usize>> = vec![HashMap::new(); vreg_count];
    let mut saw_stack: Vec<bool> = vec![false; vreg_count];

    let env = build_machine_env();
    let options = RegallocOptions {
        verbose_log: false,
        validate_ssa: false,
        algorithm: Algorithm::Ion,
    };
    let output = run(&func, &env, &options)?;

    for i in 0..analyzed.len() {
        let inst = Inst::new(i);
        let allocs = output.inst_allocs(inst);
        let ops = func.inst_operands(inst);
        let m = allocs.len().min(ops.len());
        for j in 0..m {
            let vid = ops[j].vreg().vreg();
            if vid >= vreg_count {
                continue;
            }
            match allocs[j].kind() {
                AllocationKind::Reg => {
                    if let Some(p) = allocs[j].as_reg() {
                        if let Some(c) = preg_to_backend_color(p) {
                            *color_counts[vid].entry(c).or_insert(0) += 1;
                        }
                    }
                }
                AllocationKind::Stack => {
                    saw_stack[vid] = true;
                }
                AllocationKind::None => {}
            }
        }
    }

    let mut seed_colors: Vec<Option<usize>> = vec![None; vreg_count];
    for vid in 0..vreg_count {
        if color_counts[vid].is_empty() {
            continue;
        }
        let mut best: Option<(usize, usize)> = None; // (count, color)
        for (&c, &cnt) in &color_counts[vid] {
            match best {
                None => best = Some((cnt, c)),
                Some((bc, bcol)) => {
                    if cnt > bc || (cnt == bc && c < bcol) {
                        best = Some((cnt, c));
                    }
                }
            }
        }
        seed_colors[vid] = best.map(|(_, c)| c);
    }

    Ok((seed_colors, saw_stack, output.num_spillslots))
}

pub fn compare_spills(analyzed: &[AnalyzedInstruction]) -> Result<CompareResult, RegAllocError> {
    if analyzed.is_empty() {
        return Ok(CompareResult {
            total_vregs: 0,
            spilled_vregs: 0,
            spilled_int_vregs: 0,
            spilled_float_vregs: 0,
            spillslots: 0,
        });
    }

    let built = build_adapter(analyzed);
    let vreg_class_by_id = built.vreg_class_by_id;
    let (seed_colors, saw_stack, spillslots) = seed_from_regalloc2(analyzed)?;
    let mut spilled_vregs: HashSet<usize> = HashSet::new();
    for vid in 0..seed_colors.len() {
        if seed_colors[vid].is_none() && saw_stack[vid] {
            spilled_vregs.insert(vid);
        }
    }

    let mut spilled_int = 0usize;
    let mut spilled_float = 0usize;
    for vid in &spilled_vregs {
        match vreg_class_by_id.get(*vid).copied() {
            Some(RegClass::Int) => spilled_int += 1,
            Some(RegClass::Float) => spilled_float += 1,
            _ => {}
        }
    }

    Ok(CompareResult {
        total_vregs: vreg_class_by_id.len(),
        spilled_vregs: spilled_vregs.len(),
        spilled_int_vregs: spilled_int,
        spilled_float_vregs: spilled_float,
        spillslots,
    })
}

pub fn seed_color_hints(analyzed: &[AnalyzedInstruction]) -> Result<HashMap<String, usize>, RegAllocError> {
    let built = build_adapter(analyzed);
    let name_by_vreg = built.name_by_vreg;
    let (seed_colors, _saw_stack, _spillslots) = seed_from_regalloc2(analyzed)?;
    let mut out = HashMap::new();
    let n = seed_colors.len().min(name_by_vreg.len());
    for vid in 0..n {
        if let Some(c) = seed_colors[vid] {
            out.insert(name_by_vreg[vid].clone(), c);
        }
    }
    Ok(out)
}
