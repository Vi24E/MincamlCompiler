#!/usr/bin/env python3
# Debug: find trampoline-like blocks where jmp uses non-%i0 (i.e., saves return addr)

import sys

path = sys.argv[1] if len(sys.argv) > 1 else "test/minrt.s"

with open(path) as f:
    lines = f.readlines()

insts = []  # (label, mnemonic_text, line_no)
pending = None
for i, line in enumerate(lines, 1):
    s = line.rstrip()
    if not s or s.lstrip().startswith('#'):
        continue
    if not s.startswith('\t') and not s.startswith(' '):
        if ':' in s:
            col = s.index(':')
            label = s[:col].strip()
            rest = s[col+1:].strip()
            if not rest:
                if pending:
                    insts.append((pending[0], None, pending[1]))
                pending = (label, i)
                continue
            else:
                if pending:
                    insts.append((pending[0], None, pending[1]))
                    pending = None
                insts.append((label, rest, i))
                continue
    mnem = s.strip()
    label = None
    if pending:
        label = pending[0]
        pending = None
    insts.append((label, mnem, i))

if pending:
    insts.append((pending[0], None, pending[1]))

# Find all set_label+jmp trampoline patterns
trampolines = []  # (label, target, jmp_ret_reg, line_no)
for idx in range(len(insts) - 1):
    lbl, mnem, ln = insts[idx]
    if lbl is None or mnem is None:
        continue
    parts = mnem.split()
    if parts[0] != 'set_label' or len(parts) < 3:
        continue
    reg = parts[1].rstrip(',')
    target = parts[2]

    nlbl, nmnem, nln = insts[idx + 1]
    if nlbl is not None or nmnem is None:
        continue
    nparts = nmnem.split()
    if nparts[0] != 'jmp' or len(nparts) < 3:
        continue
    ret_reg = nparts[1].rstrip(',')
    jmp_target = nparts[2]
    if jmp_target == f'0({reg})':
        trampolines.append((lbl, target, ret_reg, ln))

print(f"Total trampolines: {len(trampolines)}")
non_i0 = [(l, t, r, n) for l, t, r, n in trampolines if r != '%i0']
print(f"Non-%i0 (using saved ret addr): {len(non_i0)}")
for t in non_i0[:20]:
    print(f"  label={t[0]}, target={t[1]}, ret_reg={t[2]}, line={t[3]}")

i0 = [(l, t, r, n) for l, t, r, n in trampolines if r == '%i0']
print(f"\n%i0 trampolines (pure forward): {len(i0)}")
