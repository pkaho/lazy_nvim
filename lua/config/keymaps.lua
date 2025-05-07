-- This file is automatically loaded by lazyvim.config.init

-- DO NOT USE `LazyVim.safe_keymap_set` IN YOUR OWN CONFIG!!
-- use `vim.keymap.set` instead

-- local map = LazyVim.safe_keymap_set
local map = vim.keymap.set

map("i", "jk", "<Esc>", { desc = "Quit insert mode" })

map("n", "<Nop>", "gg<S-v>G", { desc = "Select all" })

map({ "n", "v", "o" }, "gh", "^", { desc = "Go to line start" })
map({ "n", "v", "o" }, "gl", "$", { desc = "Go to line end" })

map({ "n" }, "none", ":w !sudo tee % >/dev/null<CR>:e!<CR>", { noremap = true, silent = true })
