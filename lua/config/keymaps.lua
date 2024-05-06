-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set('i', 'jk', '<Esc>', { desc = 'Quit insert mode' })

vim.keymap.set('n', '<null>', 'gg<S-v>G', { desc = 'Select all' })

vim.keymap.set({ 'n', 'v', 'o' }, 'gl', '$', { desc = 'Go to line end' })
vim.keymap.set({ 'n', 'v', 'o' }, 'gh', '^', { desc = 'Go to line start' })
