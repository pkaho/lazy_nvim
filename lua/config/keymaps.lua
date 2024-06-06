-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = LazyVim.safe_keymap_set

map("i", "jk", "<Esc>", { desc = "Quit insert mode" })

map("n", "<Nop>", "gg<S-v>G", { desc = "Select all" })

map({ "n", "v", "o" }, "gl", "$", { desc = "Go to line end" })
map({ "n", "v", "o" }, "gh", "^", { desc = "Go to line start" })
