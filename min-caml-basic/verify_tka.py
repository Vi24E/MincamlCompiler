#!/usr/bin/env python3
import os
import sys
import subprocess
import glob
import argparse
import re
import math

# Configuration
TEST_DIR = "test"
MIN_CAML = "./min-caml"
LIB_ASM = "TKA/libmincaml.S" # Adjust if needed
FLOAT_TOLERANCE = 1e-6
FLOAT_WARNING_THRESHOLD = 1e-3

def run_command(cmd, cwd=None, capture_output=True):
    """Run a shell command and return stdout, stderr, and return code."""
    try:
        result = subprocess.run(
            cmd,
            cwd=cwd,
            shell=True,
            check=False,
            stdout=subprocess.PIPE if capture_output else None,
            stderr=subprocess.PIPE if capture_output else None,
            text=True
        )
        return result.stdout, result.stderr, result.returncode
    except Exception as e:
        return "", str(e), -1

def extract_numbers(text):
    """Extract all int/float numbers from text."""
    return [float(s) for s in re.findall(r'-?\d+\.?\d*(?:[eE][-+]?\d+)?', text)]

def compare_outputs(expected, actual):
    """Compare expected and actual outputs, allowing float tolerance."""
    exp_nums = extract_numbers(expected)
    act_nums = extract_numbers(actual)

    if len(exp_nums) != len(act_nums):
        return False, f"Number count mismatch: expected {len(exp_nums)}, got {len(act_nums)}"

    warnings = []
    for e, a in zip(exp_nums, act_nums):
        diff = abs(e - a)
        max_abs = max(abs(e), abs(a))
        
        is_error = False
        is_warning = False
        
        if max_abs < 1e-9:
            if diff > FLOAT_WARNING_THRESHOLD:
                is_error = True
            elif diff > FLOAT_TOLERANCE:
                is_warning = True
        else:
            rel_err = diff / max_abs
            if rel_err > FLOAT_WARNING_THRESHOLD:
                is_error = True
            elif rel_err > FLOAT_TOLERANCE and diff > FLOAT_TOLERANCE:
                is_warning = True # Only warn if absolute diff is also significant
                
        if is_error:
             return False, f"Mismatch: expected {e}, got {a} (diff {diff:.2e})"
        if is_warning:
             rel_err = diff / max_abs if max_abs >= 1e-9 else 0.0
             warnings.append(f"val {e} (rel_err {rel_err:.2e})")

    if warnings:
        return True, "WARN: " + "; ".join(warnings[:3]) + ("..." if len(warnings) > 3 else "")
    
    return True, "Match"

def print_failure_details(exp_out, act_out, act_err=""):
    print("  Ocaml:")
    print("    " + exp_out.strip().replace("\n", "\n    "))
    print("  MinCaml:")
    if act_out.strip():
        print("    " + act_out.strip().replace("\n", "\n    "))
    if act_err.strip():
        print("    [Stderr]:")
        print("    " + act_err.strip().replace("\n", "\n    "))

def clean_test_dir():
    """Remove all files in TEST_DIR except .ml files."""
    print(f"Cleaning {TEST_DIR} directory...")
    files = glob.glob(os.path.join(TEST_DIR, "*"))
    count = 0
    for f in files:
        if os.path.isfile(f) and not f.endswith(".ml"):
            try:
                os.remove(f)
                count += 1
            except Exception as e:
                print(f"Error removing {f}: {e}")
    print(f"Removed {count} files.")

