/// Chaitin-Briggs graph coloring register allocator.
use crate::analysis::InterferenceGraph;
use std::collections::{BTreeMap, BTreeSet};

/// Allocation maps variable name -> Result<color, ()>.
/// Ok(color) = successfully colored, Err(()) = spilled.
pub type Allocation = BTreeMap<String, Result<usize, ()>>;

#[derive(Debug, Clone, Default)]
pub struct NodePreference {
    pub prefer_caller: bool,
    pub prefer_callee: bool,
    pub arg_index: Option<usize>,
    pub color_penalty: BTreeMap<usize, i32>,
}

pub type PreferenceMap = BTreeMap<String, NodePreference>;

/// Pre-colored register info: maps physical register name to its fixed color.
fn precolor_int() -> BTreeMap<String, usize> {
    let mut m = BTreeMap::new();
    // %i4 -> color 0, %i5 -> color 1, ..., %i29 -> color 25
    for i in 4..=29 {
        m.insert(format!("%i{}", i), i - 4);
    }
    m
}

fn precolor_float() -> BTreeMap<String, usize> {
    let mut m = BTreeMap::new();
    // %f1 -> color 0, %f2 -> color 1, ..., %f29 -> color 28
    // %f30 is reserved as return-preservation register.
    for i in 1..=29 {
        m.insert(format!("%f{}", i), i - 1);
    }
    m
}

/// Determine if a register is an integer type (physical or virtual).
fn is_int_reg(s: &str) -> bool {
    s.starts_with("%i") || s.starts_with("%vi")
}

/// Determine if a register is a float type (physical or virtual).
fn is_float_reg(s: &str) -> bool {
    s.starts_with("%f") || s.starts_with("%vf")
}

/// Check if a physical register is a fixed/special register that shouldn't be in the graph.
fn is_fixed_reg(s: &str) -> bool {
    matches!(s, "%i0" | "%i1" | "%i2" | "%i3" | "%f0")
}

pub struct Coloring {
    k_int: usize,
    k_float: usize,
    graph: InterferenceGraph,
    preferences: PreferenceMap,
}

impl Coloring {
    pub fn new(k: usize, graph: InterferenceGraph) -> Self {
        // k is for integers. For floats we use a different K.
        // K_int=26 (%i4..%i29), K_float=29 (%f1..%f29).
        // %f30 is reserved for preserving call return values.
        Coloring {
            k_int: k,
            k_float: 29,
            graph,
            preferences: PreferenceMap::new(),
        }
    }

    pub fn set_preferences(&mut self, preferences: PreferenceMap) {
        self.preferences = preferences;
    }

    pub fn graph(&self) -> &InterferenceGraph {
        &self.graph
    }

    pub fn color(&self) -> Allocation {
        // Separate integer and float interference graphs
        let (int_nodes, float_nodes) = self.partition_nodes();

        let int_alloc = self.color_class(&int_nodes, true);
        let float_alloc = self.color_class(&float_nodes, false);

        let mut allocation = int_alloc;
        allocation.extend(float_alloc);
        allocation
    }

    fn partition_nodes(&self) -> (BTreeSet<String>, BTreeSet<String>) {
        let mut int_nodes = BTreeSet::new();
        let mut float_nodes = BTreeSet::new();

        for node in self.graph.adj.keys() {
            if is_fixed_reg(node) {
                continue;
            }
            if is_int_reg(node) {
                int_nodes.insert(node.clone());
            } else if is_float_reg(node) {
                float_nodes.insert(node.clone());
            }
        }

        (int_nodes, float_nodes)
    }

