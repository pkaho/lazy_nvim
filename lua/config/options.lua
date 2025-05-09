-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.inccommand = "split"
opt.hidden = true -- 允许当前 buffer 未保存时，在 buffer list 中跳转

-- vim.g.lazyvim_python_lsp = "basedpyright"
vim.g.autoformat = false
vim.g.snacks_animate = false

-- Check if "pwsh" is executable and set the shell accordingly
-- refer: https://github.com/LazyVim/LazyVim/issues/2151#issuecomment-1888294994
if vim.fn.executable("pwsh") == 1 then
  opt.shell = "pwsh"
end

-- vim.opt.backup = false
-- vim.opt.writebackup = false
-- vim.opt.swapfile = false
