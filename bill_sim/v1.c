// tkmeda_asm.c - C assembler matching sim.c encoders (DSS/DSI/SSI)
// build: gcc -O2 -std=c11 tkmeda_asm.c -o tkasm

#include <assert.h>
#include <ctype.h>
#include <errno.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef uint32_t u32;
typedef int32_t s32;

// ===== opcodes (sim.c と一致) =====
enum {
  OP_NOP = 0x00,
  OP_ADD = 0x41,
  OP_SUB = 0x42,
  OP_TERN = 0x43,
  OP_MUL = OP_TERN, // kept for fmul alias encoding
  OP_DIV = 0x44,
  OP_FNEG = 0x45,
  OP_FINV = 0x44,
  OP_CLT = 0x46,
  OP_ADD4 = 0x47,
  OP_FRSQRT = 0x47,
  OP_OR = 0x48,
  OP_FTOI = 0x48,
  OP_ITOF = 0x49,
  OP_XOR = 0x4F,
  OP_CLEQ = 0x4A,
  OP_FFLOOR = 0x4B,
  OP_FABS = 0x4C,
  OP_CEQ = 0x4E,
  OP_SAR = 0x50,
  OP_FTERN = OP_SAR,
  OP_SLL = 0x53,
  OP_SLR = 0x54,
  OP_LB = 0x5B,
  OP_LW = 0x15B,
  OP_SB = 0x9B,
  OP_SW = 0x19B,
  OP_JMP = 0x60,
  OP_GOTO = 0x11,
  OP_JEQ = 0x29,
  OP_JLT = 0x39,
  OP_JLEQ = 0x35,
  OP_MOVI = 0x4D,
  OP_MOVUI = 0x5D,
  OP_SF = 0x19F,
  OP_LF = 0x15F,
  OP_FMA = 0x86,
  OP_QUIT = 0xFF
};

typedef struct {
  const char *name;
  int opcode;
} OpMap;
static const OpMap kOps[] = {{"add", OP_ADD},       {"sub", OP_SUB},
                             {"fmul", OP_MUL},      {"div", OP_DIV},
                             {"tern", OP_TERN},     {"ftern", OP_FTERN},
                             {"clt", OP_CLT},       {"add4", OP_ADD4},
                             {"or", OP_OR},         {"xor", OP_XOR},
                             {"cleq", OP_CLEQ},     {"ceq", OP_CEQ},
                             {"sar", OP_SAR},       {"sll", OP_SLL},
                             {"slr", OP_SLR},       {"lb", OP_LB},
                             {"lw", OP_LW},         {"sb", OP_SB},
                             {"sw", OP_SW},         {"sf", OP_SF},
                             {"lf", OP_LF},         {"jmp", OP_JMP},
                             {"goto", OP_GOTO},     {"jeq", OP_JEQ},
                             {"jlt", OP_JLT},
                             {"jleq", OP_JLEQ},     {"movi", OP_MOVI},
                             {"movui", OP_MOVUI},   {"mif", OP_ADD},
                             {"mfi", OP_ADD},       {"finv", OP_FINV},
                             {"frsqrt", OP_FRSQRT}, {"ffloor", OP_FFLOOR},
                             {"fabs", OP_FABS},     {NULL, 0}};

// 即値版は DSI で「元の opcode を使う」
typedef struct {
  const char *alias;
  const char *base;
} Alias;
static const Alias kImmAlias[] = {
    {"addi", "add"},   {"subi", "sub"}, {"divi", "div"},
    {"remi", "rem"},   {"andi", "add4"}, {"ori", "or"},   {"xori", "xor"},
    {"sari", "sar"},   {"slli", "sll"}, {"slri", "slr"}, {"clti", "clt"},
    {"cleqi", "cleq"}, {"ceqi", "ceq"}, {NULL, NULL}};
static const Alias kFAlias[] = {
    {"fadd", "add"}, {"fsub", "sub"}, {NULL, NULL}};

// ===== 便利関数 =====
static char *trim(char *s) {
  while (isspace((unsigned char)*s))
    s++;
  if (*s == 0)
    return s;
  char *e = s + strlen(s) - 1;
  while (e > s && isspace((unsigned char)*e))
    *e-- = 0;
  return s;
}
static void strip_comment(char *s) {
  for (; *s; ++s) {
    if (*s == '#' || *s == ';') {
      *s = 0;
      break;
    }
  }
}
static int starts_label(const char *s) {
  if (!(isalpha((unsigned char)s[0]) || s[0] == '_'))
    return 0;
  const char *p = s + 1;
  while (*p && (isalnum((unsigned char)*p) || *p == '_' || *p == '.'))
    p++;
  return (*p == ':');
}
static long parse_int(const char *t) {
  errno = 0;
  char *end;
  long v = strtol(t, &end, 0); // 0x.. も OK
  if (errno != 0 || (end && *trim(end) != '\0')) {
    fprintf(stderr, "[asm] bad immediate: '%s'\n", t);
    exit(1);
  }
  return v;
}
static int parse_reg(const char *t) {
  if (!(t[0] == 'x' || t[0] == 'X')) {
    fprintf(stderr, "[asm] bad register: '%s'\n", t);
    exit(1);
  }
  int n = (int)parse_int(t + 1);
  if (n < 0 || n > 31) {
    fprintf(stderr, "[asm] reg out of range: '%s'\n", t);
    exit(1);
  }
  return n;
}
static int lookup_opcode(const char *name) {
  for (const OpMap *p = kOps; p->name; ++p) {
    if (strcmp(p->name, name) == 0)
      return p->opcode;
  }
  return -1;
}
static const char *normalize_imm_alias(const char *name) {
  for (const Alias *a = kImmAlias; a->alias; ++a) {
    if (strcmp(name, a->alias) == 0)
      return a->base;
  }
  return name; // そのまま
}
static const char *normalize_f_alias(const char *name) {
  for (const Alias *a = kFAlias; a->alias; ++a) {
    if (strcmp(name, a->alias) == 0)
      return a->base;
  }
  return name; // そのまま
}
static void check_imm12(long v, const char *line) {
  if (v < -(1 << 11) || v > (1 << 11) - 1) {
    fprintf(stderr, "[asm] imm12 out of range: %ld\nLine: %s\n", v,
            line ? line : "(unknown)");
    exit(1);
  }
}
static void check_imm12_unsigned(long v, const char *line) {
  if (v < 0 || v > (1 << 12) - 1) {
    fprintf(stderr, "[asm] imm12 (unsigned) out of range: %ld\nLine: %s\n", v,
            line ? line : "(unknown)");
    exit(1);
  }
}

