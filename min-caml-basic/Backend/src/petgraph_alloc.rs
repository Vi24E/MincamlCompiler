use crate::analysis::InterferenceGraph;
use crate::coloring::{Allocation, NodePreference, PreferenceMap};
use petgraph::graph::UnGraph;
use std::collections::{BTreeMap, BTreeSet, BinaryHeap, HashMap, VecDeque};

fn is_int_reg(name: &str) -> bool {
    name.starts_with("%i") || name.starts_with("%vi")
}

fn is_float_reg(name: &str) -> bool {
    name.starts_with("%f") || name.starts_with("%vf")
}

fn is_fixed_reg(name: &str) -> bool {
    matches!(name, "%i0" | "%i1" | "%i2" | "%i3" | "%f0")
}

fn precolor_int() -> BTreeMap<String, usize> {
    let mut m = BTreeMap::new();
    for i in 4..=29 {
        m.insert(format!("%i{}", i), i - 4);
    }
    m
}

fn precolor_float() -> BTreeMap<String, usize> {
    let mut m = BTreeMap::new();
    for i in 1..=29 {
        m.insert(format!("%f{}", i), i - 1);
    }
    m
}

fn is_same_class(name: &str, is_int: bool) -> bool {
    if is_int {
        is_int_reg(name)
    } else {
        is_float_reg(name)
    }
}

fn max_color_for_class(is_int: bool, k_int: usize) -> usize {
    if is_int {
        k_int
    } else {
        29
    }
}

