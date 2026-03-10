#include <algorithm>
#include <cmath>
#include <csignal>
#include <cstdint>
#include <cstdlib>
#include <cstring>
#include <fstream>
#include <iomanip>
#include <iostream>
#include <map>
#include <sstream>
#include <string>
#include <vector>

#include "tui.h"

using namespace std;

// --- Architecture State ---
uint32_t x_reg[32];
float f_reg[32];
uint32_t pc = 0;
// Simple memory model: Flat 64MB buffer + I/O interception
const size_t MEM_SIZE = 128 * 1024 * 1024;
vector<uint8_t> memory(MEM_SIZE, 0);
vector<uint8_t> output_buffer;
// I/O Address
const uint32_t IO_ADDR = 0xf0000000;

// Input Buffer
vector<uint8_t> input_buffer;
size_t input_cursor = 0;

bool headless = false;

// Internal representation of an instruction
enum Opcode {
  ADD,
  SUB,
  TERN,
  MUL,
  DIV,
  REM,
  ADDI,
  SUBI,
  MULI,
  DIVI,
  REMI,
  SAR,
  FTERN,
  SARI,
  SLL,
  SLLI,
  SLR,
  SLRI,
  ADD4,
  ANDI,
  OR,
  ORI,
  XOR,
  XORI,
  CLT,
  CLTI,
  CLEQ,
  CLEQI,
  CEQ,
  CEQI,
  JEQ,
  GOTO,
  JMP,
  JLT,
  JLEQ,
  LB,
  SB,
  LW,
  SW,
  LF,
  SF, // Float load/store
  MOVI,
  MOVUI,
  FADD,
  FSUB,
  FMUL,
  FDIV,
  FNEG,
  FFLOOR,
  FMA, // FPU
  MIF,
  MFI, // Bitwise moves
  FINV,
  FSQRT,
  FRSQRT,
  FABS,
  FTOI,
  ITOF,
  FEQ,
  FLEQ,
  FLT,
  NOP,
  EXIT,
  QUIT, // New instruction
  UNKNOWN
};

struct Instruction {
  Opcode op = UNKNOWN;
  int rd = 0;
  int rs1 = 0;
  int rs2 = 0;
  int rs3 = 0; // For FMA if needed
  int32_t imm = 0;
  string original_line;
  int line_num = 0;
  bool is_float = false;
};

vector<Instruction> instructions;
map<uint32_t, int> pc_to_inst_index;
map<string, uint32_t> labels;
map<int, uint32_t> inst_index_to_pc;
map<uint32_t, string> symbols; // pc -> label name (loaded from .s file)

// SIGINT flag: set by signal handler, checked in headless loop
volatile sig_atomic_t g_interrupted = 0;
static void sigint_handler(int) { g_interrupted = 1; }

// Breakpoints
map<uint32_t, bool> breakpoints;

// Undo System
struct UndoAction {
  enum Type { REG, MEM, PC } type;
  uint32_t index;
  uint32_t value;
};
struct UndoStep {
  uint32_t pc;
  vector<UndoAction> actions;
};
vector<UndoStep> undo_stack;

// Profiling
struct {
  uint64_t inst_count = 0;
  uint64_t branch_taken = 0;
  uint64_t branch_total = 0;
  uint64_t mem_access_count = 0;
  map<uint32_t, uint64_t> func_call_count; // target_pc -> call count
  map<uint32_t, uint64_t> jmp_target_count; // target_pc -> executed jmp count
} stats;

void record_reg_change(int reg, uint32_t old_val) {
  if (undo_stack.empty())
    return;
  undo_stack.back().actions.push_back(
      {UndoAction::REG, (uint32_t)reg, old_val});
}

void record_mem_change(uint32_t addr, uint8_t old_val) {
  if (undo_stack.empty())
    return;
  undo_stack.back().actions.push_back(
      {UndoAction::MEM, addr, (uint32_t)old_val});
}

// --- Parsing Helpers ---

string get_reg_name(int r) { return "x" + to_string(r); }

string get_freg_name(int r) { return "f" + to_string(r); }

uint32_t float_as_int(float f) {
  uint32_t u;
  memcpy(&u, &f, sizeof(float));
  return u;
}

float int_as_float(uint32_t u) {
  float f;
  memcpy(&f, &u, sizeof(float));
  return f;
}

// --- Loading & Parsing ---

// Load symbol names from a .s assembly file.
// Heuristic: labels at non-indented lines with trailing ':' record the current
// PC. 'set_label' pseudo-instructions count as 2 instructions; all other
// non-directive, non-empty, non-label lines count as 1.
void load_symbols(const string &filename) {
  ifstream f(filename);
  if (!f.is_open())
    return;
  uint32_t cur_pc = 0;
  string line;
  while (getline(f, line)) {
    // Trim trailing whitespace
    while (!line.empty() && (line.back() == '\r' || line.back() == ' '))
      line.pop_back();
    if (line.empty())
      continue;
    // Directive (.text, .data, .align, .global, ...)
    if (line[0] == '.') {
      continue;
    }
    // Comment
    if (line[0] == '#' || line[0] == ';')
      continue;
    // Label (no leading whitespace, ends with ':')
    if (!isspace((unsigned char)line[0])) {
      size_t colon = line.find(':');
      if (colon != string::npos) {
        string label = line.substr(0, colon);
        // Strip any trailing whitespace from label
        while (!label.empty() && isspace((unsigned char)label.back()))
          label.pop_back();
        if (!label.empty())
          symbols[cur_pc] = label;
        // Rest of line after ':' might be an instruction – handle below
        // For simplicity, treat the rest as separate (next loop iteration)
      }
      continue;
    }
    // Instruction line (leading whitespace)
    // Check for set_label pseudo (expands to 2 instructions: movui + ori)
    size_t first = line.find_first_not_of(" \t");
    if (first != string::npos) {
      string trimmed = line.substr(first);
      if (trimmed.rfind("set_label", 0) == 0) {
        cur_pc += 8; // 2 instructions
        continue;
      }
    }
    cur_pc += 4;
  }
}