// ===== エンコーダ（sim.c と同じ） =====
static u32 ENCODE_DSS(int op, int rd, int rs1, int rs2) {
  u32 x = 0;
  x |= (u32)(rd & 0x1F) << 19;
  x |= (u32)(rs1 & 0x1F) << 14;
  x |= (u32)(rs2 & 0x1F) << 9;
  x |= (u32)(op & 0x1FF);
  return x;
}
static u32 ENCODE_MIF(int op, int rd, int rs1) {
  u32 x = 0;
  x |= (u32)(0x2) << 30;
  x |= (u32)(rd & 0x1F) << 19;
  x |= (u32)(rs1 & 0x1F) << 14;
  x |= (u32)(op & 0x1FF);
  return x;
}
static u32 ENCODE_FTOI(int op, int rd, int rs1) {
  u32 x = 0;
  x |= (u32)(0x1) << 30;
  x |= (u32)(rd & 0x1F) << 19;
  x |= (u32)(rs1 & 0x1F) << 14;
  x |= (u32)(op & 0x1FF);
  return x;
}
static u32 ENCODE_FINV(int op, int rd, int rs1) {
  u32 x = 0;
  x |= (u32)(0x3) << 30;
  x |= (u32)(rd & 0x1F) << 19;
  x |= (u32)(rs1 & 0x1F) << 14;
  x |= (u32)(op & 0x1FF);
  return x;
}
static u32 ENCODE_DSSf(int op, int rd, int rs1, int rs2) {
  u32 x = 0;
  x |= (u32)(0x3) << 30;
  x |= (u32)(rd & 0x1F) << 19;
  x |= (u32)(rs1 & 0x1F) << 14;
  x |= (u32)(rs2 & 0x1F) << 9;
  x |= (u32)(op & 0x1FF);
  return x;
}
static u32 ENCODE_FMA(int rd, int rs1, int rs2, int rs3) {
  u32 x = 0;
  x |= (u32)(0x3) << 30;         // bits[31:30] = 11 (float-float)
  x |= (u32)(rs3 & 0x1F) << 25;  // bits[29:25] = rs3
  x |= (u32)(rd  & 0x1F) << 19;
  x |= (u32)(rs1 & 0x1F) << 14;
  x |= (u32)(rs2 & 0x1F) << 9;
  x |= (u32)(OP_FMA);
  return x;
}
static u32 ENCODE_TERN(int fmt, int op, int rd, int rs1, int rs2, int rs3) {
  u32 x = 0;
  x |= (u32)(fmt & 0x3) << 30;
  x |= (u32)(rs3 & 0x1F) << 25;
  x |= (u32)(rd & 0x1F) << 19;
  x |= (u32)(rs1 & 0x1F) << 14;
  x |= (u32)(rs2 & 0x1F) << 9;
  x |= (u32)(op & 0x1FF);
  return x;
}
static u32 ENCODE_FLT(int op, int rd, int rs1, int rs2) {
  u32 x = 0;
  x |= (u32)(0x1) << 30;
  x |= (u32)(rd & 0x1F) << 19;
  x |= (u32)(rs1 & 0x1F) << 14;
  x |= (u32)(rs2 & 0x1F) << 9;
  x |= (u32)(op & 0x1FF);
  return x;
}
static u32 ENCODE_DSI(int op, int rd, int rs1, long imm12, const char *line) {
  check_imm12(imm12, line);
  u32 hi = ((u32)imm12 >> 5) & 0x7F;
  u32 lo = ((u32)imm12) & 0x1F;
  u32 x = 0;
  x |= hi << 25;
  x |= 1u << 24;
  x |= (u32)(rd & 0x1F) << 19;
  x |= (u32)(rs1 & 0x1F) << 14;
  x |= lo << 9;
  x |= (u32)(op & 0x1FF);
  return x;
}
static u32 ENCODE_SSI(int op, int rs2, int rs1_base, long off12,
                      const char *line) {
  check_imm12(off12, line);
  u32 hi = ((u32)off12 >> 5) & 0x7F;
  u32 lo = ((u32)off12) & 0x1F;
  u32 x = 0;
  x |= hi << 25;
  x |= 1u << 24;
  x |= lo << 19;
  x |= (u32)(rs1_base & 0x1F) << 14;
  x |= (u32)(rs2 & 0x1F) << 9;
  x |= (u32)(op & 0x1FF);
  return x;
}
static u32 ENCODE_SSJ(int op, int rs2, int rs1_base, long off12,
                      const char *line) {
  check_imm12_unsigned(off12, line);
  u32 hi = ((u32)off12 >> 5) & 0x7F;
  u32 lo = ((u32)off12) & 0x1F;
  u32 x = 0;
  x |= hi << 25;
  x |= lo << 19;
  x |= (u32)(rs1_base & 0x1F) << 14;
  x |= (u32)(rs2 & 0x1F) << 9;
  x |= (u32)(op & 0x1FF);
  return x;
}
static u32 ENCODE_NOP(void) { return ENCODE_DSS(OP_NOP, 0, 0, 0); }
static u32 ENCODE_SSIW_MOVI(int op, int rd, long imm20) {
  // imm[15:10] 0 1 rd[5] imm[9:0] opcode[9] ->
  // imm[19:13] 1 rd[5] imm[12:1] 1 imm[0] 01101
  // 変更
  u32 u = (u32)(imm20 & 0xFFFFF);
  u32 hi = (u >> 13) & 0x7F;
  u32 mid = (u >> 1) & 0xFFF;
  u32 lo = u & 0x1;
  u32 x = 0;
  x |= hi << 25; // imm[15:10]
  x |= 1u << 24; // 固定1
  x |= (u32)(rd & 0x1F) << 19;
  x |= mid << 7; // imm[12:1]
  x |= 1u << 6;  // 固定1
  x |= lo << 5;  // imm[0]
  x |= (u32)(op & 0x1F);
  return x;
}

