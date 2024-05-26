-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- disable c Auto-wrap comments using 'textwidth', inserting the current comment leader automatically.
-- refer: https://github.com/neovim/neovim/discussions/26885
vim.api.nvim_create_autocmd({ "FileType" }, {
  group = augroup("FormatOptions"),
  pattern = { "*" },
  callback = function()
    -- vim.opt.formatoptions = "jlnqr"
    vim.opt.formatoptions:remove("o")
    vim.opt.formatoptions:remove("r")
    vim.opt.formatoptions:remove("c")
  end,
})
