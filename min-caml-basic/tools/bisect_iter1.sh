#!/bin/bash
# Bisection: find which pass in iter=1 introduces the diff vs iter=0
set -e

BASE=/Users/koharayu/Desktop/大学/cpu実験/procon-report
MINCAML=$BASE/min-caml-basic
BILLSIM=$BASE/bill_sim
INPUT=$BILLSIM/input.bin

cd $MINCAML

for PASS in 1 2 3 4 5 7 10; do
    echo ""
    echo "=== Testing iter=1 STOP_AFTER_PASS=$PASS ==="
    STOP_AT_ITER=1 STOP_AFTER_PASS=$PASS dune exec mincaml -- -virtual -iter 1 test/minrt 2>/dev/null
    cd Backend && cargo run --release -- ../test/minrt.s 2>/dev/null
    cd $MINCAML
    $BILLSIM/tkasm Backend/minrt_colored.s -o test/minrt.bin 2>/dev/null
    timeout 90 $BILLSIM/sim test/minrt.bin --headless < $INPUT > /tmp/bisect_i1p${PASS}.ppm 2>/dev/null
    EXIT=$?
    SIZE=$(wc -c < /tmp/bisect_i1p${PASS}.ppm)
    if [ "$EXIT" -eq 124 ]; then
        echo "PASS $PASS: TIMEOUT size=$SIZE"
    elif [ "$SIZE" -eq 0 ]; then
        echo "PASS $PASS: EMPTY"
    else
        echo "PASS $PASS: completed, size=$SIZE"
        python3 tools/compare_ppm.py /tmp/bisect_iter0.ppm /tmp/bisect_i1p${PASS}.ppm 2>/dev/null | head -3
    fi
done