void load_binary(const string &filename) {
  ifstream file(filename, ios::binary);
  if (!file.is_open()) {
    cerr << "Failed to open file: " << filename << endl;
    exit(1);
  }

  file.seekg(0, ios::end);
  size_t size = file.tellg();
  file.seekg(0, ios::beg);

  vector<uint32_t> words(size / 4);
  file.read((char *)words.data(), size);

  uint32_t current_pc = 0;

  for (uint32_t w : words) {
    Instruction inst;
    inst.line_num = current_pc / 4 + 1;

    int opcode = w & 0x1FF;
    int rd = 0, rs1 = 0, rs2 = 0;
    int32_t imm = 0;
    bool is_imm = (w >> 24) & 1;

    // Check for MOVI/MOVUI (ends in 1101)
    int fmt = (w >> 30) & 0x3; // Top 2 bits: 00=Int, 01=DstInt/SrcFloat,
                               // 10=DstFloat/SrcInt, 11=DstFloat/SrcFloat

    if (opcode == 0xFF) {
      inst.op = QUIT;
      inst.original_line = "quit";
    } else if ((w & 0x1F) == 0x11) {
      int imm0 = (w >> 5) & 1;
      int imm12_1 = (w >> 7) & 0xFFF;
      int imm19_13 = (w >> 25) & 0x7F;
      imm = (imm19_13 << 13) | (imm12_1 << 1) | imm0;
      inst.op = GOTO;
      inst.imm = imm & 0xFFFFF;
      inst.original_line = "goto " + to_string(inst.imm);
    } else if ((w & 0x1F) == 0xD || (w & 0x1F) == 0x1D) {
      int imm0 = (w >> 5) & 1;
      int imm12_1 = (w >> 7) & 0xFFF;
      rd = (w >> 19) & 0x1F;
      int imm19_13 = (w >> 25) & 0x7F;
      imm = (imm19_13 << 13) | (imm12_1 << 1) | imm0;
      if (imm & 0x80000)
        imm |= 0xFFF00000;

      inst.rd = rd;
      inst.imm = imm;

      if ((w >> 4) & 1) { // 11101
        inst.op = MOVUI;
        inst.original_line =
            "movui " + get_reg_name(rd) + ", " + to_string(imm);
      } else { // 01101
        inst.op = MOVI;
        inst.original_line = "movi " + get_reg_name(rd) + ", " + to_string(imm);
      }
    } else if (opcode == 0x60) { // JMP
      inst.op = JMP;
      inst.rd = (w >> 19) & 0x1F;
      inst.rs1 = (w >> 14) & 0x1F;
      int imm11_5 = (w >> 25) & 0x7F;
      int imm4_0 = (w >> 9) & 0x1F;
      imm = (imm11_5 << 5) | imm4_0;
      if (imm & 0x800)
        imm |= 0xFFFFF000;
      inst.imm = imm;
      inst.original_line = "jmp " + get_reg_name(inst.rd) + ", " +
                           to_string(imm) + "(" + get_reg_name(inst.rs1) + ")";
    } else if (opcode == 0x29 || opcode == 0x39 || opcode == 0x35) {
      // Branch Instructions (JEQ, JLT, JLEQ)
      if (opcode == 0x29) {
        inst.op = JEQ;
        inst.original_line = "jeq";
      } else if (opcode == 0x39) {
        inst.op = JLT;
        inst.original_line = "jlt";
      } else {
        inst.op = JLEQ;
        inst.original_line = "jleq";
      }

      inst.rs2 = (w >> 9) & 0x1F;
      inst.rs1 = (w >> 14) & 0x1F;
      int imm11_5 = (w >> 25) & 0x7F;
      int imm4_0 = (w >> 19) & 0x1F;
      // imm12 is unsigned for branch instructions: [0, 4096)
      imm = (imm11_5 << 5) | imm4_0;
      inst.imm = imm;

      inst.original_line += " " + get_reg_name(inst.rs1) + ", " +
                            get_reg_name(inst.rs2) + ", " + to_string(inst.imm);
    } else if (opcode == 0x9B || opcode == 0x19B) {
      if (opcode == 0x9B) {
        inst.op = SB;
        inst.original_line = "sb";
      } else {
        inst.op = SW;
        inst.original_line = "sw";
      }

      inst.rs2 = (w >> 9) & 0x1F;
      inst.rs1 = (w >> 14) & 0x1F;
      int imm11_5 = (w >> 25) & 0x7F;
      int imm4_0 = (w >> 19) & 0x1F;
      imm = (imm11_5 << 5) | imm4_0;
      if (imm & 0x800)
        imm |= 0xFFFFF000;
      inst.imm = imm;

      inst.original_line += " " + get_reg_name(inst.rs2) + ", " +
                            to_string(inst.imm) + "(" + get_reg_name(inst.rs1) +
                            ")";
    } else if (opcode == 0x19F) {
      inst.op = SF;
      inst.original_line = "sf";
      inst.rs2 = (w >> 9) & 0x1F;
      inst.rs1 = (w >> 14) & 0x1F;
      int imm11_5 = (w >> 25) & 0x7F;
      int imm4_0 = (w >> 19) & 0x1F;
      imm = (imm11_5 << 5) | imm4_0;
      if (imm & 0x800)
        imm |= 0xFFFFF000;
      inst.imm = imm;

      inst.original_line += " " + get_freg_name(inst.rs2) + ", " +
                            to_string(inst.imm) + "(" + get_reg_name(inst.rs1) +
                            ")";
    } else {
      // General Format Parsing
      inst.rd = (w >> 19) & 0x1F;
      inst.rs1 = (w >> 14) & 0x1F;
      inst.rs2 = (w >> 9) & 0x1F;
      inst.rs3 = (w >> 25) & 0x1F;

      // Immediate Parsing (DSI)
      int imm11_5 = (w >> 25) & 0x7F;
      int imm4_0 = (w >> 9) & 0x1F;
      imm = (imm11_5 << 5) | imm4_0;

      // Sign Extension for Immediates
      bool is_logic = (opcode == 0x47 || opcode == 0x48 || opcode == 0x4F);
      if (is_imm && !is_logic && (imm & 0x800))
        imm |= 0xFFFFF000;
      inst.imm = imm;

      switch (opcode) {
      // Arithmetic
      case 0x41:
        if (is_imm) {
          inst.op = ADDI;
          inst.original_line = "addi " + get_reg_name(inst.rd) + ", " +
                               get_reg_name(inst.rs1) + ", " +
                               to_string(inst.imm);
        } else if (fmt == 3) {
          inst.op = FADD;
          inst.is_float = true;
          inst.original_line = "fadd " + get_freg_name(inst.rd) + ", " +
                               get_freg_name(inst.rs1) + ", " +
                               get_freg_name(inst.rs2);
        } else if (fmt == 2) {
          inst.op = MIF;
          inst.is_float = true;
          inst.original_line =
              "mif " + get_freg_name(inst.rd) + ", " + get_reg_name(inst.rs1);
        } else if (fmt == 1) {
          inst.op = MFI;
          inst.is_float = true;
          inst.original_line =
              "mfi " + get_reg_name(inst.rd) + ", " + get_freg_name(inst.rs1);
        } else {
          inst.op = ADD;
          inst.original_line = "add " + get_reg_name(inst.rd) + ", " +
                               get_reg_name(inst.rs1) + ", " +
                               get_reg_name(inst.rs2);
        }
        break;
      case 0x42:
        if (is_imm) {
          inst.op = SUBI;
          inst.original_line = "subi " + get_reg_name(inst.rd) + ", " +
                               get_reg_name(inst.rs1) + ", " +
                               to_string(inst.imm);
        } else if (fmt == 3) {
          inst.op = FSUB;
          inst.is_float = true;
          inst.original_line = "fsub " + get_freg_name(inst.rd) + ", " +
                               get_freg_name(inst.rs1) + ", " +
                               get_freg_name(inst.rs2);
        } else {
          inst.op = SUB;
          inst.original_line = "sub " + get_reg_name(inst.rd) + ", " +
                               get_reg_name(inst.rs1) + ", " +
                               get_reg_name(inst.rs2);
        }
        break;
      case 0x43:
        if (fmt == 3 && !is_imm) {
          inst.op = FMUL;
          inst.is_float = true;
          inst.original_line = "fmul " + get_freg_name(inst.rd) + ", " +
                               get_freg_name(inst.rs1) + ", " +
                               get_freg_name(inst.rs2);
        } else if (fmt == 0 && !is_imm) {
          inst.op = TERN;
          inst.original_line = "tern " + get_reg_name(inst.rd) + ", " +
                               get_reg_name(inst.rs1) + ", " +
                               get_reg_name(inst.rs2) + ", " +
                               get_reg_name(inst.rs3);
        } else {
          inst.op = UNKNOWN;
          inst.original_line = "unknown 67";
        }
        break;
      case 0x44:
        if (is_imm) {
          inst.op = DIVI;
          inst.original_line = "divi " + get_reg_name(inst.rd) + ", " +
                               get_reg_name(inst.rs1) + ", " +
                               to_string(inst.imm);
        } else if (fmt == 3) {
          // Check for FINV (rs2 == 0)
          if (inst.rs2 == 0) {
            inst.op = FINV;
            inst.is_float = true;
            inst.original_line = "finv " + get_freg_name(inst.rd) + ", " +
                                 get_freg_name(inst.rs1);
          } else {
            inst.op = FDIV;
            inst.is_float = true;
            inst.original_line = "fdiv " + get_freg_name(inst.rd) + ", " +
                                 get_freg_name(inst.rs1) + ", " +
                                 get_freg_name(inst.rs2);
          }
        } else {
          inst.op = DIV;
          inst.original_line = "div " + get_reg_name(inst.rd) + ", " +
                               get_reg_name(inst.rs1) + ", " +
                               get_reg_name(inst.rs2);
        }
        break;
      case 0x45:
        if (is_imm) {
          inst.op = REMI;
          inst.original_line = "remi " + get_reg_name(inst.rd) + ", " +
                               get_reg_name(inst.rs1) + ", " +
                               to_string(inst.imm);
        } else if (fmt == 3) {
          inst.op = FNEG;
          inst.is_float = true;
          inst.original_line =
              "fneg " + get_freg_name(inst.rd) + ", " + get_freg_name(inst.rs1);
        } else {
          inst.op = REM;
          inst.original_line = "rem " + get_reg_name(inst.rd) + ", " +
                               get_reg_name(inst.rs1) + ", " +
                               get_reg_name(inst.rs2);
        }
        break;

      // Shifts
      case 0x50:
        if (!is_imm && fmt == 3) {
          inst.op = FTERN;
          inst.is_float = true;
          inst.original_line = "ftern " + get_freg_name(inst.rd) + ", " +
                               get_freg_name(inst.rs1) + ", " +
                               get_freg_name(inst.rs2) + ", " +
                               get_freg_name(inst.rs3);
        } else if (is_imm) {
          inst.op = SARI;
          inst.original_line = "sari " + get_reg_name(inst.rd) + ", " +
                               get_reg_name(inst.rs1) + ", " +
                               to_string(inst.imm);
        } else {
          inst.op = SAR;
          inst.original_line = "sar " + get_reg_name(inst.rd) + ", " +
                               get_reg_name(inst.rs1) + ", " +
                               get_reg_name(inst.rs2);
        }
        break;
      case 0x53:
        if (is_imm) {
          inst.op = SLLI;
          inst.original_line = "slli " + get_reg_name(inst.rd) + ", " +
                               get_reg_name(inst.rs1) + ", " +
                               to_string(inst.imm);
        } else {
          inst.op = SLL;
          inst.original_line = "sll " + get_reg_name(inst.rd) + ", " +
                               get_reg_name(inst.rs1) + ", " +
                               get_reg_name(inst.rs2);
        }
        break;
      case 0x54:
        if (is_imm) {
          inst.op = SLRI;
          inst.original_line = "slri " + get_reg_name(inst.rd) + ", " +
                               get_reg_name(inst.rs1) + ", " +
                               to_string(inst.imm);
        } else {
          inst.op = SLR;
          inst.original_line = "slr " + get_reg_name(inst.rd) + ", " +
                               get_reg_name(inst.rs1) + ", " +
                               get_reg_name(inst.rs2);
        }
        break;

      // Logical / Collision
      case 0x47:
        if (is_imm) {
          inst.op = ANDI;
          inst.original_line = "andi " + get_reg_name(inst.rd) + ", " +
                               get_reg_name(inst.rs1) + ", " +
                               to_string(inst.imm);
        } else if (fmt == 3) {
          inst.op = FRSQRT;
          inst.is_float = true;
          inst.original_line = "frsqrt " + get_freg_name(inst.rd) + ", " +
                               get_freg_name(inst.rs1);
        } else {
          inst.op = ADD4;
          inst.original_line = "add4 " + get_reg_name(inst.rd) + ", " +
                               get_reg_name(inst.rs1) + ", " +
                               get_reg_name(inst.rs2);
        }
        break;
      case 0x48:
        if (is_imm) {
          inst.op = ORI;
          inst.original_line = "ori " + get_reg_name(inst.rd) + ", " +
                               get_reg_name(inst.rs1) + ", " +
                               to_string(inst.imm);
        } else if (fmt == 1) {
          inst.op = FTOI;
          inst.is_float = true; // DstInt, SrcFloat
          inst.original_line =
              "ftoi " + get_reg_name(inst.rd) + ", " + get_freg_name(inst.rs1);
        } else {
          inst.op = OR;
          inst.original_line = "or " + get_reg_name(inst.rd) + ", " +
                               get_reg_name(inst.rs1) + ", " +
                               get_reg_name(inst.rs2);
        }
        break;
      case 0x4C:
        inst.op = FABS;
        inst.is_float = true;
        inst.original_line =
            "fabs " + get_freg_name(inst.rd) + ", " + get_freg_name(inst.rs1);
        break;

      case 0x4F:
        if (is_imm) {
          inst.op = XORI;
          inst.original_line = "xori " + get_reg_name(inst.rd) + ", " +
                               get_reg_name(inst.rs1) + ", " +
                               to_string(inst.imm);
        } else {
          inst.op = XOR;
          inst.original_line = "xor " + get_reg_name(inst.rd) + ", " +
                               get_reg_name(inst.rs1) + ", " +
                               get_reg_name(inst.rs2);
        }
        break;

      // Comparisons / Float
      case 0x46:
        if (is_imm) {
          inst.op = CLTI;
          inst.original_line = "clti " + get_reg_name(inst.rd) + ", " +
                               get_reg_name(inst.rs1) + ", " +
                               to_string(inst.imm);
        } else if (fmt == 1) {
          inst.op = FLT;
          inst.is_float = true;
          inst.original_line = "flt " + get_reg_name(inst.rd) + ", " +
                               get_freg_name(inst.rs1) + ", " +
                               get_freg_name(inst.rs2);
        } else {
          inst.op = CLT;
          inst.original_line = "clt " + get_reg_name(inst.rd) + ", " +
                               get_reg_name(inst.rs1) + ", " +
                               get_reg_name(inst.rs2);
        }
        break;
      case 0x4E:
        if (is_imm) {
          inst.op = CEQI;
          inst.original_line = "ceqi " + get_reg_name(inst.rd) + ", " +
                               get_reg_name(inst.rs1) + ", " +
                               to_string(inst.imm);
        } else if (fmt == 1) {
          inst.op = FEQ;
          inst.is_float = true;
          inst.original_line = "feq " + get_reg_name(inst.rd) + ", " +
                               get_freg_name(inst.rs1) + ", " +
                               get_freg_name(inst.rs2);
        } else {
          inst.op = CEQ;
          inst.original_line = "ceq " + get_reg_name(inst.rd) + ", " +
                               get_reg_name(inst.rs1) + ", " +
                               get_reg_name(inst.rs2);
        }
        break;
      case 0x4A:
        if (is_imm) {
          inst.op = CLEQI;
          inst.original_line = "cleqi " + get_reg_name(inst.rd) + ", " +
                               get_reg_name(inst.rs1) + ", " +
                               to_string(inst.imm);
        } else if (fmt == 3) {
          inst.op = FSQRT;
          inst.is_float = true;
          inst.original_line =
              "sqrt " + get_freg_name(inst.rd) + ", " + get_freg_name(inst.rs1);
        } else if (fmt == 1) {
          inst.op = FLEQ;
          inst.is_float = true;
          inst.original_line = "fleq " + get_reg_name(inst.rd) + ", " +
                               get_freg_name(inst.rs1) + ", " +
                               get_freg_name(inst.rs2);
        } else {
          inst.op = CLEQ;
          inst.original_line = "cleq " + get_reg_name(inst.rd) + ", " +
                               get_reg_name(inst.rs1) + ", " +
                               get_reg_name(inst.rs2);
        }
        break;

      case 0x49:
        if (fmt == 2) {
          inst.op = ITOF;
          inst.is_float = true;
          inst.original_line =
              "itof " + get_freg_name(inst.rd) + ", " + get_reg_name(inst.rs1);
        }
        break;
      case 0x4B:
        if (fmt == 3) {
          inst.op = FFLOOR;
          inst.is_float = true;
          inst.original_line = "ffloor " + get_freg_name(inst.rd) + ", " +
                               get_freg_name(inst.rs1);
        }
        break;

      case 0x86:
        if (fmt == 3) {
          inst.op = FMA;
          inst.rs3 = (w >> 25) & 0x1F; // bits[29:25]
          inst.is_float = true;
          inst.original_line = "fma " + get_freg_name(inst.rd) + ", " +
                               get_freg_name(inst.rs1) + ", " +
                               get_freg_name(inst.rs2) + ", " +
                               get_freg_name(inst.rs3);
        }
        break;

      // Load/Store
      case 0x19B:
        inst.op = SW;
        inst.original_line = "sw " + get_reg_name(inst.rs2) + ", " +
                             to_string(inst.imm) + "(" +
                             get_reg_name(inst.rs1) + ")";
        break;
      case 0x15B:
        inst.op = LW;
        inst.original_line = "lw " + get_reg_name(inst.rd) + ", " +
                             to_string(inst.imm) + "(" +
                             get_reg_name(inst.rs1) + ")";
        break;

      case 0x15f:
        inst.op = LF;
        inst.original_line = "lf " + get_freg_name(inst.rd) + ", " +
                             to_string(inst.imm) + "(" +
                             get_reg_name(inst.rs1) + ")";
        break;
      case 0x5B:
        inst.op = LB;
        inst.original_line = "lb " + get_reg_name(inst.rd) + ", " +
                             to_string(inst.imm) + "(" +
                             get_reg_name(inst.rs1) + ")";
        break;
      case 0x9B:
        inst.op = SB;
        inst.original_line = "sb " + get_reg_name(inst.rs2) + ", " +
                             to_string(inst.imm) + "(" +
                             get_reg_name(inst.rs1) + ")";
        break;

      default:
        inst.op = UNKNOWN;
        inst.original_line = "unknown " + to_string(opcode);
        break;
      }
    }

    // Memory Copy
    if (current_pc < MEM_SIZE - 3) {
      memory[current_pc] = w & 0xFF;
      memory[current_pc + 1] = (w >> 8) & 0xFF;
      memory[current_pc + 2] = (w >> 16) & 0xFF;
      memory[current_pc + 3] = (w >> 24) & 0xFF;
    }

    pc_to_inst_index[current_pc] = instructions.size();
    inst_index_to_pc[instructions.size()] = current_pc;
    instructions.push_back(inst);
    current_pc += 4;
  }
}

