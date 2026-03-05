#!/usr/bin/env python3
import os
import subprocess
import sys
import datetime
import re
import time
import argparse
import struct
import zlib


def parse_ppm_text(text):
    tokens = text.split()
    if len(tokens) < 4:
        raise ValueError("PPM is too short")
    if tokens[0] != "P3":
        raise ValueError("PPM magic must be P3")
    width = int(tokens[1])
    height = int(tokens[2])
    maxval = int(tokens[3])
    if width <= 0 or height <= 0 or maxval <= 0:
        raise ValueError("Invalid PPM header values")
    need = width * height * 3
    values = list(map(int, tokens[4:4 + need]))
    if len(values) < need:
        raise ValueError("PPM pixel data is shorter than expected")
    return width, height, maxval, values


def write_ppm(path, width, height, maxval, values):
    with open(path, "w") as f:
        f.write(f"P3\n{width} {height}\n{maxval}\n")
        idx = 0
        for _ in range(height):
            row = []
            for _ in range(width):
                r, g, b = values[idx], values[idx + 1], values[idx + 2]
                idx += 3
                row.append(f"{r} {g} {b}")
            f.write(" ".join(row) + "\n")


def _png_chunk(chunk_type, data):
    head = chunk_type + data
    return (
        struct.pack(">I", len(data))
        + head
        + struct.pack(">I", zlib.crc32(head) & 0xFFFFFFFF)
    )


def write_png(path, width, height, maxval, values):
    if maxval != 255:
        scale = 255.0 / float(maxval)
        values = [max(0, min(255, int(round(v * scale)))) for v in values]
    else:
        values = [max(0, min(255, v)) for v in values]

    raw = bytearray()
    idx = 0
    for _ in range(height):
        raw.append(0)  # filter type 0
        for _ in range(width):
            raw.append(values[idx])
            raw.append(values[idx + 1])
            raw.append(values[idx + 2])
            idx += 3

    png_sig = b"\x89PNG\r\n\x1a\n"
    ihdr = struct.pack(">IIBBBBB", width, height, 8, 2, 0, 0, 0)  # RGB8
    idat = zlib.compress(bytes(raw), level=9)
    data = png_sig + _png_chunk(b"IHDR", ihdr) + _png_chunk(b"IDAT", idat) + _png_chunk(b"IEND", b"")
    with open(path, "wb") as f:
        f.write(data)


def save_image_pair(ppm_text, ppm_path, png_path, label):
    try:
        w, h, maxval, values = parse_ppm_text(ppm_text)
        write_ppm(ppm_path, w, h, maxval, values)
        write_png(png_path, w, h, maxval, values)
    except Exception as e:
        print(f"Warning: Failed to save {label} image files: {e}")

def parse_profile_stats(output):
    """Parse ProfileStats section from sim output."""
    stats = {
        "mem_access_count": None,
        "mem_access_rate": None,
        "top_functions": [],
        "opcode_counts": [],
    }
    in_section = False
    for line in output.splitlines():
        if line.strip() == "=== ProfileStats ===":
            in_section = True
            continue
        if line.strip() == "=== EndProfileStats ===":
            break
        if not in_section:
            continue
        m = re.match(r"MemAccessCount:\s*(\d+)", line)
        if m:
            stats["mem_access_count"] = int(m.group(1))
        m = re.match(r"MemAccessRate:\s*([\d.]+)%", line)
        if m:
            stats["mem_access_rate"] = float(m.group(1))
        m = re.match(r"TopFunctions:\s*(\d+)", line)
        if m:
            pass
        m = re.match(r"\s+Func PC=(0x[0-9a-f]+)\s+calls=(\d+)(?:\s+#\s*(.+))?", line)
        if m:
            addr = m.group(1)
            calls = int(m.group(2))
            name = m.group(3).strip() if m.group(3) else None
            stats["top_functions"].append((addr, calls, name))
        m = re.match(r"\s+Opcode\s+([A-Z0-9_]+)\s+count=([\d,]+)", line)
        if m:
            opname = m.group(1)
            count = int(m.group(2).replace(",", ""))
            stats["opcode_counts"].append((opname, count))
    return stats

