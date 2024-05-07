return {
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
