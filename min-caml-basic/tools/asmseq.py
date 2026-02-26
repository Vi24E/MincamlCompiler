#!/usr/bin/env python3
"""
asmseq.py

Search instruction/label sequences in assembly files.
"""

import argparse
import json
import os
import re
import sys
from dataclasses import dataclass
from itertools import combinations
from typing import Dict, List, Optional, Sequence, Tuple


EXIT_OK = 0
EXIT_CLI_ERROR = 2
EXIT_IO_ERROR = 3


@dataclass
class Entry:
    kind: str  # "label" or "inst"
    line_no: int
    text: str
    function: Optional[str]
    label: Optional[str] = None
    mnemonic: Optional[str] = None
    operands: Optional[List[str]] = None


@dataclass
class PatternItem:
    kind: str  # "label" or "inst"
    raw: str
    label_regex: Optional[re.Pattern] = None
    mnemonic: Optional[str] = None
    operands: Optional[List[str]] = None


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Search assembly instruction/label sequences."
    )
    sub = parser.add_subparsers(dest="command")

    find = sub.add_parser("find", help="Find sequence matches.")
    find.add_argument("--asm", required=True, help="Path to .s file.")
    group = find.add_mutually_exclusive_group(required=True)
    group.add_argument("--pattern", help="Inline pattern (use ';' between items).")
    group.add_argument("--pattern-file", help="Pattern file path.")
    find.add_argument(
        "--allow-gap",
        type=int,
        default=0,
        help="Max skipped entries between adjacent pattern items.",
    )
    find.add_argument(
        "--function",
        help="Regex to limit matches by function label (matched on first item function).",
    )
    find.add_argument("--context", type=int, default=0, help="Context lines to show.")
    find.add_argument("--max-matches", type=int, help="Maximum match count to output.")
    find.add_argument("--json", action="store_true", help="Emit JSON.")
    find.add_argument("--count-only", action="store_true", help="Output only count.")
    find.add_argument(
        "--distinct",
        default="",
        help='Distinct constraints, e.g. "$1,$2;$2,$3".',
    )

    return parser.parse_args()


def strip_comment(line: str) -> str:
    if "#" in line:
        return line.split("#", 1)[0].rstrip()
    return line.rstrip()


def split_label_and_rest(line_no_comment: str) -> Tuple[Optional[str], str]:
    if not line_no_comment:
        return None, ""
    if line_no_comment[0].isspace():
        return None, line_no_comment.strip()

    m = re.match(r"^([A-Za-z0-9_.$]+):(.*)$", line_no_comment)
    if not m:
        return None, line_no_comment.strip()
    label = m.group(1).strip()
    rest = m.group(2).strip()
    return label, rest


def split_operands(operands_text: str) -> List[str]:
    out: List[str] = []
    buf: List[str] = []
    paren = 0
    for ch in operands_text:
        if ch == "(":
            paren += 1
            buf.append(ch)
        elif ch == ")":
            paren -= 1
            buf.append(ch)
        elif ch == "," and paren == 0:
            op = "".join(buf).strip()
            if op:
                out.append(op)
            buf = []
        else:
            buf.append(ch)
    op = "".join(buf).strip()
    if op:
        out.append(op)
    return out


def parse_inst_text(inst_text: str) -> Tuple[str, List[str]]:
    parts = inst_text.strip().split(None, 1)
    mnemonic = parts[0]
    ops = split_operands(parts[1]) if len(parts) == 2 else []
    return mnemonic, ops