// ===== 行格納 & ラベル管理 =====
typedef struct {
  char *text;
  u32 pc;
} Line;
typedef struct {
  char *name;
  u32 pc;
} Label;

typedef struct {
  Line *v;
  int n, cap;
} VecLine;
typedef struct {
  Label *v;
  int n, cap;
} VecLabel;
typedef struct {
  u32 *v;
  int n, cap;
} VecWord;
static u32 g_end_pc = 0;

static int vlabel_find(const VecLabel *V, const char *name, u32 *out_pc);
static void percent_i_to_x(char *s);

u32 lo16(u32 x) { return (u32)(x & 0xFFFF); }
u32 lo12(u32 x) { return (u32)(x & 0xFFF); }
u32 hi16(u32 x) { return (u32)((x >> 16) & 0xFFFF); }
u32 hi20(u32 x) { return (u32)((x >> 12) & 0xFFFFF); }

static u32 label_addr_bytes(const VecLabel *labels, const char *name) {
  u32 pc_sym = 0;
  if (vlabel_find(labels, name, &pc_sym)) {
    return pc_sym; // 見つかった
  } else {
    fprintf(stderr,
            "[asm] warn: undefined label '%s' -> use program end (0x%08x)\n",
            name, g_end_pc);
    return g_end_pc; // 見つからなければ末尾PC
  }
}

static void vline_push(VecLine *V, const char *s, u32 pc) {
  if (V->n == V->cap) {
    V->cap = V->cap ? V->cap * 2 : 128;
    V->v = (Line *)realloc(V->v, V->cap * sizeof(Line));
  }
  V->v[V->n].text = strdup(s);
  V->v[V->n].pc = pc;
  V->n++;
}
static void vlabel_push(VecLabel *V, const char *name, u32 pc) {
  if (V->n == V->cap) {
    V->cap = V->cap ? V->cap * 2 : 64;
    V->v = (Label *)realloc(V->v, V->cap * sizeof(Label));
  }
  V->v[V->n].name = strdup(name);
  V->v[V->n].pc = pc;
  V->n++;
}
static int vlabel_find(const VecLabel *V, const char *name, u32 *out_pc) {
  for (int i = 0; i < V->n; i++) {
    if (strcmp(V->v[i].name, name) == 0) {
      *out_pc = V->v[i].pc;
      return 1;
    }
  }
  return 0;
}
static void vword_push(VecWord *V, u32 w) {
  if (V->n == V->cap) {
    V->cap = V->cap ? V->cap * 2 : 256;
    V->v = (u32 *)realloc(V->v, V->cap * sizeof(u32));
  }
  V->v[V->n++] = w;
}

// ===== オペランド分割 =====
static int split_operands(char *s, char *out[], int max_out) {
  int n = 0;
  char *p = s;
  while (*p) {
    // skip spaces
    while (*p && isspace((unsigned char)*p))
      p++;
    if (!*p)
      break;
    // collect until comma
    char *start = p;
    while (*p && *p != ',')
      p++;
    if (*p == ',') {
      *p = 0;
      p++;
    }
    out[n++] = trim(start);
    if (n >= max_out)
      break;
  }
  return n;
}

// imm(rs) 解析: 返り値 (imm_str, reg_str)
static int parse_mem_operand(const char *in, char *imm_out, size_t imm_sz,
                             char *reg_out, size_t reg_sz) {
  // 余計な空白を消したコピー
  char buf[256];
  int bi = 0;
  for (const char *p = in; *p && bi < 255; ++p) {
    if (!isspace((unsigned char)*p))
      buf[bi++] = *p;
  }
  buf[bi] = 0;

  // 形式: something(xN)
  char *lp = strchr(buf, '(');
  char *rp = lp ? strchr(lp, ')') : NULL;
  if (!lp || !rp) {
    return 0;
  }

  *lp = 0;
  *rp = 0;
  strncpy(imm_out, buf, imm_sz - 1);
  imm_out[imm_sz - 1] = 0;
  strncpy(reg_out, lp + 1, reg_sz - 1);
  reg_out[reg_sz - 1] = 0;
  return 1;
}