def format_top_opcode_rates(opcode_counts, top_n=15, per_line=5):
    if not opcode_counts:
        return ""
    total_ops = sum(c for _, c in opcode_counts)
    if total_ops <= 0:
        return ""
    parts = []
    for rank, (opname, count) in enumerate(opcode_counts[:top_n], 1):
        pct = (count / total_ops) * 100.0
        parts.append(f"{rank}. {opname}: {pct:.0f}%")
    lines = []
    for i in range(0, len(parts), per_line):
        lines.append(" | ".join(parts[i:i + per_line]))
    return "\n".join(lines)


def _looks_like_text_input(data):
    if not data:
        return False
    printable = 0
    for b in data:
        if b in (9, 10, 13) or 32 <= b <= 126:
            printable += 1
    return (printable / len(data)) > 0.98


def convert_minrt_text_input_to_binary(text):
    """
    Convert tokenized text input into raw 32-bit binary.
    Whitespace (space/newline/tab) is only a separator.
    Each numeric token becomes 4 bytes:
      - int token   -> signed int32 (big-endian)
      - float token -> IEEE754 float32 (big-endian)
    """
    out = bytearray()
    tokens = text.split()
    for idx, tok in enumerate(tokens):
        try:
            if any(c in tok for c in ".eE"):
                out.extend(struct.pack(">f", float(tok)))
            else:
                v = int(tok, 0)
                if v < -2147483648 or v > 2147483647:
                    raise ValueError("int32 out of range")
                out.extend(struct.pack(">i", v))
        except ValueError as e:
            raise ValueError(f"Failed to parse token #{idx + 1} '{tok}': {e}") from e
    return bytes(out)


def convert_minrt_text_input_to_binary_typed(text):
    """
    Convert minrt text input into raw 32-bit binary by following the exact
    read_int/read_float order used in test/minrt.ml (read_parameter path).
    """
    tokens = text.split()
    out = bytearray()
    idx = 0

    def read_token():
        nonlocal idx
        if idx >= len(tokens):
            raise ValueError("unexpected end of tokens")
        t = tokens[idx]
        idx += 1
        return t

    def read_int_token():
        tok = read_token()
        try:
            v = int(tok, 0)
        except ValueError:
            fv = float(tok)
            if not fv.is_integer():
                raise ValueError(f"token '{tok}' is not an integer")
            v = int(fv)
        if v < -2147483648 or v > 2147483647:
            raise ValueError(f"int32 out of range: {v}")
        out.extend(struct.pack(">i", v))
        return v

    def read_float_token():
        tok = read_token()
        out.extend(struct.pack(">f", float(tok)))

    # read_screen_settings: 5 floats
    for _ in range(5):
        read_float_token()

    # read_light: 1 int + 3 floats
    read_int_token()
    for _ in range(3):
        read_float_token()

    # read_all_object
    for _ in range(60):
        texture = read_int_token()
        if texture == -1:
            break
        read_int_token()  # form
        read_int_token()  # refltype
        isrot_p = read_int_token()
        for _ in range(12):  # abc, xyz, invert, reflparam, color
            read_float_token()
        if isrot_p != 0:
            for _ in range(3):
                read_float_token()

    # read_and_network
    while True:
        first = read_int_token()
        if first == -1:
            break
        while True:
            item = read_int_token()
            if item == -1:
                break

    # read_or_network
    while True:
        first = read_int_token()
        if first == -1:
            break
        while True:
            item = read_int_token()
            if item == -1:
                break

    if idx != len(tokens):
        raise ValueError(f"unused tokens remain after typed conversion: used {idx}/{len(tokens)}")

    return bytes(out)



def parse_args():
    parser = argparse.ArgumentParser(description="min-caml tester")
    mode_group = parser.add_mutually_exclusive_group()
    mode_group.add_argument("--v1", action="store_true", help="run v1 (OCaml backend)")
    mode_group.add_argument("--v2", action="store_true", help="run v2 (Rust backend)")
    parser.add_argument(
        "--timelimit",
        type=float,
        default=120.0,
        help="simulation timeout in seconds (default: 120)",
    )
    parser.add_argument(
        "--no-timelimit",
        action="store_true",
        help="disable simulation timeout",
    )
    # For compatibility with requested style: `--no timelimit`
    parser.add_argument(
        "--no",
        dest="no_option",
        choices=["timelimit"],
        help="disable an option (e.g. `--no timelimit`)",
    )
    parser.add_argument(
        "--input-source",
        default="../bill_sim/input.bin",
        help="source input file for minrt (text or binary) (default: ../bill_sim/input.bin)",
    )
    parser.add_argument(
        "--ocaml-input-source",
        default="../bill_sim/input_ascii_backup.bin",
        help="text input file for OCaml reference (used when --input-source is binary)",
    )
    return parser.parse_args()