def parse_asm(path: str) -> Tuple[List[Entry], List[str]]:
    try:
        with open(path, "r", encoding="utf-8") as f:
            lines = f.readlines()
    except OSError as e:
        raise RuntimeError(f"failed to read asm file: {e}") from e

    entries: List[Entry] = []
    current_func: Optional[str] = None
    pending_func_label = False

    for idx, raw in enumerate(lines):
        line_no = idx + 1
        src = raw.rstrip("\n")
        line = strip_comment(src)
        if not line.strip():
            continue

        label, rest = split_label_and_rest(line)

        if label is not None:
            if pending_func_label:
                current_func = label
                pending_func_label = False
            elif label in ("min_caml_start", "fin") and current_func is None:
                current_func = label

            entries.append(
                Entry(
                    kind="label",
                    line_no=line_no,
                    text=src,
                    function=current_func,
                    label=label,
                )
            )

        if not rest:
            continue

        mnemonic, operands = parse_inst_text(rest)
        if mnemonic == ".func_entry":
            pending_func_label = True
        elif mnemonic == ".end_function":
            pending_func_label = False
            # keep current_func for entries on this line, then clear.
        is_directive = mnemonic.startswith(".")

        if not is_directive:
            entries.append(
                Entry(
                    kind="inst",
                    line_no=line_no,
                    text=src,
                    function=current_func,
                    mnemonic=mnemonic,
                    operands=operands,
                    label=label,
                )
            )

        if mnemonic == ".end_function":
            current_func = None

    return entries, lines


def parse_distinct_pairs_spec(spec: str) -> List[Tuple[str, str]]:
    pairs: List[Tuple[str, str]] = []
    spec = spec.strip()
    if not spec:
        return pairs
    groups = [g.strip() for g in spec.split(";") if g.strip()]
    for g in groups:
        vars_in_group = [v.strip() for v in g.split(",") if v.strip()]
        for v in vars_in_group:
            if not re.fullmatch(r"\$[A-Za-z0-9_]+", v):
                raise ValueError(f"invalid distinct variable: {v}")
        if len(vars_in_group) < 2:
            raise ValueError(f"distinct group needs >=2 vars: {g}")
        for a, b in combinations(vars_in_group, 2):
            pairs.append((a, b))
    return pairs


def parse_pattern_lines(lines: Sequence[str]) -> Tuple[List[str], List[Tuple[str, str]]]:
    items: List[str] = []
    distinct_pairs: List[Tuple[str, str]] = []

    for raw in lines:
        line = strip_comment(raw).strip()
        if not line:
            continue
        if line.startswith("distinct:"):
            body = line[len("distinct:") :].strip()
            distinct_pairs.extend(parse_distinct_pairs_spec(body))
            continue
        parts = [p.strip() for p in line.split(";") if p.strip()]
        items.extend(parts)
    return items, distinct_pairs


def compile_label_regex(spec: str) -> re.Pattern:
    if spec == "*":
        return re.compile(r".+")
    try:
        return re.compile(spec)
    except re.error as e:
        raise ValueError(f"invalid label regex '{spec}': {e}") from e


def parse_pattern_items(items: Sequence[str]) -> List[PatternItem]:
    out: List[PatternItem] = []
    for it in items:
        if it.startswith("label:"):
            patt = it[len("label:") :].strip()
            if not patt:
                raise ValueError("label pattern must not be empty")
            out.append(
                PatternItem(
                    kind="label",
                    raw=it,
                    label_regex=compile_label_regex(patt),
                )
            )
            continue

        parts = it.split(None, 1)
        mnemonic = parts[0].strip()
        if not mnemonic:
            raise ValueError(f"invalid instruction pattern: '{it}'")
        operands = split_operands(parts[1]) if len(parts) == 2 else []
        out.append(
            PatternItem(
                kind="inst",
                raw=it,
                mnemonic=mnemonic,
                operands=operands,
            )
        )
    return out


def collect_pattern_vars(pattern_items: Sequence[PatternItem]) -> List[str]:
    vars_found: List[str] = []
    seen = set()
    for item in pattern_items:
        if item.kind != "inst" or item.operands is None:
            continue
        for op in item.operands:
            if re.fullmatch(r"\$[A-Za-z0-9_]+", op) and op not in seen:
                seen.add(op)
                vars_found.append(op)
    return vars_found