static void percent_i_to_x(char *s) {
  // 例: "%i31" → "x31"
  char buf[1024];
  int bi = 0;
  for (int i = 0; s[i] && bi < (int)sizeof(buf) - 1;) {
    if (s[i] == '%' && (s[i + 1] == 'i' || s[i + 1] == 'f') &&
        isdigit((unsigned char)s[i + 2])) {
      buf[bi++] = 'x';
      i += 2;
      while (isdigit((unsigned char)s[i]) && bi < (int)sizeof(buf) - 1)
        buf[bi++] = s[i++];
    } else {
      buf[bi++] = s[i++];
    }
  }
  buf[bi] = 0;
  strncpy(s, buf, 1024 - 1);
  s[1023] = 0;
}

// ===== 1st pass: ラベル収集 & クリーン行作成 =====
static void first_pass(FILE *fp, VecLine *lines, VecLabel *labels) {
  char raw[1024];
  u32 pc = 0;
  while (fgets(raw, sizeof(raw), fp)) {
    char *s = trim(raw);
    strip_comment(s);
    s = trim(s);
    percent_i_to_x(s);
    // 先頭が'.'のディレクティブはスキップ（行は残すがpcを進めない）
    if (*s == '.') {
      // .align k → PC を k 境界にアライン（任意。align 4なら no-op）
      if (strncasecmp(s, ".align", 6) == 0) {
        char *p = s + 6;
        p = trim(p);
        long k = (*p ? strtol(p, NULL, 0) : 4);
        if (k > 0) {
          u32 aligned = (pc + (k - 1)) & ~(u32)(k - 1);
          pc = aligned;
        }
      }
      vline_push(lines, "", pc);
      continue;
    }
    if (*s == 0) {
      vline_push(lines, "", pc);
      continue;
    }
    // 複数ラベル対応
    while (starts_label(s)) {
      // name:rest
      const char *p = s;
      while (*p != ':')
        p++;
      size_t len = (size_t)(p - s);
      char name[256];
      if (len >= sizeof(name))
        len = sizeof(name) - 1;
      memcpy(name, s, len);
      name[len] = 0;
      vlabel_push(labels, name, pc);
      s = trim((char *)(p + 1));
    }
    // s が命令なら pc+=4
    vline_push(lines, s, pc);
    // ラベルは二命令分に相当するため加算
    if (!strncmp(s, "set_label", 9))
      pc += 4;
    // fneq は feq + ceqi に展開されるため 2 命令分。
    if (!strncasecmp(s, "fneq", 5))
      pc += 4;
    if (*s)
      pc += 4;
  }
  g_end_pc = pc;
}

// ===== 2nd pass: エンコード =====
typedef struct {
  u32 pc;
  u32 word;
  char *src;
} Item;
typedef struct {
  Item *v;
  int n, cap;
} VecItem;
static void vitem_push(VecItem *V, u32 pc, u32 word, const char *src) {
  if (V->n == V->cap) {
    V->cap = V->cap ? V->cap * 2 : 256;
    V->v = (Item *)realloc(V->v, V->cap * sizeof(Item));
  }
  V->v[V->n].pc = pc;
  V->v[V->n].word = word;
  V->v[V->n].src = strdup(src);
  V->n++;
}

static long label_or_imm(const char *tok, const VecLabel *labels, u32 cur_pc) {
  u32 lpc = 0;
  if (vlabel_find(labels, tok, &lpc) == 1) {
    // 命令数相対 (sim と同じ前提)：(label_pc - cur_pc)/4
    long off = (long)((s32)lpc - (s32)cur_pc) / 4;
    return off;
  }
  return parse_int(tok);
}