void exec_one_step(bool running) {
  if (pc >= (uint32_t)instructions.size() * 4)
    return;
  if (pc_to_inst_index.find(pc) == pc_to_inst_index.end())
    return;

  // Start Undo Step
  UndoStep undo;
  undo.pc = pc;
  if (!running)
    undo_stack.push_back(undo);

  int idx = pc_to_inst_index[pc];
  const Instruction &inst = instructions[idx];

  stats.inst_count++;

  uint32_t next_pc = pc + 4;

  auto set_x = [&](int r, uint32_t v) {
    if (r != 0) {
      if (!running)
        record_reg_change(r, x_reg[r]);
      x_reg[r] = v;
    }
  };
  auto get_x = [&](int r) { return (r == 0) ? 0 : x_reg[r]; };

  auto set_f = [&](int r, float v) {
    if (r != 0) {
      if (!running)
        record_reg_change(r, f_reg[r]);
      f_reg[r] = v;
    }
  };
  auto get_f = [&](int r) { return (r == 0) ? 0.0f : f_reg[r]; };

  auto do_branch = [&](bool cond, int32_t offset) {
    stats.branch_total++;
    if (cond) {
      stats.branch_taken++;
      next_pc = pc + (offset * 4);
    }
  };

  switch (inst.op) {
  case ADD:
    set_x(inst.rd, get_x(inst.rs1) + get_x(inst.rs2));
    break;
  case SUB:
    set_x(inst.rd, get_x(inst.rs1) - get_x(inst.rs2));
    break;
  case TERN:
    set_x(inst.rd, get_x(inst.rs1) != 0 ? get_x(inst.rs2) : get_x(inst.rs3));
    break;
  case MUL:
    set_x(inst.rd, get_x(inst.rs1) * get_x(inst.rs2));
    break;
  case DIV: {
    uint32_t d = get_x(inst.rs2);
    if (d != 0)
      set_x(inst.rd, get_x(inst.rs1) / d);
  } break;
  case ADDI:
    set_x(inst.rd, get_x(inst.rs1) + inst.imm);
    break;
  case SUBI:
    set_x(inst.rd, get_x(inst.rs1) - inst.imm);
    break;
  case MULI:
    set_x(inst.rd, get_x(inst.rs1) * inst.imm);
    break;
  case DIVI: {
    if (inst.imm != 0)
      set_x(inst.rd, get_x(inst.rs1) / inst.imm);
  } break;
  case MOVI:
    set_x(inst.rd, inst.imm);
    break;
  case MOVUI:
    set_x(inst.rd, (uint32_t)inst.imm << 12);
    break;
  case SAR:
    set_x(inst.rd, (int32_t)get_x(inst.rs1) >> (get_x(inst.rs2) & 31));
    break;
  case FTERN:
    set_f(inst.rd, get_f(inst.rs1) != 0.0f ? get_f(inst.rs2) : get_f(inst.rs3));
    break;
  case SARI:
    set_x(inst.rd, (int32_t)get_x(inst.rs1) >> (inst.imm & 31));
    break;
  case SLL:
    set_x(inst.rd, get_x(inst.rs1) << (get_x(inst.rs2) & 31));
    break;
  case SLR:
    set_x(inst.rd, get_x(inst.rs1) >> (get_x(inst.rs2) & 31));
    break;
  case SLRI:
    set_x(inst.rd, get_x(inst.rs1) >> (inst.imm & 31));
    break;
  case SLLI:
    set_x(inst.rd, get_x(inst.rs1) << (inst.imm & 31));
    break;
  case ADD4:
    set_x(inst.rd, get_x(inst.rs1) + (get_x(inst.rs2) << 2));
    break;
  case ANDI:
    set_x(inst.rd, get_x(inst.rs1) & inst.imm);
    break;
  case OR:
    set_x(inst.rd, get_x(inst.rs1) | get_x(inst.rs2));
    break;
  case ORI:
    set_x(inst.rd, get_x(inst.rs1) | inst.imm);
    break;
  case XOR:
    set_x(inst.rd, get_x(inst.rs1) ^ get_x(inst.rs2));
    break;
  case XORI:
    set_x(inst.rd, get_x(inst.rs1) ^ inst.imm);
    break;

  // FPU
  case FADD:
    set_f(inst.rd, get_f(inst.rs1) + get_f(inst.rs2));
    break;
  case FSUB:
    set_f(inst.rd, get_f(inst.rs1) - get_f(inst.rs2));
    break;
  case FMUL:
    set_f(inst.rd, get_f(inst.rs1) * get_f(inst.rs2));
    break;
  case FMA:
    set_f(inst.rd, get_f(inst.rs1) * get_f(inst.rs2) + get_f(inst.rs3));
    break;
  case FDIV:
    set_f(inst.rd, get_f(inst.rs1) / get_f(inst.rs2));
    break;
  case FNEG:
    set_f(inst.rd, -get_f(inst.rs1));
    break;
  case FINV:
    set_f(inst.rd, 1.0f / get_f(inst.rs1));
    break;
  case FFLOOR:
    set_f(inst.rd, floorf(get_f(inst.rs1)));
    break;

  case MIF:
    set_f(inst.rd, int_as_float(get_x(inst.rs1)));
    break;
  case MFI:
    set_x(inst.rd, float_as_int(get_f(inst.rs1)));
    break;

  case FSQRT:
    set_f(inst.rd, std::sqrt(get_f(inst.rs1)));
    break;
  case FABS:
    set_f(inst.rd, std::fabs(get_f(inst.rs1)));
    break;
  case FRSQRT:
    set_f(inst.rd, 1.0f / std::sqrt(get_f(inst.rs1)));
    break;
  case FTOI:
    set_x(inst.rd, (int32_t)std::round(get_f(inst.rs1)));
    break;
  case ITOF:
    set_f(inst.rd, (float)((int32_t)get_x(inst.rs1)));
    break;

  case FLT:
    set_x(inst.rd, (get_f(inst.rs1) < get_f(inst.rs2)) ? 1 : 0);
    break;
  case FLEQ:
    set_x(inst.rd, (get_f(inst.rs1) <= get_f(inst.rs2)) ? 1 : 0);
    break;
  case FEQ:
    set_x(inst.rd, (get_f(inst.rs1) == get_f(inst.rs2)) ? 1 : 0);
    break;

  case JEQ:
    do_branch(get_x(inst.rs1) == get_x(inst.rs2), inst.imm);
    break;
  case JLT:
    do_branch((int32_t)get_x(inst.rs1) < (int32_t)get_x(inst.rs2), inst.imm);
    break;
  case JLEQ:
    do_branch((int32_t)get_x(inst.rs1) <= (int32_t)get_x(inst.rs2), inst.imm);
    break;

  case GOTO: {
    uint32_t target_addr = ((uint32_t)inst.imm & 0xFFFFF) << 2;
    stats.jmp_target_count[target_addr]++;
    next_pc = target_addr;
  } break;

  case JMP: {
    uint32_t target_addr = inst.imm + get_x(inst.rs1);
    stats.jmp_target_count[target_addr]++;
    if (inst.rd != 0) { // call (saves return address)
      stats.func_call_count[target_addr]++;
    }
    set_x(inst.rd, pc + 4);
    next_pc = target_addr;
  } break;

  case CLT:
    set_x(inst.rd,
          ((int32_t)get_x(inst.rs1) < (int32_t)get_x(inst.rs2)) ? 1 : 0);
    break;
  case CLTI:
    set_x(inst.rd, ((int32_t)get_x(inst.rs1) < inst.imm) ? 1 : 0);
    break;
  case CEQ:
    set_x(inst.rd, (get_x(inst.rs1) == get_x(inst.rs2)) ? 1 : 0);
    break;
  case CEQI:
    set_x(inst.rd, ((int32_t)get_x(inst.rs1) == (int32_t)inst.imm) ? 1 : 0);
    break;
  case CLEQ:
    set_x(inst.rd,
          ((int32_t)get_x(inst.rs1) <= (int32_t)get_x(inst.rs2)) ? 1 : 0);
    break;
  case CLEQI:
    set_x(inst.rd, ((int32_t)get_x(inst.rs1) <= (int32_t)inst.imm) ? 1 : 0);
    break;

  case LB: {
    stats.mem_access_count++;
    uint32_t raw_addr = get_x(inst.rs1) + inst.imm;
    if (raw_addr == IO_ADDR) {
      uint8_t val = 0;
      if (input_cursor < input_buffer.size()) {
        val = input_buffer[input_cursor++];
      }
      set_x(inst.rd, (int32_t)val);
    } else {
      uint32_t addr = raw_addr & 0x07FFFFFF;
      if (addr < MEM_SIZE)
        set_x(inst.rd, (int32_t)(int8_t)memory[addr]);
    }
  } break;

  case SB: {
    stats.mem_access_count++;
    uint32_t raw_addr = get_x(inst.rs1) + inst.imm;
    if (raw_addr == IO_ADDR) {
      char c = (char)get_x(inst.rs2);
      if (headless)
        cout << c << flush;
      else {
        char buf[2] = {c, 0};
        tui_log(buf);
        output_buffer.push_back(c);
      }
    } else {
      uint32_t addr = raw_addr & 0x07FFFFFF;
      if (addr < MEM_SIZE) {
        uint8_t v = get_x(inst.rs2) & 0xFF;
        record_mem_change(addr, memory[addr]);
        memory[addr] = v;
      }
    }
  } break;

  case LW: {
    stats.mem_access_count++;
    int32_t off = inst.imm * 4;
    uint32_t raw_addr = get_x(inst.rs1) + off;
    // LW explicitly no longer does IO behavior
    uint32_t addr = raw_addr & 0x07FFFFFF;
    if (addr < MEM_SIZE - 3) {
      uint32_t v = memory[addr] | (memory[addr + 1] << 8) |
                   (memory[addr + 2] << 16) | (memory[addr + 3] << 24);
      set_x(inst.rd, v);
    }
  } break;
  case LF: {
    stats.mem_access_count++;
    int32_t off = inst.imm * 4;
    uint32_t raw_addr = get_x(inst.rs1) + off;
    uint32_t addr = raw_addr & 0x07FFFFFF;
    if (addr < MEM_SIZE - 3) {
      uint32_t v = memory[addr] | (memory[addr + 1] << 8) |
                   (memory[addr + 2] << 16) | (memory[addr + 3] << 24);
      set_f(inst.rd, int_as_float(v));
    }
  } break;

  case SW: {
    stats.mem_access_count++;
    int32_t off = inst.imm * 4;
    uint32_t raw_addr = get_x(inst.rs1) + off;
    // if (raw_addr == IO_ADDR) {
    //   char c = (char)get_x(inst.rs2);
    //   if (headless)
    //     cout << c << flush;
    //   else {
    //     char buf[2] = {c, 0};
    //     tui_log(buf);
    //   }
    // } else 
    {
      uint32_t addr = raw_addr & 0x07FFFFFF;
      if (addr < MEM_SIZE - 3) {
        uint32_t v = get_x(inst.rs2);
        record_mem_change(addr, memory[addr]);
        memory[addr] = v & 0xFF;
        record_mem_change(addr + 1, memory[addr + 1]);
        memory[addr + 1] = (v >> 8) & 0xFF;
        record_mem_change(addr + 2, memory[addr + 2]);
        memory[addr + 2] = (v >> 16) & 0xFF;
        record_mem_change(addr + 3, memory[addr + 3]);
        memory[addr + 3] = (v >> 24) & 0xFF;
      }
    }
  } break;

  case SF: {
    stats.mem_access_count++;
    int32_t off = inst.imm * 4;
    uint32_t raw_addr = get_x(inst.rs1) + off;
    uint32_t addr = raw_addr & 0x07FFFFFF;
    if (addr < MEM_SIZE - 3) {
      uint32_t v = float_as_int(get_f(inst.rs2));
      record_mem_change(addr, memory[addr]);
      memory[addr] = v & 0xFF;
      record_mem_change(addr + 1, memory[addr + 1]);
      memory[addr + 1] = (v >> 8) & 0xFF;
      record_mem_change(addr + 2, memory[addr + 2]);
      memory[addr + 2] = (v >> 16) & 0xFF;
      record_mem_change(addr + 3, memory[addr + 3]);
      memory[addr + 3] = (v >> 24) & 0xFF;
    }
  } break;
  case QUIT:
    next_pc = instructions.size() * 4; // Force exit
    break;
  default:
    break;
  }

  pc = next_pc;
}

