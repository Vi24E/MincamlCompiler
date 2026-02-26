# Beta-move candidate with distinct constraint.
# Usage:
# python3 min-caml-basic/tools/asmseq.py find --asm min-caml-basic/Backend/minrt_colored.s --pattern-file min-caml-basic/tools/patterns/beta_move_candidate.pat
distinct: $1,$2,$3
mov $1, $2
mov $3, $1
