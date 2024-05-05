return {
  {
    -- https://github.com/chrisgrieser/.config/blob/106d4eb2f039f1b9506fd5cfeed7e7d09f832e87/nvim/lua/plugins/bulk-processing.lua#L3C12-L3C12
    "mg979/vim-visual-multi",
    event = "VeryLazy",
    init = function()
      -- Multi-Cursor https://github.com/mg979/vim-visual-multi/blob/master/doc/vm-mappings.txt
      -- vim.g.VM_leader = "\\"
      vim.g.VM_theme = "purplegray"

      vim.g.VM_maps = {
        -- TODO: fix mappings <C-q> already been used to check project
        -- permanent mappings
        ["Find Under"] = "<M-b>",
        ["Find Subword Under"] = "<M-b>",   -- firstly select some text, then <M-b>

        ["Select Cursor Down"] = "<M-C-j>", -- switch upper and lower window with <C-w>jk
        ["Select Cursor Up"] = "<M-C-k>",

        ["Start Regex Search"] = "<C-q>/",
        ["Visual All"] = "\\A", --  1. selected some text in visual mode 2. press <C-q>j to select all

        -- buffer mappings
        ["Switch Mode"] = "v",
        ["Skip Region"] = "q",
        ["Remove Region"] = "Q",
        ["Goto Next"] = "}",
        ["Goto Prev"] = "{",

        ["Duplicate"] = "<C-q>d",

        ["Tools Menu"] = "\\t",
        ["Case Conversion Menu"] = "C",
        ["Align"] = "\\a",
      }

      if vim.g.neovide then
        vim.g.VM_maps = {
          -- permanent mappings
          ["Find Under"] = "<D-b>",
          ["Find Subword Under"] = "<D-b>",   -- firstly select some text, then <M-b>
          ["Select Cursor Down"] = "<D-C-j>", -- switch upper and lower window with <C-w>jk
          ["Select Cursor Up"] = "<D-C-k>",

          ["Start Regex Search"] = "<C-q>/",
          ["Visual All"] = "<C-q>j", --  1. selected some text in visual mode 2. press <C-q>j to select all

          -- buffer mappings
          ["Switch Mode"] = "v",
          ["Skip Region"] = "q",
          ["Remove Region"] = "Q",
          ["Goto Next"] = "}",
          ["Goto Prev"] = "{",

          ["Duplicate"] = "<C-q>d",

          ["Tools Menu"] = "<C-q>t",
          ["Case Conversion Menu"] = "C",
          ["Align"] = "<C-q>a",
        }
      end

      -- https://github.com/mg979/vim-visual-multi/wiki/Mappings#full-mappings-list
      vim.g.VM_set_statusline = 0 -- already set via lualine component
    end,
  },

  -- go forward/backward with square brackets
  {
    "echasnovski/mini.bracketed",
    event = "BufReadPost",
    config = function()
      local bracketed = require("mini.bracketed")
      bracketed.setup({
        file = { suffix = "" },
        window = { suffix = "" },
        quickfix = { suffix = "" },
        yank = { suffix = "" },
        treesitter = { suffix = "n" },
      })
    end,
  },

  -- Refactoring tool
  {
    'ThePrimeagen/refactoring.nvim',
    keys = {
      {
        '<leader>r',
        function()
          require('refactoring').selector_refactor()
        end,
        desc = 'Refactoring tool',
        mode = 'v',
      },
    },
    opts = {}
  },

  -- Incremental rename
  {
    'smjonas/inc-rename.nvim',
    cmd = 'IncRename',
    config = true,
  },

  -- create annotations with one keybind, and jump your cursor in the inserted annotation
  {
    'danymat/neogen',
    keys = {
      {
        '<leader>cc',
        function()
          require('neogen').generate({})
        end,
        desc = 'Neogen Comment',
      },
    },
    opts = { snippet_engine = 'luasnip' },
  },

  -- python venv selector
  -- refer: https://www.bilibili.com/video/BV1KD421p7Lv/?spm_id_from=333.1245.0.0&vd_source=857ae8fbced0ce6b196b0b0b931e3d87
  -- need create pyproject.toml in project dir
  {
    'linux-cultist/venv-selector.nvim',
    event = 'LazyFile',
    dependencies = {
      'neovim/nvim-lspconfig',
      'nvim-telescope/telescope.nvim',
      'mfussenegger/nvim-dap-python',
    },
    keys = {
      { '<leader>cv', '<cmd>VenvSelect<cr>' },
      { '<leader>cV', '<cmd>VenvSelectCached<cr>' },
    },
    opts = {},
  },
}
