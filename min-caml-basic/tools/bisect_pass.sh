#!/bin/bash
# Bisection test: find which pass in the 5th iteration introduces the bug
# Usage: bash bisect_pass.sh
set -e

BASE=/Users/koharayu/Desktop/大学/cpu実験/procon-report
MINCAML=$BASE/min-caml-basic
BILLSIM=$BASE/bill_sim
INPUT=$BILLSIM/input.bin

cd $MINCAML

# Generate reference (iter=4, no 5th iteration)
echo "=== Reference: iter=4 (STOP_AFTER_PASS not set) ==="
dune exec mincaml -- -virtual -iter 4 test/minrt 2>/dev/null
cd Backend && cargo run --release -- ../test/minrt.s 2>/dev/null
cd $MINCAML
$BILLSIM/tkasm Backend/minrt_colored.s -o test/minrt.bin 2>/dev/null
timeout 90 $BILLSIM/sim test/minrt.bin --headless < $INPUT > /tmp/bisect_ref.ppm 2>/dev/null || echo "TIMEOUT (infinite loop!)"
echo "Reference PPM: $(wc -c < /tmp/bisect_ref.ppm) bytes"

# Test each pass stop point
for PASS in 1 2 3 4 5 7 10; do
    echo ""
    echo "=== Testing STOP_AFTER_PASS=$PASS (iter=5, stop 5th iter after pass $PASS) ==="
    STOP_AFTER_PASS=$PASS dune exec mincaml -- -virtual -iter 5 test/minrt 2>/dev/null
    cd Backend && cargo run --release -- ../test/minrt.s 2>/dev/null
    cd $MINCAML
    $BILLSIM/tkasm Backend/minrt_colored.s -o test/minrt.bin 2>/dev/null
    timeout 90 $BILLSIM/sim test/minrt.bin --headless < $INPUT > /tmp/bisect_pass${PASS}.ppm 2>/dev/null
    EXIT=$?
    SIZE=$(wc -c < /tmp/bisect_pass${PASS}.ppm)
    if [ "$EXIT" -eq 124 ]; then
        echo "PASS $PASS: TIMEOUT (infinite loop!) size=$SIZE"
    elif [ "$SIZE" -eq 0 ]; then
        echo "PASS $PASS: EMPTY OUTPUT"
    else
        echo "PASS $PASS: completed, size=$SIZE bytes"
        python3 tools/compare_ppm.py /tmp/bisect_ref.ppm /tmp/bisect_pass${PASS}.ppm 2>/dev/null | head -3
    fi
done

echo ""
echo "=== Full iter=5 (no stop) ==="
dune exec mincaml -- -virtual -iter 5 test/minrt 2>/dev/null
cd Backend && cargo run --release -- ../test/minrt.s 2>/dev/null
cd $MINCAML
$BILLSIM/tkasm Backend/minrt_colored.s -o test/minrt.bin 2>/dev/null
timeout 90 $BILLSIM/sim test/minrt.bin --headless < $INPUT > /tmp/bisect_full.ppm 2>/dev/null
EXIT=$?
SIZE=$(wc -c < /tmp/bisect_full.ppm)
if [ "$EXIT" -eq 124 ]; then
    echo "FULL: TIMEOUT (infinite loop!) size=$SIZE"
else
    echo "FULL: completed, size=$SIZE bytes"
    python3 tools/compare_ppm.py /tmp/bisect_ref.ppm /tmp/bisect_full.ppm 2>/dev/null | head -3
fi
