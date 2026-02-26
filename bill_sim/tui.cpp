#include "tui.h"
#include <iomanip>
#include <iostream>
#include <ncurses.h>
#include <sstream>

// Windows
WINDOW *win_code, *win_regs, *win_mem, *win_io, *win_in;

void init_tui() {
  initscr();
  cbreak();
  noecho();
  keypad(stdscr, TRUE);
  curs_set(0);
  start_color();

  // Colors
  init_pair(1, COLOR_WHITE, COLOR_BLACK);  // Default
  init_pair(2, COLOR_BLACK, COLOR_CYAN);   // Highlight PC
  init_pair(3, COLOR_YELLOW, COLOR_BLACK); // Labels
  init_pair(4, COLOR_GREEN, COLOR_BLACK);  // Registers

  // Layout:
  // Code: Left Half
  // Regs: Top Right
  // Mem: Bottom Right
  // IO: Bottom Left under Code?

  int h, w;
  getmaxyx(stdscr, h, w);

  int mid_x = w / 2;
  // int mid_y = h / 2; // Unused

  // Code: Top Left, 2/3 Height
  win_code = newwin(h - 10, mid_x, 0, 0);
  box(win_code, 0, 0);
  mvwprintw(win_code, 0, 2, " Code ");

  // Input: Bottom Left (Top 3 lines of bottom area)
  win_in = newwin(3, mid_x, h - 10, 0);
  box(win_in, 0, 0);
  mvwprintw(win_in, 0, 2, " Input ");

  // IO: Bottom Left (Remaining 7 lines)
  win_io = newwin(7, mid_x, h - 7, 0);
  scrollok(win_io, TRUE);
  box(win_io, 0, 0);
  mvwprintw(win_io, 0, 2, " Output ");
  wmove(win_io, 1, 1);

  // Regs: Top Right
  // Ensure enough height for 32 regs (16 per col -> 18 lines with box).
  // If screen is small, prioritize Regs over Mem, but keep Mem visible.
  int regs_h = (h / 2 > 18) ? (h / 2) : 18;
  if (regs_h > h - 5)
    regs_h = h - 5; // Leave 5 lines for Mem min

  win_regs = newwin(regs_h, w - mid_x, 0, mid_x);
  box(win_regs, 0, 0);
  mvwprintw(win_regs, 0, 2, " Registers ");

  // Mem: Bottom Right
  win_mem = newwin(h - regs_h, w - mid_x, regs_h, mid_x);
  box(win_mem, 0, 0);
  mvwprintw(win_mem, 0, 2, " Memory ");

  refresh();
}

void close_tui() {
  if (win_code)
    delwin(win_code);
  if (win_regs)
    delwin(win_regs);
  if (win_io)
    delwin(win_io);
  if (win_in)
    delwin(win_in);
  if (win_mem)
    delwin(win_mem);
  endwin();
}

void set_tui_blocking(bool blocking) { nodelay(stdscr, !blocking); }

