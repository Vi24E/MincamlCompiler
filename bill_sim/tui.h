#ifndef TUI_H
#define TUI_H

#include <cstdint>
#include <string>
#include <vector>

void init_tui();
void close_tui();
void update_tui(uint32_t pc, const uint32_t *regs, const float *fregs,
                const std::vector<std::pair<int, std::string>> &source_code,
                const std::vector<uint8_t> &memory,
                const std::vector<uint8_t> &input_buf, size_t input_cursor,
                uint64_t cycle_count, uint64_t inst_count,
                uint64_t branch_taken, uint64_t branch_total, bool running);
void tui_log(const char *msg);

// Returns command char or ERR (-1)
int get_tui_command();
void set_tui_blocking(bool blocking);
std::string get_tui_input(const char *prompt);

#endif