def entry_matches(
    item: PatternItem, entry: Entry, bindings: Dict[str, str]
) -> Optional[Dict[str, str]]:
    if item.kind == "label":
        if entry.kind != "label":
            return None
        if entry.label is None:
            return None
        assert item.label_regex is not None
        if not item.label_regex.search(entry.label):
            return None
        return dict(bindings)

    if entry.kind != "inst":
        return None
    assert item.mnemonic is not None
    if entry.mnemonic != item.mnemonic:
        return None

    patt_ops = item.operands or []
    actual_ops = entry.operands or []
    if len(patt_ops) != len(actual_ops):
        return None

    new_bindings = dict(bindings)
    for p, a in zip(patt_ops, actual_ops):
        if p == "op*":
            if not a:
                return None
            continue
        if p == "%*":
            if not a.startswith("%"):
                return None
            continue
        if re.fullmatch(r"\$[A-Za-z0-9_]+", p):
            prev = new_bindings.get(p)
            if prev is None:
                new_bindings[p] = a
            elif prev != a:
                return None
            continue
        if p != a:
            return None

    return new_bindings


def check_distinct(
    bindings: Dict[str, str], distinct_pairs: Sequence[Tuple[str, str]]
) -> bool:
    for a, b in distinct_pairs:
        va = bindings.get(a)
        vb = bindings.get(b)
        if va is None or vb is None:
            return False
        if va == vb:
            return False
    return True


def find_matches(
    entries: Sequence[Entry],
    items: Sequence[PatternItem],
    allow_gap: int,
    distinct_pairs: Sequence[Tuple[str, str]],
    function_regex: Optional[re.Pattern],
    max_matches: Optional[int],
) -> List[Dict]:
    if not items:
        return []

    results: List[Dict] = []
    n = len(entries)

    def rec(
        item_idx: int,
        prev_entry_idx: int,
        matched_indices: List[int],
        bindings: Dict[str, str],
    ) -> None:
        nonlocal results
        if max_matches is not None and len(results) >= max_matches:
            return

        if item_idx == len(items):
            if not check_distinct(bindings, distinct_pairs):
                return
            start_line = min(entries[i].line_no for i in matched_indices)
            end_line = max(entries[i].line_no for i in matched_indices)
            first = entries[matched_indices[0]]
            results.append(
                {
                    "indices": list(matched_indices),
                    "start_line": start_line,
                    "end_line": end_line,
                    "function": first.function,
                    "bindings": dict(bindings),
                }
            )
            return

        lo = prev_entry_idx + 1
        hi = min(n, prev_entry_idx + allow_gap + 2)
        for j in range(lo, hi):
            e = entries[j]
            if item_idx == 0 and function_regex is not None:
                if e.function is None or function_regex.search(e.function) is None:
                    continue
            new_bindings = entry_matches(items[item_idx], e, bindings)
            if new_bindings is None:
                continue
            rec(item_idx + 1, j, matched_indices + [j], new_bindings)

    # First item has no left gap constraint. Start from each entry.
    for i in range(n):
        if max_matches is not None and len(results) >= max_matches:
            break
        e = entries[i]
        if function_regex is not None:
            if e.function is None or function_regex.search(e.function) is None:
                continue
        b = entry_matches(items[0], e, {})
        if b is None:
            continue
        rec(1, i, [i], b)

    return results