fn pick_color(
    node_name: &str,
    pref: Option<&NodePreference>,
    is_int: bool,
    k: usize,
    used: &BTreeSet<usize>,
    forbidden: &BTreeSet<usize>,
) -> Option<usize> {
    let mut best: Option<(i32, usize)> = None;

    for c in 0..k {
        if used.contains(&c) || forbidden.contains(&c) {
            continue;
        }

        let mut score: i32 = 0;
        if let Some(p) = pref {
            if p.prefer_caller {
                if is_int {
                    if c <= 11 {
                        score += 1_000;
                    }
                } else if c <= 14 {
                    score += 1_000;
                }
            }
            if p.prefer_callee {
                if is_int {
                    if (12..=25).contains(&c) {
                        score += 1_000;
                    }
                } else if (15..=28).contains(&c) {
                    score += 1_000;
                }
            }
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

    let _ = node_name;
    best.map(|(_, c)| c)
}

fn assign_class(
    graph: &InterferenceGraph,
    prefs: &PreferenceMap,
    is_int: bool,
    k_int: usize,
    out: &mut Allocation,
) {
    let names: Vec<String> = graph
        .adj
        .keys()
        .filter(|n| !is_fixed_reg(n) && is_same_class(n, is_int))
        .cloned()
        .collect();
    if names.is_empty() {
        return;
    }

    let k = max_color_for_class(is_int, k_int);
    let precolors = if is_int {
        precolor_int()
    } else {
        precolor_float()
    };
    let n = names.len();
    let mut name_to_idx: HashMap<String, usize> = HashMap::with_capacity(n);
    for (i, name) in names.iter().enumerate() {
        name_to_idx.insert(name.clone(), i);
    }

    let mut forced_vprecolors: HashMap<usize, usize> = HashMap::new();
    for (i, name) in names.iter().enumerate() {
        if let Some(p) = prefs.get(name) {
            if let Some(c) = p.arg_index {
                if c < k {
                    let forbidden = graph.forbidden.get(name);
                    if forbidden.map(|f| f.contains(&c)).unwrap_or(false) {
                        continue;
                    }
                    forced_vprecolors.insert(i, c);
                }
            }
        }
    }

    // Keep petgraph usage explicit, but do allocation work on compact vectors.
    let mut g: UnGraph<(), ()> = UnGraph::new_undirected();
    for _ in 0..n {
        g.add_node(());
    }

    let mut neighbors: Vec<Vec<usize>> = vec![Vec::new(); n];
    for (u_name, neis) in &graph.adj {
        if !is_same_class(u_name, is_int) {
            continue;
        }
        let Some(&u) = name_to_idx.get(u_name) else {
            continue;
        };
        for v_name in neis {
            if !is_same_class(v_name, is_int) {
                continue;
            }
            let Some(&v) = name_to_idx.get(v_name) else {
                continue;
            };
            if u < v {
                g.add_edge(
                    petgraph::graph::NodeIndex::new(u),
                    petgraph::graph::NodeIndex::new(v),
                    (),
                );
                neighbors[u].push(v);
                neighbors[v].push(u);
            }
        }
    }

    let mut degree: Vec<usize> = neighbors.iter().map(|x| x.len()).collect();
    let mut remaining: Vec<bool> = vec![true; n];
    let mut removed: Vec<bool> = vec![false; n];
    let mut remaining_count = n;

    // Pre-colored nodes are not simplified.
    for (i, name) in names.iter().enumerate() {
        if precolors.contains_key(name) || forced_vprecolors.contains_key(&i) {
            remaining[i] = false;
            removed[i] = true;
            remaining_count = remaining_count.saturating_sub(1);
        }
    }

    let mut low_queue: VecDeque<usize> = VecDeque::new();
    for i in 0..n {
        if remaining[i] && degree[i] < k {
            low_queue.push_back(i);
        }
    }

    let mut heap: BinaryHeap<(usize, usize, usize)> = BinaryHeap::new();
    let mut stamp = 0usize;
    for i in 0..n {
        if remaining[i] {
            heap.push((degree[i], stamp, i));
            stamp += 1;
        }
    }

    let mut stack: Vec<(usize, bool)> = Vec::with_capacity(n);

    while remaining_count > 0 {
        while let Some(node) = low_queue.pop_front() {
            if !remaining[node] || degree[node] >= k {
                continue;
            }
            remaining[node] = false;
            removed[node] = true;
            remaining_count -= 1;
            stack.push((node, false));

            for &nei in &neighbors[node] {
                if removed[nei] {
                    continue;
                }
                let old_deg = degree[nei];
                let new_deg = old_deg.saturating_sub(1);
                if new_deg != old_deg {
                    degree[nei] = new_deg;
                    if remaining[nei] {
                        if new_deg < k {
                            low_queue.push_back(nei);
                        }
                        heap.push((new_deg, stamp, nei));
                        stamp += 1;
                    }
                }
            }
        }

        if remaining_count == 0 {
            break;
        }

        let spill_candidate = loop {
            if let Some((d, _s, node)) = heap.pop() {
                if !remaining[node] {
                    continue;
                }
                if d != degree[node] {
                    continue;
                }
                break node;
            }
            let mut picked = None;
            for (i, alive) in remaining.iter().enumerate() {
                if *alive {
                    picked = Some(i);
                    break;
                }
            }
            if let Some(node) = picked {
                break node;
            }
        };

        remaining[spill_candidate] = false;
        removed[spill_candidate] = true;
        remaining_count -= 1;
        stack.push((spill_candidate, true));

        for &nei in &neighbors[spill_candidate] {
            if removed[nei] {
                continue;
            }
            let old_deg = degree[nei];
            let new_deg = old_deg.saturating_sub(1);
            if new_deg != old_deg {
                degree[nei] = new_deg;
                if remaining[nei] {
                    if new_deg < k {
                        low_queue.push_back(nei);
                    }
                    heap.push((new_deg, stamp, nei));
                    stamp += 1;
                }
            }
        }
    }

    let mut assigned: Vec<Option<usize>> = vec![None; n];
    for (i, name) in names.iter().enumerate() {
        if let Some(c) = precolors.get(name) {
            assigned[i] = Some(*c);
            out.insert(name.clone(), Ok(*c));
        }
    }
    for (&i, &c) in &forced_vprecolors {
        if assigned[i].is_none() {
            assigned[i] = Some(c);
            out.insert(names[i].clone(), Ok(c));
        }
    }

    while let Some((node, _spill_candidate)) = stack.pop() {
        let mut used: BTreeSet<usize> = BTreeSet::new();
        for &nei in &neighbors[node] {
            if let Some(c) = assigned[nei] {
                used.insert(c);
            }
        }

        let name = &names[node];
        let forbidden = graph
            .forbidden
            .get(name)
            .cloned()
            .unwrap_or_else(Default::default);
        let pref = prefs.get(name);

        if let Some(c) = pick_color(name, pref, is_int, k, &used, &forbidden) {
            assigned[node] = Some(c);
            out.insert(name.clone(), Ok(c));
        } else {
            out.insert(name.clone(), Err(()));
        }
    }
}

pub fn allocate(graph: &InterferenceGraph, prefs: &PreferenceMap, k_int: usize) -> Allocation {
    let mut out = Allocation::new();
    assign_class(graph, prefs, true, k_int, &mut out);
    assign_class(graph, prefs, false, k_int, &mut out);
    out
}
