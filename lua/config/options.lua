-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.inccommand = 'split'

-- vim.opt.backup = false
-- vim.opt.writebackup = false
-- vim.opt.swapfile = false

-- Check if 'pwsh' is executable and set the shell accordingly
-- refer: https://github.com/LazyVim/LazyVim/issues/2151#issuecomment-1888294994
if vim.loop.os == 'Windows' then
  if vim.fn.executable('pwsh') == 1 then
    vim.o.shell = 'pwsh'
  else
    vim.o.shell = 'powershell'
  end
end