def format_text_output(
    asm_path: str,
    matches: Sequence[Dict],
    entries: Sequence[Entry],
    source_lines: Sequence[str],
    context: int,
) -> str:
    out: List[str] = []
    out.append(f"asm: {asm_path}")
    out.append(f"matches: {len(matches)}")
    for mid, m in enumerate(matches, start=1):
        out.append("")
        out.append(
            f"[match {mid}] function={m['function'] or '<none>'} lines={m['start_line']}-{m['end_line']}"
        )
        if m["bindings"]:
            items = ", ".join(f"{k}={v}" for k, v in sorted(m["bindings"].items()))
            out.append(f"bindings: {items}")
        out.append("matched:")
        for idx in m["indices"]:
            e = entries[idx]
            out.append(f"  {e.line_no:6d}: {e.text.rstrip()}")
        if context > 0:
            lo = max(1, m["start_line"] - context)
            hi = min(len(source_lines), m["end_line"] + context)
            out.append("context:")
            for line_no in range(lo, hi + 1):
                marker = ">" if m["start_line"] <= line_no <= m["end_line"] else " "
                out.append(f"{marker} {line_no:6d}: {source_lines[line_no - 1].rstrip()}")
    return "\n".join(out)


def main() -> int:
    args = parse_args()
    if args.command != "find":
        print("error: subcommand is required (use: find)", file=sys.stderr)
        return EXIT_CLI_ERROR

    if args.allow_gap < 0:
        print("error: --allow-gap must be >= 0", file=sys.stderr)
        return EXIT_CLI_ERROR
    if args.context < 0:
        print("error: --context must be >= 0", file=sys.stderr)
        return EXIT_CLI_ERROR
    if args.max_matches is not None and args.max_matches <= 0:
        print("error: --max-matches must be > 0", file=sys.stderr)
        return EXIT_CLI_ERROR

    try:
        entries, source_lines = parse_asm(args.asm)
    except RuntimeError as e:
        print(f"error: {e}", file=sys.stderr)
        return EXIT_IO_ERROR

    try:
        if args.pattern is not None:
            raw_items, pf_distinct = parse_pattern_lines([args.pattern])
        else:
            with open(args.pattern_file, "r", encoding="utf-8") as f:
                raw_items, pf_distinct = parse_pattern_lines(f.readlines())
        if not raw_items:
            raise ValueError("no pattern items found")
        pattern_items = parse_pattern_items(raw_items)
        cli_distinct = parse_distinct_pairs_spec(args.distinct)
    except (OSError, ValueError) as e:
        print(f"error: {e}", file=sys.stderr)
        return EXIT_CLI_ERROR

    distinct_pairs = pf_distinct + cli_distinct

    used_vars = set(collect_pattern_vars(pattern_items))
    for a, b in distinct_pairs:
        if a not in used_vars or b not in used_vars:
            print(
                f"error: distinct constraint references unknown variable: {a},{b}",
                file=sys.stderr,
            )
            return EXIT_CLI_ERROR

    function_regex = None
    if args.function:
        try:
            function_regex = re.compile(args.function)
        except re.error as e:
            print(f"error: invalid --function regex: {e}", file=sys.stderr)
            return EXIT_CLI_ERROR

    matches = find_matches(
        entries=entries,
        items=pattern_items,
        allow_gap=args.allow_gap,
        distinct_pairs=distinct_pairs,
        function_regex=function_regex,
        max_matches=args.max_matches,
    )

    if args.count_only:
        if args.json:
            print(json.dumps({"asm_path": args.asm, "count": len(matches)}, ensure_ascii=False))
        else:
            print(len(matches))
        return EXIT_OK

    if args.json:
        payload = []
        for m in matches:
            matched_items = [entries[i].text.rstrip() for i in m["indices"]]
            payload.append(
                {
                    "asm_path": os.path.abspath(args.asm),
                    "function": m["function"],
                    "start_line": m["start_line"],
                    "end_line": m["end_line"],
                    "matched_items": matched_items,
                    "bindings": m["bindings"],
                    "distinct_constraints": [list(p) for p in distinct_pairs],
                }
            )
        print(json.dumps(payload, ensure_ascii=False, indent=2))
        return EXIT_OK

    print(
        format_text_output(
            asm_path=os.path.abspath(args.asm),
            matches=matches,
            entries=entries,
            source_lines=source_lines,
            context=args.context,
        )
    )
    return EXIT_OK


if __name__ == "__main__":
    sys.exit(main())