def main():
    parser = argparse.ArgumentParser(description="Verify min-caml compiler output.")
    parser.add_argument("--sim", help="Command to run simulator.", default="../bill_sim/sim {} --headless")
    parser.add_argument("--asm", help="Command to run assembler.", default="../bill_sim/tkasm")
    parser.add_argument("--test", help="Run specific test name (e.g. 'ack'). Run all if omitted.", default=None)
    parser.add_argument("--trim-after", help="String to trim output after.", default="Headless finished")
    parser.add_argument("--clean", help="Clean generated files in test directory.", action="store_true")
    args = parser.parse_args()

    if args.clean:
        clean_test_dir()
        sys.exit(0)



    if not os.path.exists(LIB_ASM) and args.asm:
        print(f"Warning: Library assembly {LIB_ASM} not found. Linking might fail.")

    if args.test:
        test_files = [os.path.join(TEST_DIR, args.test + ".ml")]
    else:
        # Exclude minrt related files as per user request to save time/avoid complexity
        all_files = glob.glob(os.path.join(TEST_DIR, "*.ml"))
        test_files = [f for f in all_files if not os.path.basename(f).startswith("minrt") and "integrate_test4" not in os.path.basename(f)]
        test_files.sort()

    passed = 0
    skipped_sim = 0
    failed = 0

    print(f"Running {len(test_files)} tests...")
    print("-" * 60)

    for ml_file in test_files:
        base_name = os.path.splitext(os.path.basename(ml_file))[0]
        base_path = os.path.join(TEST_DIR, base_name)
        
        print(f"Testing {base_name}...", end=" ", flush=True)

        # 1. Compile
        cmd_compile = f"dune exec mincaml {base_path}"
        out, err, rc = run_command(cmd_compile)
        if rc != 0:
            print(f" COMPILE FAILED")
            # print(err)
            failed += 1
            print("❌")
            continue

        # Append library assembly if it exists
        sim_target_s = f"{base_path}.s"
        if os.path.exists(LIB_ASM) and os.path.exists(sim_target_s):
            try:
                with open(sim_target_s, "a") as f_target, open(LIB_ASM, "r") as f_lib:
                    f_target.write("\n" + f_lib.read())
            except Exception as e:
                print(f" ERROR appending lib assembly: {e}")
                failed += 1
                continue

        # 2. Generate Expected Output
        # 2. Generate Expected Output
        # Prepend shim to handle char/int difference in print_char
        with open(ml_file, 'r') as f:
            orig_code = f.read()
            
        tmp_ml = f"{base_path}.tmp.ml"
        with open(tmp_ml, 'w') as f:
            f.write("let print_char x = print_char (char_of_int x) in\n")
            f.write(orig_code)

        cmd_ocaml = f"ocaml {tmp_ml}"
        exp_out, exp_err, exp_rc = run_command(cmd_ocaml)

        if os.path.exists(tmp_ml):
            try:
                os.remove(tmp_ml)
            except:
                pass
        if exp_rc != 0:
            print(f" OCAML FAILED")
            print(exp_err)
            failed += 1
            print("❌")
            continue
        
        with open(f"{base_path}.ans", "w") as f:
            f.write(exp_out)

        # 3. Simulate (and Assemble if needed)
        if args.sim:
            sim_target = f"{base_path}.s"
            
            # Assemble if assembler provided
            if args.asm:
                bin_target = f"{base_path}.bin"
                # Support simple "asm src -o dst" or similar?
                # Assuming tkasm syntax: ./tkasm file.s -o file.bin
                # If command has {}, replace it. If not, append.
                # Actually, standard Makefiles use: $(ASM) input -o output
                # Let's try simple Append: "$ASM input -o output"
                
                # Check for template in asm command too?
                # If no template: default to "asm <src> -o <dst>"
                if "{}" in args.asm:
                    # If template exists, user must handle output filename insertion?
                    # Too complex. Let's assume standard behavior or minimal template.
                    # Or just assume args.asm is the executable path.
                    cmd_asm = f"{args.asm} {sim_target} -o {bin_target}"
                else:
                    cmd_asm = f"{args.asm} {sim_target} -o {bin_target}"

                out_asm, err_asm, rc_asm = run_command(cmd_asm)
                if rc_asm != 0:
                    print(f" ASM FAILED")
                    print(err_asm)
                    failed += 1
                    print("❌")
                    continue
                
                sim_target = bin_target

            # Construct simulator command
            if "{}" in args.sim:
                cmd_sim = args.sim.replace("{}", sim_target)
            else:
                cmd_sim = f"{args.sim} {sim_target}"

            act_out, act_err, act_rc = run_command(cmd_sim)
            
            if act_rc != 0:
                print(f" SIM FAILED (Exit Code: {act_rc})")
                print("❌")
                print_failure_details(exp_out, act_out, act_err)
                failed += 1
                continue
            
            # Trim output if requested
            if args.trim_after and args.trim_after in act_out:
                act_out = act_out.split(args.trim_after)[0]

            # 4. Compare
            match, msg = compare_outputs(exp_out, act_out)
            if match:
                if "WARN" in msg:
                    print(f"PASS (with warnings) ⚠️  {msg}")
                else:
                    print("PASS ✅")
                passed += 1
            else:
                print(f" FAIL ❌ ({msg})")
                print_failure_details(exp_out, act_out, act_err)
                failed += 1

        else:
            print("COMPILED (No Sim) ✅")
            skipped_sim += 1
            passed += 1

    print("-" * 60)
    print(f"Summary: {passed} passed, {failed} failed, {skipped_sim} skipped simulation.")
    if failed > 0:
        sys.exit(1)
    else:
        sys.exit(0)

if __name__ == "__main__":
    main()