def get_mode(args):
    if args.v1:
        return 1
    if args.v2:
        return 2
    
    print("Select mode:")
    print("1: v1 (Legendary min-caml)")
    print("2: v2 (New Backend)")
    try:
        val = input("Reference (1/2): ")
        if val.strip() == "1":
            return 1
        elif val.strip() == "2":
            return 2
        else:
            print("Invalid input. Defaulting to v1.")
            return 1
    except EOFError:
        return 1

def main():
    args = parse_args()
    mode = get_mode(args)
    print(f"Running in v{mode} mode.")

    # Setup paths
    script_dir = os.path.dirname(os.path.abspath(__file__))
    project_root = os.path.abspath(os.path.join(script_dir, ".."))
    
    # Change current working directory to project root
    os.chdir(project_root)
    print(f"Working directory: {os.getcwd()}")

    # Prepare simulator input.
    input_source_path = os.path.abspath(os.path.join(project_root, args.input_source))
    sim_input_path = os.path.join(project_root, "input.bin")
    if not os.path.exists(input_source_path):
        print(f"Error: input source not found: {input_source_path}")
        sys.exit(1)
    try:
        with open(input_source_path, "rb") as f:
            source_bytes = f.read()
        if _looks_like_text_input(source_bytes):
            source_text = source_bytes.decode("ascii", errors="strict")
            force_lexical = os.environ.get("MINRT_INPUT_LEXICAL", "") == "1"
            if force_lexical:
                sim_bytes = convert_minrt_text_input_to_binary(source_text)
                mode_str = "text->binary(lexical i32/f32)"
            else:
                try:
                    sim_bytes = convert_minrt_text_input_to_binary_typed(source_text)
                    mode_str = "text->binary(minrt-typed i32/f32)"
                except Exception as e:
                    print(f"Warning: typed conversion failed, fallback to lexical conversion: {e}")
                    sim_bytes = convert_minrt_text_input_to_binary(source_text)
                    mode_str = "text->binary(lexical i32/f32)"
        else:
            sim_bytes = source_bytes
            mode_str = "binary(pass-through)"
        with open(sim_input_path, "wb") as f:
            f.write(sim_bytes)
        print(f"Prepared simulator input: {sim_input_path} ({mode_str}, {len(sim_bytes)} bytes)")
    except Exception as e:
        print(f"Error: Failed to prepare simulator input: {e}")
        sys.exit(1)

    # 0. Extract Image Size from minrt.ml
    minrt_ml_path = os.path.join(project_root, "test/minrt.ml")
    image_size_str = "Unknown"
    
    if os.path.exists(minrt_ml_path):
        try:
            with open(minrt_ml_path, "r") as f:
                content = f.read()
                match = re.search(r"let\s+_\s+=\s+rt\s+(\d+)\s+(\d+)", content)
                if match:
                    w = match.group(1)
                    h = match.group(2)
                    image_size_str = f"{w}x{h}"
        except Exception as e:
            print(f"Warning: Failed to read test/minrt.ml: {e}")
    else:
        print(f"Warning: test/minrt.ml not found")
    
    print(f"Target Image Size: {image_size_str}")

    start_time = time.time()
    
    if mode == 1:
        # v1: Compiled by mincaml -> Assembled by tkasm
        print("Step 1 (v1): Compiling minrt with mincaml...")
        try:
            subprocess.run(["dune", "exec", "mincaml", "test/minrt"], check=True)
        except subprocess.CalledProcessError:
            print("Error: Failed to run mincaml.")
            sys.exit(1)
            
        print("Step 2 (v1): Assembling with tkasm...")
        tkasm_path = os.path.join(project_root, "../bill_sim/tkasm")
        try:
            subprocess.run([tkasm_path, "test/minrt.s", "-o", "test/minrt.bin"], check=True)
        except subprocess.CalledProcessError:
            print("Error: Failed to assemble minrt.s.")
            sys.exit(1)

    else:
        # v2: Compiled by mincaml --virtual -> Backend -> Assembled by tkasm (or Backend emits bin directly? No, Backend emits asm)
        # Backend generates 'minrt_colored.s'.
        # We assume Backend is built.
        print("Step 1 (v2): Compiling minrt with mincaml --virtual...")
        try:
            subprocess.run(["dune", "exec", "mincaml", "--", "-virtual", "test/minrt"], check=True)
        except subprocess.CalledProcessError:
            print("Error: Failed to run mincaml --virtual.")
            sys.exit(1)

        print("Step 2 (v2): Running Backend...")
        backend_dir = os.path.join(project_root, "Backend")
        try:
            # Run Backend
            # It expects run from its dir or needs path adj.
            # Let's run from Backend dir to be safe with file paths?
            # Or pass absolute path.
            # Backend output is 'minrt_colored.s' in backend dir usually.
            # We'll run cargo run.
            subprocess.run(
                ["cargo", "run", "--release", "--", "../test/minrt.s"], 
                cwd=backend_dir, 
                check=True
            )
        except subprocess.CalledProcessError:
            print("Error: Failed to run Rust Backend.")
            sys.exit(1)
            
        # Assemble minrt_colored.s
        print("Step 2.5 (v2): Assembling Backend output...")
        tkasm_path = os.path.join(project_root, "../bill_sim/tkasm")
        colored_asm = os.path.join(backend_dir, "minrt_colored.s")
        if not os.path.exists(colored_asm):
             print(f"Error: {colored_asm} not found.")
             sys.exit(1)
             
        try:
            subprocess.run([tkasm_path, colored_asm, "-o", "test/minrt.bin"], check=True)
        except subprocess.CalledProcessError:
             print("Error: Failed to assemble minrt_colored.s")
             sys.exit(1)

    compile_time = time.time() - start_time
    print(f"  Compile time: {compile_time:.3f}s")

    # Determine assembly file for symbol lookup
    if mode == 1:
        asm_file_for_symbols = os.path.join(project_root, "test/minrt.s")
    else:
        asm_file_for_symbols = os.path.join(project_root, "Backend/minrt_colored.s")

    # 3. Run simulation
    print("Step 3: Running simulation...")
    sim_path = os.path.join(project_root, "../bill_sim/sim")
    sim_start_time = time.time()
    no_timelimit = args.no_timelimit or args.no_option == "timelimit"
    sim_timeout = None if no_timelimit else args.timelimit
    timed_out = False

    sim_cmd = [sim_path, "test/minrt.bin", "--headless"]
    if os.path.exists(asm_file_for_symbols):
        sim_cmd += ["--symfile", asm_file_for_symbols]

    import signal as _signal
    proc = subprocess.Popen(sim_cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)
    try:
        stdout_data, stderr_data = proc.communicate(timeout=sim_timeout)
        if proc.returncode != 0:
            print("Error: Simulation failed.")
            print(stderr_data)
            sys.exit(1)
        whole_output = stdout_data
    except subprocess.TimeoutExpired:
        timed_out = True
        print(f"Warning: Simulation timed out after {sim_timeout:.1f}s — sending SIGINT to collect partial stats...")
        try:
            proc.send_signal(_signal.SIGINT)
        except Exception:
            pass
        try:
            stdout_data, stderr_data = proc.communicate(timeout=10)
        except subprocess.TimeoutExpired:
            proc.kill()
            stdout_data, stderr_data = proc.communicate()
        whole_output = stdout_data

    sim_time = time.time() - sim_start_time
    print(f"  Sim time: {sim_time:.3f}s" + (" [TIMED OUT]" if timed_out else ""))

    # Parse profiling stats
    profile = parse_profile_stats(whole_output)
    if profile["mem_access_rate"] is not None:
        print(f"  MemAccess: {profile['mem_access_count']} ops "
              f"({profile['mem_access_rate']:.2f}% of instructions)")
    
    # 4 & 5. Parse Output
    headless_marker = "Headless finished."
    main_output = whole_output.split(headless_marker)[0] if headless_marker in whole_output else whole_output

    match = re.search(r"Cycles:\s*(\d+)", whole_output)
    cycles = match.group(1) if match else "Unknown"

    # If timed out, show partial profile stats and write to history, then exit
    if timed_out:
        print(f"\n[TIMED OUT] Partial stats after {sim_timeout:.1f}s:")
        print(f"  Cycles so far: {cycles}")
        if profile["top_functions"]:
            total_calls = sum(c for _, c, _ in profile["top_functions"])
            print("\nTop Called Functions (partial):")
            for rank, (addr, calls, name) in enumerate(profile["top_functions"][:10], 1):
                pct = (calls / total_calls * 100.0) if total_calls > 0 else 0.0
                label = f"  {name}" if name else ""
                print(f"  #{rank:2d}  {addr}  {calls:>12,} calls  ({pct:5.1f}%){label}")
        else:
            print("  (no profile data available)")
        if profile["opcode_counts"]:
            print("\nTop Opcode Rates (partial):")
            print(format_top_opcode_rates(profile["opcode_counts"], top_n=15, per_line=5))

        # Write to history
        history_path = os.path.join(script_dir, "History.txt")
        timestamp = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        mem_rate_str = (f"{profile['mem_access_rate']:.2f}%"
                        if profile["mem_access_rate"] is not None else "N/A")
        top_funcs_str = ""
        if profile["top_functions"]:
            total_calls = sum(c for _, c, _ in profile["top_functions"])
            lines = []
            for rank, (addr, calls, name) in enumerate(profile["top_functions"][:5], 1):
                pct = (calls / total_calls * 100.0) if total_calls > 0 else 0.0
                lbl = f" {name}" if name else ""
                lines.append(f"    #{rank} {addr}{lbl}: {calls:,} ({pct:.1f}%)")
            top_funcs_str = "TopFuncs:\n" + "\n".join(lines) + "\n"
        top_opcodes_str = ""
        if profile["opcode_counts"]:
            compact = format_top_opcode_rates(profile["opcode_counts"], top_n=15, per_line=5)
            if compact:
                top_opcodes_str = "TopOpcodeRates:\n" + compact + "\n"
        formatted_log = (
            f"{timestamp} | Mode: v{mode} | "
            f"Size: {image_size_str} | "
            f"Cycles: {cycles} [TIMED OUT after {sim_timeout:.0f}s]\n"
            f"Accuracy: N/A | "
            f"MemAccessRate: {mem_rate_str} | "
            f"Compile: {compile_time:.3f}s | "
            f"Sim: {sim_time:.3f}s\n"
            f"{top_funcs_str}"
            f"{top_opcodes_str}"
            f"Comment: \n"
            f"================================================\n"
        )
        print(formatted_log)
        with open(history_path, "a") as f:
            f.write(formatted_log)
        sys.exit(1)


    print("Step 6: Running OCaml reference implementation...")
    ocaml_input_path = input_source_path
    if not _looks_like_text_input(source_bytes):
        ocaml_input_path = os.path.abspath(os.path.join(project_root, args.ocaml_input_source))

    if not os.path.exists(ocaml_input_path):
        print(f"Error: OCaml input not found at {ocaml_input_path}")
        sys.exit(1)

    try:
        with open(ocaml_input_path, "rb") as f:
            ocaml_input_bytes = f.read()
    except Exception as e:
        print(f"Error: Failed to read OCaml input: {e}")
        sys.exit(1)

    if not _looks_like_text_input(ocaml_input_bytes):
        print(
            f"Error: OCaml input must be text token stream, but got binary-like file: {ocaml_input_path}"
        )
        sys.exit(1)

    try:
        with open(ocaml_input_path, "rb") as infile:
             ocaml_result = subprocess.run(
                ["ocaml", "test/minrt_for_ocaml.ml"],
                stdin=infile,
                capture_output=True,
                text=True,
                check=True
             )
             ocaml_output = ocaml_result.stdout
    except subprocess.CalledProcessError as e:
         print("Error: OCaml failed.")
         print(e.stderr)
         sys.exit(1)

    # 6.5 Save images
    print("Step 6.5: Saving PPM/PNG outputs...")
    output_ppm_path = os.path.join(script_dir, "output.ppm")
    output_png_path = os.path.join(script_dir, "output.png")
    output_ocaml_ppm_path = os.path.join(script_dir, "output_ocaml.ppm")
    output_ocaml_png_path = os.path.join(script_dir, "output_ocaml.png")
    save_image_pair(main_output, output_ppm_path, output_png_path, "sim")
    save_image_pair(ocaml_output, output_ocaml_ppm_path, output_ocaml_png_path, "ocaml")
         
    # 7. Compare
    print("Step 7: Comparing outputs...")
    
    # Parse and compare pixels (integers)
    main_tokens = main_output.split()
    ocaml_tokens = ocaml_output.split()
    
    # Skip Header (P3 w h max) - 4 tokens
    if len(main_tokens) < 4 or len(ocaml_tokens) < 4:
         print("Error: Output too short.")
         accuracy = 0.0
         num_pixels = 0
         match_count = 0
    else:
         # Compare pixels
         start_idx = 4
         main_pixels = main_tokens[start_idx:]
         ocaml_pixels = ocaml_tokens[start_idx:]
         
         # 分母はOCamlの総ピクセル数にする
         ocaml_total_pixels = len(ocaml_pixels) // 3
         comparable_pixels = min(len(main_pixels), len(ocaml_pixels)) // 3
         num_pixels = ocaml_total_pixels
         match_count = 0
         
         for i in range(comparable_pixels):
             idx = i * 3
             if (int(main_pixels[idx]) == int(ocaml_pixels[idx]) and 
                 int(main_pixels[idx+1]) == int(ocaml_pixels[idx+1]) and 
                 int(main_pixels[idx+2]) == int(ocaml_pixels[idx+2])):
                 match_count += 1
         
         if num_pixels > 0:
             accuracy = (match_count / num_pixels) * 100.0
         else:
             accuracy = 0.0
             
    print(f"Result: {accuracy:.2f}% ({match_count}/{num_pixels} pixels)")

    # Show top functions
    if profile["top_functions"]:
        print("\nTop Called Functions:")
        total_calls = sum(c for _, c, _ in profile["top_functions"])
        for rank, (addr, calls, name) in enumerate(profile["top_functions"][:10], 1):
            pct = (calls / total_calls * 100.0) if total_calls > 0 else 0.0
            label = f"  {name}" if name else ""
            print(f"  #{rank:2d}  {addr}  {calls:>12,} calls  ({pct:5.1f}%){label}")
    if profile["opcode_counts"]:
        print("\nTop Opcode Rates:")
        print(format_top_opcode_rates(profile["opcode_counts"], top_n=15, per_line=5))
    
    if accuracy < 100.0:
        print("  Differences found. Saving logs...")
        with open(os.path.join(script_dir, "diff_main.txt"), "w") as f: f.write(main_output)
        with open(os.path.join(script_dir, "diff_ocaml.txt"), "w") as f: f.write(ocaml_output)

    # 8. History
    print("Step 8: Updating History.txt...")
    history_path = os.path.join(script_dir, "History.txt")
    timestamp = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    mode_str = f"v{mode}"

    mem_rate_str = (f"{profile['mem_access_rate']:.2f}%"
                    if profile["mem_access_rate"] is not None else "N/A")

    top_funcs_str = ""
    if profile["top_functions"]:
        total_calls = sum(c for _, c, _ in profile["top_functions"])
        lines = []
        for rank, (addr, calls, name) in enumerate(profile["top_functions"][:5], 1):
            pct = (calls / total_calls * 100.0) if total_calls > 0 else 0.0
            label = f" {name}" if name else ""
            lines.append(f"    #{rank} {addr}{label}: {calls:,} ({pct:.1f}%)")
        top_funcs_str = "TopFuncs:\n" + "\n".join(lines) + "\n"
    top_opcodes_str = ""
    if profile["opcode_counts"]:
        compact = format_top_opcode_rates(profile["opcode_counts"], top_n=15, per_line=5)
        if compact:
            top_opcodes_str = "TopOpcodeRates:\n" + compact + "\n"

    formatted_log = (
        f"{timestamp} | Mode: {mode_str} | "
        f"Size: {image_size_str} | "
        f"Cycles: {str(cycles)} \n"
        f"Accuracy: {accuracy:.2f}% | "
        f"MemAccessRate: {mem_rate_str} | "
        f"Compile: {compile_time:.3f}s | "
        f"Sim: {sim_time:.3f}s\n"
        f"{top_funcs_str}"
        f"{top_opcodes_str}"
        f"Comment: \n"
        f"================================================\n"
    )
    
    print(formatted_log)
    with open(history_path, "a") as f:
        f.write(formatted_log)

if __name__ == "__main__":
    main()