void second_pass(const VecLine *lines, const VecLabel *labels, VecWord *words,
                 VecItem *listing) {
  for (int i = 0; i < lines->n; i++) {
    const char *line = lines->v[i].text;
    u32 pc = lines->v[i].pc;

    // PCギャップがある場合はnopでパディング（.alignによるギャップ対応）
    while ((u32)(words->n * 4) < pc) {
      u32 w = ENCODE_NOP();
      u32 pad_pc = words->n * 4;
      vword_push(words, w);
      vitem_push(listing, pad_pc, w, "nop (align padding)");
    }

    if (*line == 0)
      continue;

    // 擬似命令 nop
    if (strcasecmp(line, "nop") == 0) {
      u32 w = ENCODE_NOP();
      vword_push(words, w);
      vitem_push(listing, pc, w, line);
      continue;
    }
    if (strcasecmp(line, "ret") == 0) {
      u32 w = 0x0100c060;
      vword_push(words, w);
      vitem_push(listing, pc, w, line);
      continue;
    }
    // quit命令（プログラム終了）
    if (strcasecmp(line, "quit") == 0) {
      u32 w = OP_QUIT;
      vword_push(words, w);
      vitem_push(listing, pc, w, line);
      continue;
    }

    // finパターンの自動置換:
    // fin:
    //   set_label %i31, fin
    //   jmp %i31, 0(%i31)
    // -> quit
    u32 fin_pc = 0;
    if (vlabel_find(labels, "fin", &fin_pc) && pc == fin_pc) {
      if (strncasecmp(line, "goto", 4) == 0) {
        char tbuf[1024];
        strncpy(tbuf, line, sizeof(tbuf) - 1);
        tbuf[sizeof(tbuf) - 1] = 0;
        char *arg = trim(tbuf + 4);
        if (!strcasecmp(arg, "fin")) {
          u32 w = OP_QUIT;
          vword_push((VecWord *)words, w);
          vitem_push(listing, pc, w, "quit (auto-replaced from goto fin)");
          continue;
        }
      }
      if (strncasecmp(line, "set_label", 9) == 0) {
        if (i + 1 < lines->n) {
          const char *next_line = lines->v[i + 1].text;
          // next_lineはトリム済み
          if (strncasecmp(next_line, "jmp", 3) == 0) {
            // パターン合致 -> quit + nop + nop
            u32 w = OP_QUIT;
            vword_push((VecWord *)words, w);
            vitem_push(listing, pc, w, "quit (auto-replaced)");

            // Padding to maintain PC alignment (12 bytes total replaced by
            // quit(4)+nop(4)+nop(4)) set_label(8) + jmp(4) = 12 bytes
            vword_push((VecWord *)words, ENCODE_NOP());
            vword_push((VecWord *)words, ENCODE_NOP());

            i++; // Skip next line (jmp)
            continue;
          }
        }
      }
    }

    // mnemonic + operands
    char buf[1024];
    strncpy(buf, line, sizeof(buf) - 1);
    buf[sizeof(buf) - 1] = 0;
    char *sp = buf;
    // mn
    char *mn = sp;
    while (*sp && !isspace((unsigned char)*sp))
      sp++;
    if (*sp) {
      *sp++ = 0;
    }
    mn = trim(mn);
    sp = trim(sp);

    // 即値版の別名 normalize, 浮動小数点のエイリアスも担当
    const char *base = normalize_imm_alias(mn);
    int opcode = lookup_opcode(base);
    if (opcode == -1) {
      base = normalize_f_alias(mn);
      opcode = lookup_opcode(base);
    }

    char *ops[4] = {0};
    int nops = split_operands(sp, ops, 4);
    if (!strcasecmp(mn, "movi")) {
      if (nops != 2) {
        fprintf(stderr, "[asm] movi needs 2 operands\n");
        exit(1);
      }
      int rd = parse_reg(ops[0]);
      long imm = parse_int(ops[1]);
      u32 w = ENCODE_SSIW_MOVI(OP_MOVI, rd, imm);
      vword_push((VecWord *)words, w);
      vitem_push(listing, pc, w, line);
      continue;
    }
    if (!strcasecmp(mn, "goto")) {
      if (nops != 1) {
        fprintf(stderr, "[asm] goto label_or_word needs 1 operand\n");
        exit(1);
      }
      u32 lpc = 0;
      u32 target_word = 0;
      if (vlabel_find(labels, ops[0], &lpc) == 1) {
        target_word = lpc >> 2;
      } else {
        long imm = parse_int(ops[0]);
        if (imm < 0 || imm > 0xFFFFF) {
          fprintf(stderr, "[asm] goto immediate out of range (0..1048575): %ld\n", imm);
          exit(1);
        }
        target_word = (u32)imm;
      }
      u32 w = ENCODE_SSIW_MOVI(OP_GOTO, 0, (long)target_word);
      vword_push((VecWord *)words, w);
      vitem_push(listing, pc, w, line);
      continue;
    }
    if (!strcasecmp(mn, "mif")) {
      if (nops != 2) {
        fprintf(stderr, "[asm] mif needs 2 operands\n");
        exit(1);
      }
      int rd = parse_reg(ops[0]);
      int rs1 = parse_reg(ops[1]);
      u32 w = ENCODE_MIF(OP_ADD, rd, rs1);
      vword_push((VecWord *)words, w);
      vitem_push(listing, pc, w, line);
      continue;
    }
    if (!strcasecmp(mn, "mfi")) {
      if (nops != 2) {
        fprintf(stderr, "[asm] mfi needs 2 operands\n");
        exit(1);
      }
      int rd = parse_reg(ops[0]);
      int rs1 = parse_reg(ops[1]);
      u32 w = ENCODE_FTOI(OP_ADD, rd, rs1);
      vword_push((VecWord *)words, w);
      vitem_push(listing, pc, w, line);
      continue;
    }
    if (!strcasecmp(mn, "itof")) {
      if (nops != 2) {
        fprintf(stderr, "[asm] itof needs 2 operands\n");
        exit(1);
      }
      int rd = parse_reg(ops[0]);
      int rs1 = parse_reg(ops[1]);
      u32 w = ENCODE_MIF(OP_ITOF, rd, rs1);
      vword_push((VecWord *)words, w);
      vitem_push(listing, pc, w, line);
      continue;
    }
    if (!strcasecmp(mn, "ftoi")) {
      if (nops != 2) {
        fprintf(stderr, "[asm] ftoi needs 2 operands\n");
        exit(1);
      }
      int rd = parse_reg(ops[0]);
      int rs1 = parse_reg(ops[1]);
      u32 w = ENCODE_FTOI(OP_FTOI, rd, rs1);
      vword_push((VecWord *)words, w);
      vitem_push(listing, pc, w, line);
      continue;
    }
    if (!strcasecmp(mn, "finv")) {
      if (nops != 2) {
        fprintf(stderr, "[asm] finv needs 2 operands\n");
        exit(1);
      }
      int rd = parse_reg(ops[0]);
      int rs1 = parse_reg(ops[1]);
      u32 w = ENCODE_FINV(OP_FINV, rd, rs1);
      vword_push((VecWord *)words, w);
      vitem_push(listing, pc, w, line);
      continue;
    }
    if (!strcasecmp(mn, "ffloor")) {
      if (nops != 2) {
        fprintf(stderr, "[asm] ffloor needs 2 operands\n");
        exit(1);
      }
      int rd = parse_reg(ops[0]);
      int rs1 = parse_reg(ops[1]);
      u32 w = ENCODE_FINV(OP_FFLOOR, rd, rs1);
      vword_push((VecWord *)words, w);
      vitem_push(listing, pc, w, line);
      continue;
    }
    if (!strcasecmp(mn, "fneg")) {
      if (nops != 2) {
        fprintf(stderr, "[asm] fneg needs 2 operands\n");
        exit(1);
      }
      int rd = parse_reg(ops[0]);
      int rs1 = parse_reg(ops[1]);
      u32 w = ENCODE_FINV(OP_FNEG, rd, rs1);
      vword_push((VecWord *)words, w);
      vitem_push(listing, pc, w, line);
      continue;
    }
    if (!strcasecmp(mn, "flt")) {
      if (nops != 3) {
        fprintf(stderr, "[asm] flt needs 3 operands\n");
        exit(1);
      }
      int rd = parse_reg(ops[0]);
      int rs1 = parse_reg(ops[1]);
      int rs2 = parse_reg(ops[2]);
      u32 w = ENCODE_FLT(OP_CLT, rd, rs1, rs2);
      vword_push((VecWord *)words, w);
      vitem_push(listing, pc, w, line);
      continue;
    }
    if (!strcasecmp(mn, "fleq")) {
      if (nops != 3) {
        fprintf(stderr, "[asm] fleq needs 3 operands\n");
        exit(1);
      }
      int rd = parse_reg(ops[0]);
      int rs1 = parse_reg(ops[1]);
      int rs2 = parse_reg(ops[2]);
      u32 w = ENCODE_FLT(OP_CLEQ, rd, rs1, rs2);
      vword_push((VecWord *)words, w);
      vitem_push(listing, pc, w, line);
      continue;
    }
    if (!strcasecmp(mn, "feq")) {
      if (nops != 3) {
        fprintf(stderr, "[asm] fleq needs 3 operands\n");
        exit(1);
      }
      int rd = parse_reg(ops[0]);
      int rs1 = parse_reg(ops[1]);
      int rs2 = parse_reg(ops[2]);
      u32 w = ENCODE_FLT(OP_CEQ, rd, rs1, rs2);
      vword_push((VecWord *)words, w);
      vitem_push(listing, pc, w, line);
      continue;
    }
    if (!strcasecmp(mn, "fneq")) {
      if (nops != 3) {
        fprintf(stderr, "[asm] fneq needs 3 operands\n");
        exit(1);
      }
      int rd = parse_reg(ops[0]);
      int rs1 = parse_reg(ops[1]);
      int rs2 = parse_reg(ops[2]);
      u32 w1 = ENCODE_FLT(OP_CEQ, rd, rs1, rs2);
      u32 w2 = ENCODE_DSI(OP_CEQ, rd, rd, 0, line); // ceqi rd, rd, 0
      vword_push((VecWord *)words, w1);
      vitem_push(listing, pc, w1, line);
      pc += 4;
      vword_push((VecWord *)words, w2);
      vitem_push(listing, pc, w2, line);
      continue;
    }
    if (!strcasecmp(mn, "frsqrt")) {
      if (nops != 2) {
        fprintf(stderr, "[asm] frsqrt needs 2 operands\n");
        exit(1);
      }
      int rd = parse_reg(ops[0]);
      int rs1 = parse_reg(ops[1]);
      u32 w = ENCODE_FINV(OP_FRSQRT, rd, rs1);
      vword_push((VecWord *)words, w);
      vitem_push(listing, pc, w, line);
      continue;
    }
    if (!strcasecmp(mn, "movui")) {
      if (nops != 2) {
        fprintf(stderr, "[asm] movui needs 2 operands\n");
        exit(1);
      }
      int rd = parse_reg(ops[0]);
      long imm = parse_int(ops[1]);
      u32 w = ENCODE_SSIW_MOVI(OP_MOVUI, rd, imm);
      vword_push((VecWord *)words, w);
      vitem_push(listing, pc, w, line);
      continue;
    }
    if (!strcasecmp(mn, "mov")) {
      if (nops != 2) {
        fprintf(stderr, "[asm] mov needs 2 operands\n");
        exit(1);
      }
      int rd = parse_reg(ops[0]);
      int rs2 = parse_reg(ops[1]);
      u32 w = ENCODE_DSS(OP_ADD, rd, rs2, 0); // mov = add rd, rs1, x0
      vword_push((VecWord *)words, w);
      vitem_push(listing, pc, w, line);
      continue;
    }
    if (!strcasecmp(mn, "fmov")) {
      if (nops != 2) {
        fprintf(stderr, "[asm] mov needs 2 operands\n");
        exit(1);
      }
      int rd = parse_reg(ops[0]);
      int rs2 = parse_reg(ops[1]);
      u32 w = ENCODE_DSSf(OP_ADD, rd, rs2, 0); // mov = fadd rd, rs1, x0
      vword_push((VecWord *)words, w);
      vitem_push(listing, pc, w, line);
      continue;
    }
    if (!strcasecmp(mn, "fabs")) {
      if (nops != 2) {
        fprintf(stderr, "[asm] fabs needs 2 operands\n");
        exit(1);
      }
      int rd = parse_reg(ops[0]);
      int rs1 = parse_reg(ops[1]);
      u32 w = ENCODE_FINV(OP_FABS, rd, rs1);
      vword_push((VecWord *)words, w);
      vitem_push(listing, pc, w, line);
      continue;
    }
    if (!strcasecmp(mn, "fma")) {
      if (nops != 4) {
        fprintf(stderr, "[asm] fma needs 4 operands\n");
        exit(1);
      }
      int rd  = parse_reg(ops[0]);
      int rs1 = parse_reg(ops[1]);
      int rs2 = parse_reg(ops[2]);
      int rs3 = parse_reg(ops[3]);
      u32 w = ENCODE_FMA(rd, rs1, rs2, rs3);
      vword_push((VecWord *)words, w);
      vitem_push(listing, pc, w, line);
      continue;
    }
    if (!strcasecmp(mn, "tern")) {
      if (nops != 4) {
        fprintf(stderr, "[asm] tern needs 4 operands\n");
        exit(1);
      }
      int rd = parse_reg(ops[0]);
      int rs1 = parse_reg(ops[1]);
      int rs2 = parse_reg(ops[2]);
      int rs3 = parse_reg(ops[3]);
      u32 w = ENCODE_TERN(0, OP_TERN, rd, rs1, rs2, rs3);
      vword_push((VecWord *)words, w);
      vitem_push(listing, pc, w, line);
      continue;
    }
    if (!strcasecmp(mn, "ftern")) {
      if (nops != 4) {
        fprintf(stderr, "[asm] %s needs 4 operands\n", mn);
        exit(1);
      }
      int rd = parse_reg(ops[0]);
      int rs1 = parse_reg(ops[1]);
      int rs2 = parse_reg(ops[2]);
      int rs3 = parse_reg(ops[3]);
      u32 w = ENCODE_TERN(3, OP_FTERN, rd, rs1, rs2, rs3);
      vword_push((VecWord *)words, w);
      vitem_push(listing, pc, w, line);
      continue;
    }
    if (!strcasecmp(mn, "mul") || !strcasecmp(mn, "muli")) {
      fprintf(stderr, "[asm] '%s' is removed in current ISA. Use tern/ftern.\n", mn);
      exit(1);
    }
    if (!strcasecmp(mn, "jzero")) {
      if (nops != 3) {
        fprintf(stderr, "[asm] %s needs 3 operands\n", mn);
        exit(1);
      }
      int rs2 = parse_reg(ops[1]);
      long off = label_or_imm(ops[2], labels, pc);
      u32 w = ENCODE_SSJ(OP_JEQ, rs2, 0, off, line);
      vword_push((VecWord *)words, w);
      vitem_push(listing, pc, w, line);
      continue;
    }
    if (!strcasecmp(mn, "set_label")) {
      if (nops != 2) {
        fprintf(stderr, "[asm] set_label rd, label\n");
        exit(1);
      }
      int rd = parse_reg(ops[0]);
      u32 addr = label_addr_bytes(labels, ops[1]);
      u32 upper = hi20(addr);
      long lower = (long)lo12(addr);

      u32 w1, w2;
      if (lower >= 2048) {
        upper = (upper + 1) & 0xFFFFF; // Mask to 20 bits
        lower -= 4096;
        w1 = ENCODE_SSIW_MOVI(OP_MOVUI, rd, (long)upper);
        w2 = ENCODE_DSI(OP_ADD, rd, rd, lower, line);
      } else {
        w1 = ENCODE_SSIW_MOVI(OP_MOVUI, rd, (long)upper);
        w2 = ENCODE_DSI(OP_OR, rd, rd, lower, line);
      }

      vword_push((VecWord *)words, w1);
      vitem_push(listing, pc, w1, line);
      vword_push((VecWord *)words, w2);
      vitem_push(listing, pc + 4, w2,
                 (lower < 0) ? "addi (set_label adjusted)"
                             : "ori (set_label lo12)");

      continue;
    }

    if (opcode < 0) {
      fprintf(stderr, "[asm] unknown mnemonic: '%s'\n", mn);
      exit(1);
    }

    u32 w = 0;

    // DSS
    if (!strcasecmp(base, "add") || !strcasecmp(base, "sub") ||
        !strcasecmp(base, "fmul") || !strcasecmp(base, "div") ||
        !strcasecmp(base, "rem") || !strcasecmp(base, "add4") ||
        !strcasecmp(base, "or") || !strcasecmp(base, "xor") ||
        !strcasecmp(base, "sar") || !strcasecmp(base, "sll") ||
        !strcasecmp(base, "slr") || !strcasecmp(base, "clt") ||
        !strcasecmp(base, "cleq") || !strcasecmp(base, "ceq")) {
      if (!strchr("iI", mn[strlen(mn) - 1])) { // 純 DSS（末尾が i でなければ）
        if (strchr("fF", mn[0])) { // 浮動小数点 DSS（最初の文字が f であれば）
          if (nops != 3) {
            fprintf(stderr, "[asm] %s needs 3 operands\n", mn);
            exit(1);
          }
          int rd = parse_reg(ops[0]);
          int rs1 = parse_reg(ops[1]);
          int rs2 = parse_reg(ops[2]);
          w = ENCODE_DSSf(opcode, rd, rs1, rs2);
        } else {

          if (nops != 3) {
            fprintf(stderr, "[asm] %s needs 3 operands\n", mn);
            exit(1);
          }
          int rd = parse_reg(ops[0]);
          int rs1 = parse_reg(ops[1]);
          int rs2 = parse_reg(ops[2]);
          w = ENCODE_DSS(opcode, rd, rs1, rs2);
        }
      } else {
        // 即値版 → DSI
        if (nops != 3) {
          fprintf(stderr, "[asm] %s needs 3 operands\n", mn);
          exit(1);
        }
        int rd = parse_reg(ops[0]);
        int rs1 = parse_reg(ops[1]);
        long imm = parse_int(ops[2]);
        w = ENCODE_DSI(opcode, rd, rs1, imm, line);
      }
    }
    // LOAD（DSI）
    else if (!strcasecmp(base, "lw") || !strcasecmp(base, "lb") ||
             !strcasecmp(base, "lf")) {
      if (nops != 2) {
        fprintf(stderr, "[asm] %s needs 2 operands\n", mn);
        exit(1);
      }
      int rd = parse_reg(ops[0]);
      char off_s[128], base_s[64];
      if (!parse_mem_operand(ops[1], off_s, sizeof(off_s), base_s,
                             sizeof(base_s))) {
        fprintf(stderr, "[asm] bad mem operand: '%s'\n", ops[1]);
        exit(1);
      }
      int rs1 = parse_reg(base_s);
      long imm = parse_int(off_s);
      w = ENCODE_DSI(opcode, rd, rs1, imm, line);
    }
    // STORE（SSI）
    else if (!strcasecmp(base, "sw") || !strcasecmp(base, "sb") ||
             !strcasecmp(base, "sf")) {
      if (nops != 2) {
        fprintf(stderr, "[asm] %s needs 2 operands\n", mn);
        exit(1);
      }
      int rs2 = parse_reg(ops[0]);
      char off_s[128], base_s[64];
      if (!parse_mem_operand(ops[1], off_s, sizeof(off_s), base_s,
                             sizeof(base_s))) {
        fprintf(stderr, "[asm] bad mem operand: '%s'\n", ops[1]);
        exit(1);
      }
      int rs1 = parse_reg(base_s);
      long off = parse_int(off_s);
      w = ENCODE_SSI(opcode, rs2, rs1, off, line);
    }
    // JUMP（DSI）
    else if (!strcasecmp(base, "jmp")) {
      if (nops != 2) {
        fprintf(stderr, "[asm] jmp rd, off(rs1)\n");
        exit(1);
      }
      int rd = parse_reg(ops[0]);
      char off_s[128], base_s[64];
      if (!parse_mem_operand(ops[1], off_s, sizeof(off_s), base_s,
                             sizeof(base_s))) {
        fprintf(stderr, "[asm] bad jmp operand: '%s'\n", ops[1]);
        exit(1);
      }
      int rs1 = parse_reg(base_s);
      long off = label_or_imm(off_s, labels, pc); // ラベルなら命令数相対
      w = ENCODE_DSI(opcode, rd, rs1, off, line);
    }
    // JEQ（SSJ）
    else if (!strcasecmp(base, "jeq") || !strcasecmp(base, "jlt") ||
             !strcasecmp(base, "jleq")) {
      if (nops != 3) {
        fprintf(stderr, "[asm] %s needs 3 operands\n", mn);
        exit(1);
      }
      int rs1 = parse_reg(ops[0]);
      int rs2 = parse_reg(ops[1]);
      long off = label_or_imm(ops[2], labels, pc);
      w = ENCODE_SSJ(opcode, rs2, rs1, off, line);
    } else {
      fprintf(stderr, "[asm] unsupported mnemonic: %s\n", mn);
      exit(1);
    }

    vword_push((VecWord *)words, w);
    vitem_push(listing, pc, w, line);
  }
}