void tui_log(const char *msg) {
  if (!win_io)
    return;
  wprintw(win_io, "%s", msg);
  // box(win_io, 0, 0); // Re-drawing box might mess up text if scrolling?
  // Let's just refresh.
  wrefresh(win_io);
}
void update_tui(uint32_t pc, const uint32_t *regs, const float *fregs,
                const std::vector<std::pair<int, std::string>> &source_code,
                const std::vector<uint8_t> &memory,
                const std::vector<uint8_t> &input_buf, size_t input_cursor,
                uint64_t cycle_count, uint64_t inst_count,
                uint64_t branch_taken, uint64_t branch_total, bool running) {
  if (running) {
    // werase(win_code);
    // box(win_code, 0, 0);
    // mvwprintw(win_code, 0, 2, " Code (PC: %x | Insts: %lu | Branches:
    // %lu/%lu) ", pc, inst_count, branch_taken, branch_total);
    // wrefresh(win_code);
    return;
  }
  // --- Update Registers ---
  werase(win_regs);
  box(win_regs, 0, 0);
  mvwprintw(win_regs, 0, 2, " Registers (Cycle: %lu) ", cycle_count);

  int reg_win_h, reg_win_w;
  getmaxyx(win_regs, reg_win_h, reg_win_w);
  int max_rows = reg_win_h - 2;
  if (max_rows < 1)
    max_rows = 1;

  int col_width = 15; // Width per register column (13 chars content + padding)

  for (int i = 0; i < 64; ++i) {
    int r = (i % max_rows) + 1;
    int c = (i / max_rows) * col_width + 2;

    // Safety check to ensure we don't print outside window width
    // We need space for ~13 chars.
    if (c + 13 < reg_win_w) {
      if (i < 32) {
        mvwprintw(win_regs, r, c, "x%02d: %08x", i, regs[i]);
      } else {
        int f_idx = i - 32;
        // Use compact float format
        mvwprintw(win_regs, r, c, "f%02d: %-8.5g", f_idx, fregs[f_idx]);
      }
    }
  }
  wrefresh(win_regs);

  // --- Update Code ---
  werase(win_code);
  box(win_code, 0, 0);
  mvwprintw(win_code, 0, 2, " Code (PC: %x | Insts: %lu | Branches: %lu/%lu) ",
            pc, inst_count, branch_taken, branch_total);

  int row = 1;
  for (const auto &item : source_code) {
    if (row >= getmaxy(win_code) - 1)
      break;

    // item.first == 1 means Active line
    if (item.first == 1)
      wattron(win_code, COLOR_PAIR(2));
    mvwprintw(win_code, row, 1, "%s", item.second.c_str());
    if (item.first == 1)
      wattroff(win_code, COLOR_PAIR(2));

    row++;
  }
  wrefresh(win_code);

  // --- Update Memory ---
  werase(win_mem);
  box(win_mem, 0, 0);

  int mh, mw;
  getmaxyx(win_mem, mh, mw);

  // Stack (x1) - Increasing addresses
  mvwprintw(win_mem, 0, 2, " Stack(x1) ");
  uint32_t stack_base = regs[1];
  for (int i = 0; i < 8; ++i) {
    if (i + 1 >= mh - 1)
      break;
    uint32_t addr = stack_base + (i * 4);
    uint32_t val = 0;
    if (addr < memory.size() - 3) {
      val = memory[addr] | (memory[addr + 1] << 8) | (memory[addr + 2] << 16) |
            (memory[addr + 3] << 24);
    }
    mvwprintw(win_mem, i + 1, 2, "%08x: %08x", addr, val);
  }

  // Heap (x2) - Decreasing addresses
  if (mw >= 40) {
    int col2_x = (mw > 42) ? 24 : 22;
    mvwprintw(win_mem, 0, col2_x, " Heap(x2) ");
    uint32_t heap_base = regs[2];
    for (int i = 0; i < 8; ++i) {
      if (i + 1 >= mh - 1)
        break;
      uint32_t addr = heap_base - (i * 4);
      uint32_t val = 0;
      if (addr < memory.size() - 3) {
        val = memory[addr] | (memory[addr + 1] << 8) |
              (memory[addr + 2] << 16) | (memory[addr + 3] << 24);
      }
      mvwprintw(win_mem, i + 1, col2_x, "%08x: %08x", addr, val);
    }
  }

  wrefresh(win_mem);

  // Do not erase IO window
  wrefresh(win_io);

  // --- Update Input ---
  werase(win_in);
  box(win_in, 0, 0);
  mvwprintw(win_in, 0, 2, " Input ");

  int in_w = getmaxx(win_in) - 2;
  int display_len = in_w / 3; // 2 hex chars + space
  int start_pos = (int)input_cursor - display_len / 2;
  if (start_pos < 0)
    start_pos = 0;

  for (int i = 0; i < display_len; ++i) {
    int idx = start_pos + i;
    int x_pos = 1 + i * 3;

    if (idx < (int)input_buf.size()) {
      if (idx == (int)input_cursor)
        wattron(win_in, A_REVERSE);
      mvwprintw(win_in, 1, x_pos, "%02x", input_buf[idx]);
      if (idx == (int)input_cursor)
        wattroff(win_in, A_REVERSE);
    } else {
      // Padding
    }
  }
  wrefresh(win_in);
}

int get_tui_command() { return getch(); }

std::string get_tui_input(const char *prompt) {
  if (!win_io)
    return "";

  // Switch to blocking & echo
  set_tui_blocking(true);
  echo();
  curs_set(1);

  wprintw(win_io, "\n%s", prompt);
  wrefresh(win_io);

  char buf[256];
  wgetnstr(win_io, buf, 255);

  // Restore
  noecho();
  curs_set(0);
  // set_tui_blocking(false); // Caller should reset if needed

  return std::string(buf);
}