    fn color_class(&self, nodes: &BTreeSet<String>, is_int: bool) -> Allocation {
        let k = if is_int { self.k_int } else { self.k_float };
        let precolors = if is_int {
            precolor_int()
        } else {
            precolor_float()
        };

        // Build adjacency for this class only
        let mut adj: BTreeMap<String, BTreeSet<String>> = BTreeMap::new();
        for node in nodes {
            adj.entry(node.clone()).or_default();
            if let Some(neighbors) = self.graph.adj.get(node) {
                for neighbor in neighbors {
                    if nodes.contains(neighbor) {
                        adj.entry(node.clone())
                            .or_default()
                            .insert(neighbor.clone());
                    }
                }
            }
        }

        // Entry-argument virtual registers can be treated as fixed-color hints.
        // This helps remove function-entry moves such as:
        //   mov %i19, %i4
        // by reserving ABI arg colors for argument vregs upfront.
        let mut forced_vprecolors: BTreeMap<String, usize> = BTreeMap::new();
        for node in nodes {
            if let Some(pref) = self.preferences.get(node) {
                if let Some(c) = pref.arg_index {
                    if c < k {
                        let forbidden = self.graph.forbidden.get(node);
                        if forbidden.map(|f| f.contains(&c)).unwrap_or(false) {
                            continue;
                        }
                        forced_vprecolors.insert(node.clone(), c);
                    }
                }
            }
        }
        // Drop conflicting forced colors (same class/color among interfering vregs).
        let forced_snapshot = forced_vprecolors.clone();
        forced_vprecolors.retain(|node, c| {
            if let Some(neighbors) = adj.get(node) {
                for n in neighbors {
                    if let Some(cn) = forced_snapshot.get(n) {
                        if cn == c {
                            return false;
                        }
                    }
                }
            }
            true
        });

        // Simplify + Potential Spill
        let mut stack: Vec<(String, bool)> = Vec::new(); // (node, is_potential_spill)
        let mut removed: BTreeSet<String> = BTreeSet::new();
        let mut remaining: BTreeSet<String> = nodes.clone();

        // Remove pre-colored nodes from "remaining" - they don't get simplified
        // but they do constrain coloring
        let precolored_in_graph: BTreeSet<String> = remaining
            .iter()
            .filter(|n| precolors.contains_key(n.as_str()) || forced_vprecolors.contains_key(*n))
            .cloned()
            .collect();
        for pc in &precolored_in_graph {
            remaining.remove(pc);
        }

        // Only virtual registers need to be pushed onto stack
        loop {
            // Simplify: find nodes with degree < k
            let mut simplified_any = true;
            while simplified_any {
                simplified_any = false;
                let candidates: Vec<String> = remaining
                    .iter()
                    .filter(|n| {
                        let deg = self.effective_degree(n, &adj, &removed);
                        deg < k
                    })
                    .cloned()
                    .collect();

                for node in candidates {
                    stack.push((node.clone(), false));
                    removed.insert(node.clone());
                    remaining.remove(&node);
                    simplified_any = true;
                }
            }

            if remaining.is_empty() {
                break;
            }

            // Potential Spill: pick node with highest degree
            let spill_candidate = remaining
                .iter()
                .max_by_key(|n| self.effective_degree(n, &adj, &removed))
                .cloned()
                .unwrap();

            stack.push((spill_candidate.clone(), true));
            removed.insert(spill_candidate.clone());
            remaining.remove(&spill_candidate);
        }

        // Select: pop from stack and assign colors
        let mut allocation = Allocation::new();

        // Pre-colored registers get their fixed colors
        for (reg, color) in &precolors {
            if nodes.contains(reg) {
                allocation.insert(reg.clone(), Ok(*color));
            }
        }
        // Forced virtual pre-colors (entry argument hints)
        for (reg, color) in &forced_vprecolors {
            if nodes.contains(reg) {
                allocation.insert(reg.clone(), Ok(*color));
            }
        }

        while let Some((node, _is_potential_spill)) = stack.pop() {
            // Find colors used by neighbors
            let mut used_colors: BTreeSet<usize> = BTreeSet::new();
            if let Some(neighbors) = adj.get(&node) {
                for neighbor in neighbors {
                    if let Some(Ok(color)) = allocation.get(neighbor) {
                        used_colors.insert(*color);
                    }
                }
            }
            // Also check interference with pre-colored registers that may not be in adj
            // (e.g., %i31, %i30 which are outside K range)
            if let Some(neighbors) = self.graph.adj.get(&node) {
                for neighbor in neighbors {
                    if let Some(color) = precolors.get(neighbor) {
                        used_colors.insert(*color);
                    }
                    // Also check already-allocated neighbors
                    if let Some(Ok(color)) = allocation.get(neighbor) {
                        used_colors.insert(*color);
                    }
                }
            }

            let forbidden = self.graph.forbidden.get(&node).cloned().unwrap_or_default();

            let color = self.pick_color_with_preference(
                &node,
                k,
                is_int,
                &used_colors,
                &forbidden,
            );

            match color {
                Some(c) => {
                    allocation.insert(node, Ok(c));
                }
                None => {
                    // Actual spill
                    allocation.insert(node, Err(()));
                }
            }
        }

        allocation
    }

    fn pick_color_with_preference(
        &self,
        node: &str,
        k: usize,
        is_int: bool,
        used_colors: &BTreeSet<usize>,
        forbidden: &BTreeSet<usize>,
    ) -> Option<usize> {
        let mut best: Option<(i32, usize)> = None;
        let pref = self.preferences.get(node);

        for c in 0..k {
            if used_colors.contains(&c) || forbidden.contains(&c) {
                continue;
            }

            let mut score: i32 = 0;
            if let Some(p) = pref {
                if p.prefer_caller && is_caller_color(c, is_int) {
                    score += 1_000;
                }
                if p.prefer_callee && is_callee_color(c, is_int) {
                    score += 1_000;
                }
                // Arg-index proximity bonus (always applied, not gated on prefer_caller).
                // In ALL_CALLER_SAVE mode, this works for all colors since there's no
                // caller/callee partition.
                if let Some(arg_idx) = p.arg_index {
                    let dist = (c as i32 - arg_idx as i32).abs();
                    score += 200 - dist.min(200);
                }
                if let Some(penalty) = p.color_penalty.get(&c) {
                    score -= *penalty;
                }
            }

            match best {
                Some((best_score, best_color)) => {
                    if score > best_score || (score == best_score && c < best_color) {
                        best = Some((score, c));
                    }
                }
                None => best = Some((score, c)),
            }
        }

        best.map(|(_, c)| c)
    }

    fn effective_degree(
        &self,
        node: &str,
        adj: &BTreeMap<String, BTreeSet<String>>,
        removed: &BTreeSet<String>,
    ) -> usize {
        if let Some(neighbors) = adj.get(node) {
            neighbors
                .iter()
                .filter(|n| !removed.contains(n.as_str()))
                .count()
        } else {
            0
        }
    }
}

fn is_caller_color(color: usize, is_int: bool) -> bool {
    if is_int {
        // int caller-save: %i4..%i15 => colors 0..11
        color <= 11
    } else {
        // float caller-save: %f1..%f15 => colors 0..14
        color <= 14
    }
}

fn is_callee_color(color: usize, is_int: bool) -> bool {
    if is_int {
        // int callee-save: %i16..%i29 => colors 12..25
        (12..=25).contains(&color)
    } else {
        // float callee-save: %f16..%f29 => colors 15..28
        (15..=28).contains(&color)
    }
}