// ===== 出力 =====
static void write_bin(const VecWord *W, const char *path) {
  FILE *f = fopen(path, "wb");
  if (!f) {
    perror(path);
    exit(1);
  }
  for (int i = 0; i < W->n; i++) {
    u32 w = W->v[i];
    unsigned char b[4] = {
        (unsigned char)(w & 0xFF), (unsigned char)((w >> 8) & 0xFF),
        (unsigned char)((w >> 16) & 0xFF), (unsigned char)((w >> 24) & 0xFF)};
    fwrite(b, 1, 4, f);
  }
  fclose(f);
}
static void write_hex(const VecWord *W, const char *path) {
  FILE *f = fopen(path, "w");
  if (!f) {
    perror(path);
    exit(1);
  }
  for (int i = 0; i < W->n; i++) {
    fprintf(f, "%08x\n", W->v[i]);
  }
  fclose(f);
}
static void write_list(const VecItem *L, const char *path) {
  FILE *f = fopen(path, "w");
  if (!f) {
    perror(path);
    exit(1);
  }
  for (int i = 0; i < L->n; i++) {
    fprintf(f, "%08x: %08x    %s\n", L->v[i].pc, L->v[i].word, L->v[i].src);
  }
  fclose(f);
}

// ===== main =====
int main(int argc, char **argv) {
  if (argc < 2) {
    fprintf(stderr,
            "usage: %s input.s [-o out.bin] [-x out.hex] [-l out.list]\n",
            argv[0]);
    return 1;
  }
  const char *in_path = NULL;
  const char *out_bin = NULL;
  const char *out_hex = NULL;
  const char *out_list = NULL;
  in_path = argv[1];
  for (int i = 2; i < argc; i++) {
    if (strcmp(argv[i], "-o") == 0 && i + 1 < argc)
      out_bin = argv[++i];
    else if (strcmp(argv[i], "-x") == 0 && i + 1 < argc)
      out_hex = argv[++i];
    else if (strcmp(argv[i], "-l") == 0 && i + 1 < argc)
      out_list = argv[++i];
    else {
      fprintf(stderr, "unknown arg: %s\n", argv[i]);
      return 1;
    }
  }

  FILE *fp = fopen(in_path, "r");
  if (!fp) {
    perror(in_path);
    return 1;
  }

  VecLine lines = {0};
  VecLabel labels = {0};
  first_pass(fp, &lines, &labels);
  fclose(fp);

  VecWord words = {0};
  VecItem listing = {0};
  second_pass(&lines, &labels, &words, &listing);

  if (out_bin)
    write_bin(&words, out_bin);
  if (out_hex)
    write_hex(&words, out_hex);
  if (out_list)
    write_list(&listing, out_list);

  if (!out_bin && !out_hex && !out_list) {
    // デフォルトはリストを標準出力
    for (int i = 0; i < listing.n; i++) {
      printf("%08x: %08x    %s\n", listing.v[i].pc, listing.v[i].word,
             listing.v[i].src);
    }
  }
  return 0;
}
