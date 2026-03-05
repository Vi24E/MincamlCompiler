#!/bin/bash
# Bisection test: find which ITERATION introduces the diff vs iter=0
set -e

BASE=/Users/koharayu/Desktop/大学/cpu実験/procon-report
MINCAML=$BASE/min-caml-basic
BILLSIM=$BASE/bill_sim
INPUT=$BILLSIM/input.bin

cd $MINCAML

# iter=0 reference already at /tmp/bisect_iter0.ppm

for ITER in 1 2 3 4 5; do
    echo ""
    echo "=== Testing iter=$ITER ==="
    dune exec mincaml -- -virtual -iter $ITER test/minrt 2>/dev/null
    cd Backend && cargo run --release -- ../test/minrt.s 2>/dev/null
    cd $MINCAML
    $BILLSIM/tkasm Backend/minrt_colored.s -o test/minrt.bin 2>/dev/null
    timeout 90 $BILLSIM/sim test/minrt.bin --headless < $INPUT > /tmp/bisect_iterN${ITER}.ppm 2>/dev/null
    EXIT=$?
    SIZE=$(wc -c < /tmp/bisect_iterN${ITER}.ppm)
    if [ "$EXIT" -eq 124 ]; then
        echo "iter=$ITER: TIMEOUT size=$SIZE"
    elif [ "$SIZE" -eq 0 ]; then
        echo "iter=$ITER: EMPTY"
    else
        echo "iter=$ITER: completed, size=$SIZE bytes"
        python3 tools/compare_ppm.py /tmp/bisect_iter0.ppm /tmp/bisect_iterN${ITER}.ppm 2>/dev/null | head -3
    fi
done