void do_undo() {
  if (undo_stack.empty()) {
    tui_log("Undo stack empty.");
    return;
  }
  UndoStep step = undo_stack.back();
  undo_stack.pop_back();
  for (auto it = step.actions.rbegin(); it != step.actions.rend(); ++it) {
    if (it->type == UndoAction::REG)
      x_reg[it->index] = it->value;
    else if (it->type == UndoAction::MEM)
      memory[it->index] = (uint8_t)it->value;
  }
  pc = step.pc;
  stats.inst_count--;
}

int main(int argc, char **argv) {
  if (argc < 2) {
    cerr << "Usage: " << argv[0] << " <binary file> [--headless|--cli]" << endl;
    return 1;
  }

  bool cli_mode = false;
  string symfile = "";
  for (int i = 2; i < argc; i++) {
    string arg = argv[i];
    if (arg == "--headless")
      headless = true;
    else if (arg == "--cli")
      cli_mode = true;
    else if (arg == "--symfile" && i + 1 < argc)
      symfile = argv[++i];
  }

  load_binary(argv[1]);
  if (!symfile.empty())
    load_symbols(symfile);
  // Initialize SP and HP to avoid collision in Data Memory
  // SP grows UP (addi), HP grows DOWN (subi)
  x_reg[1] = 0x400000; // SP starts at 4MB
  x_reg[2] = MEM_SIZE; // HP starts at top (128MB)

  // Load input.bin if exists
  string input_path = "input.bin";
  ifstream infile(input_path, ios::binary);

  // Try executable directory if not found in current dir
  if (!infile.is_open()) {
    string exec_path = argv[0];
    size_t last_slash = exec_path.find_last_of('/');
    if (last_slash != string::npos) {
      input_path = exec_path.substr(0, last_slash + 1) + "input.bin";
      infile.open(input_path, ios::binary);
    }
  }

  if (infile.is_open()) {
    if (cli_mode)
      cout << "Loaded input.bin from " << input_path << endl;
    infile.seekg(0, ios::end);
    size_t size = infile.tellg();
    infile.seekg(0, ios::beg);
    input_buffer.resize(size);
    infile.read((char *)input_buffer.data(), size);
  }

  // --- CLI Mode ---
  if (cli_mode) {
    cout << "=== TKMEDA Simulator CLI ===" << endl;
    cout << "Loaded " << instructions.size() << " instructions from " << argv[1]
         << endl;
    cout << "Commands: s (step), n <N> (step N), r (run), o (step out)" << endl;
    cout
        << "          p (print regs), a (print all), m <addr> [count], q (quit)"
        << endl;
    cout << "============================" << endl;

    string lastRunCommand = "s";
    uint64_t cycles = 0;
    bool last_was_return = false;

    auto is_finished = [&]() {
      return pc >= instructions.size() * 4 ||
             pc_to_inst_index.find(pc) == pc_to_inst_index.end();
    };

    auto print_regs = [&]() {
      cout << "--- Integer Registers ---" << endl;
      for (int i = 0; i < 32; ++i) {
        cout << "x" << setw(2) << i << ": " << setw(11) << x_reg[i] << "  ";
        if ((i + 1) % 4 == 0)
          cout << endl;
      }
      cout << "--- Float Registers ---" << endl;
      for (int i = 0; i < 32; ++i) {
        cout << "f" << setw(2) << i << ": " << setw(11) << f_reg[i] << "  ";
        if ((i + 1) % 4 == 0)
          cout << endl;
      }
    };

    auto print_current_inst = [&]() {
      if (pc_to_inst_index.count(pc)) {
        int idx = pc_to_inst_index[pc];
        cout << "  --> " << instructions[idx].original_line << endl;
      }
    };

    auto do_step = [&]() {
      last_was_return = false;
      if (is_finished())
        return true;

      // Check for return: JMP with rs1 == 3 (x3)
      if (pc_to_inst_index.count(pc)) {
        const auto &inst = instructions[pc_to_inst_index[pc]];
        if (inst.op == JMP && inst.rs1 == 3) {
          last_was_return = true;
        }
      }

      exec_one_step(false);
      cycles++;
      stats.inst_count++;
      return is_finished();
    };

    string line;
    while (true) {
      cout << "(sim) ";
      if (!getline(cin, line))
        break;

      if (line.empty()) {
        line = lastRunCommand;
        cout << "Repeating: " << line << endl;
      }

      istringstream iss(line);
      string cmd;
      iss >> cmd;

      if (cmd == "q" || cmd == "quit") {
        cout << "Goodbye!" << endl;
        break;
      } else if (cmd == "s") {
        lastRunCommand = "s";
        bool finished = do_step();
        cout << "Cycle " << cycles << ", PC = 0x" << hex << pc << dec << endl;
        print_current_inst();
        if (finished)
          cout << "Program finished." << endl;
      } else if (cmd == "n") {
        int count = 1;
        if (iss >> count)
          lastRunCommand = "n " + to_string(count);
        else
          lastRunCommand = "n 1";

        for (int i = 0; i < count; ++i) {
          if (do_step()) {
            cout << "Program finished at cycle " << cycles << endl;
            break;
          }
        }
        cout << "Cycle " << cycles << ", PC = 0x" << hex << pc << dec << endl;
        print_current_inst();
      } else if (cmd == "r") {
        lastRunCommand = "r";
        const uint64_t MAX_CYCLES = 10000000000000;
        uint64_t start = cycles;

        while (!is_finished() && cycles - start < MAX_CYCLES) {
          exec_one_step(true);
          cycles++;
        }

        if (is_finished()) {
          cout << "Program finished at cycle " << cycles << endl;
        } else {
          cout << "Stopped after " << MAX_CYCLES << " cycles (limit)." << endl;
        }
      } else if (cmd == "o") {
        lastRunCommand = "o";
        const uint64_t MAX_CYCLES = 10000000000000;
        uint64_t start = cycles;

        while (!is_finished() && cycles - start < MAX_CYCLES) {
          do_step();
          if (last_was_return) {
            cout << "Return detected (jmp %i3) at cycle " << cycles
                 << ", PC = 0x" << hex << pc << dec << endl;
            break;
          }
        }

        if (is_finished()) {
          cout << "Program finished at cycle " << cycles << endl;
        } else if (cycles - start >= MAX_CYCLES) {
          cout << "Stopped after " << MAX_CYCLES << " cycles (no return found)."
               << endl;
        }
      } else if (cmd == "p") {
        print_regs();
        cout << "output: ";
        for (uint8_t c : output_buffer) {
          cout << (char)c;
        }
        cout << endl;
      } else if (cmd == "a") {
        cout << "PC: 0x" << hex << pc << dec << ", Cycle: " << cycles << endl;
        print_current_inst();
        print_regs();
      } else if (cmd == "m") {
        uint32_t addr = 0;
        uint32_t count = 1;
        if (iss >> hex >> addr) {
          iss >> dec >> count;
          cout << "=== Memory [0x" << hex << addr << "] ===" << dec << endl;
          for (uint32_t i = 0; i < count; ++i) {
            uint32_t a = addr + i * 4;
            if (a < MEM_SIZE - 3) {
              uint32_t v = memory[a] | (memory[a + 1] << 8) |
                           (memory[a + 2] << 16) | (memory[a + 3] << 24);
              cout << "  [0x" << hex << setw(8) << setfill('0') << a << "]: 0x"
                   << setw(8) << v << " (" << dec << (int32_t)v << ")" << endl;
            }
          }
        } else {
          cerr << "Usage: m <addr> [count]" << endl;
        }
      } else if (cmd == "h" || cmd == "help" || cmd == "?") {
        cout << "Commands: s, n <N>, r, o, p, a, m <addr> [count], q" << endl;
      } else {
        cerr << "Unknown command: " << cmd << ". Type 'h' for help." << endl;
      }
    }
    return 0;
  }

  if (!headless)
    init_tui();

  bool running = false;
  uint64_t cycles = 0;

  if (headless) {
    signal(SIGINT, sigint_handler);
    uint64_t max_cycles = 10000000000000;
    pc = 0;
    while (cycles < max_cycles) {
      if (g_interrupted) break;
      if (pc_to_inst_index.find(pc) == pc_to_inst_index.end()) {
        cout << "Invalid PC: " << hex << pc << dec << endl;
        break;
      }
      exec_one_step(true);
      cycles++;
      if (pc >= instructions.size() * 4)
        break;
      if (instructions[pc_to_inst_index[pc]].op == UNKNOWN) {
        cout << "Unknown Opcode at PC " << hex << pc << dec << endl;
        break;
      }
    }
    if (g_interrupted)
      cout << "\n[INTERRUPTED] Partial stats. Cycles: " << cycles
           << ", PC: " << hex << pc << dec << endl;
    else
      cout << "\nHeadless finished. Cycles: " << cycles << ", PC: " << hex << pc
           << dec << endl;
    cout << "Registers:" << endl;
    for (int i = 0; i < 32; ++i) {
      cout << "x" << i << ": " << x_reg[i] << " ";
      if ((i + 1) % 4 == 0)
        cout << endl;
    }
    cout << "FP Registers:" << endl;
    for (int i = 0; i < 32; ++i) {
      cout << "f" << i << ": " << f_reg[i] << " ";
      if ((i + 1) % 4 == 0)
        cout << endl;
    }

    // --- Profiling Stats ---
    cout << "\n=== ProfileStats ===" << endl;
    double mem_pct = stats.inst_count > 0
                         ? (100.0 * stats.mem_access_count / stats.inst_count)
                         : 0.0;
    cout << "MemAccessCount: " << stats.mem_access_count << endl;
    cout << "MemAccessRate: " << fixed << setprecision(2) << mem_pct << "%"
         << endl;

    // Sort func_call_count by call count descending
    vector<pair<uint64_t, uint32_t>> func_sorted;
    func_sorted.reserve(stats.func_call_count.size());
    for (auto &kv : stats.func_call_count)
      func_sorted.push_back({kv.second, kv.first});
    sort(func_sorted.rbegin(), func_sorted.rend());

    int top_n = min((int)func_sorted.size(), 20);
    cout << "TopFunctions: " << top_n << endl;
    for (int i = 0; i < top_n; i++) {
      uint32_t fn_pc = func_sorted[i].second;
      string name = "";
      if (symbols.count(fn_pc))
        name = "  # " + symbols[fn_pc];
      cout << "  Func PC=0x" << hex << setw(8) << setfill('0') << fn_pc << dec
           << setfill(' ') << " calls=" << func_sorted[i].first << name << endl;
    }

    // Sort jmp_target_count by hit count descending
    vector<pair<uint64_t, uint32_t>> jmp_sorted;
    jmp_sorted.reserve(stats.jmp_target_count.size());
    for (auto &kv : stats.jmp_target_count)
      jmp_sorted.push_back({kv.second, kv.first});
    sort(jmp_sorted.rbegin(), jmp_sorted.rend());

    int top_jmp_n = min((int)jmp_sorted.size(), 20);
    cout << "TopJmpTargets: " << top_jmp_n << endl;
    for (int i = 0; i < top_jmp_n; i++) {
      uint32_t target_pc = jmp_sorted[i].second;
      string name = "";
      if (symbols.count(target_pc))
        name = "  # " + symbols[target_pc];
      cout << "  JmpTarget PC=0x" << hex << setw(8) << setfill('0') << target_pc
           << dec << setfill(' ') << " count=" << jmp_sorted[i].first << name
           << endl;
    }
    cout << "=== EndProfileStats ===" << endl;

    return 0;
  }

  while (true) {
    vector<pair<int, string>> view_code;
    int current_idx = -1;
    if (pc_to_inst_index.count(pc))
      current_idx = pc_to_inst_index[pc];
    int start_idx = (current_idx > 10) ? current_idx - 10 : 0;
    int end_idx = (current_idx + 10 < (int)instructions.size())
                      ? current_idx + 10
                      : instructions.size();
    for (int i = start_idx; i < end_idx; ++i)
      view_code.push_back(
          {(i == current_idx) ? 1 : 0, instructions[i].original_line});

    if (!running)
      update_tui(pc, x_reg, f_reg, view_code, memory, input_buffer,
                 input_cursor, cycles, stats.inst_count, stats.branch_taken,
                 stats.branch_total, running);

    if (running)
      set_tui_blocking(false);
    else
      set_tui_blocking(true);

    int c = get_tui_command();
    if (c != -1) {
      if (c == 'q')
        break;
      if (c == 's') {
        exec_one_step(false);
        cycles++;
      }
      if (c == 'r') {
        running = !running;
      }
      if (c == 'n') {
        // string s = get_tui_input("Steps: ");
        string s = "";
        if (!s.empty()) {
          int n = atoi(s.c_str());
          for (int i = 0; i < n; ++i) {
            exec_one_step(false);
            cycles++;
          }
        }
      }
      if (c == 'u') {
        running = false;
        do_undo();
        cycles--;
      }
      if (c == 'd') {
        string filepath = "./output.bin";
        ofstream outfile(filepath, ios::binary);
        if (outfile.is_open()) {
          outfile.write((char *)output_buffer.data(), output_buffer.size());
          outfile.close();
        }
      }
      if (c == 'b') {
        running = false;
        // string s = get_tui_input("Break Addr(hex): ");
        string s = "";
        if (!s.empty()) {
          try {
            uint32_t addr = stoul(s, nullptr, 16);
            breakpoints[addr] = !breakpoints[addr];
            tui_log(breakpoints[addr] ? "Break Set" : "Break Clear");
          } catch (...) {
          }
        }
      }
    }

    if (running) {
      for (int i = 0; i < 1024; ++i) {
        exec_one_step(true);
        cycles++;
        if (breakpoints.count(pc)) {
          running = false;
          break;
        }
      }
    }
  }

  if (!headless)
    close_tui();
  return 0;
}
