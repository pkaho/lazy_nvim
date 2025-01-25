return {
  -- disable list
  { "folke/tokyonight.nvim", enabled = false },

  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
    opts = {},
  },

  {
    "amitds1997/remote-nvim.nvim",
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-telescope/telescope.nvim",
    },
    config = true,
  },

  {
    "mbbill/undotree",
    keys = {
      { "<leader><F5>", vim.cmd.UndotreeToggle, desc = "ToggleUndoTree" },
    },
  },

  -- task runner and jot management plugin
  -- {
  --   "stevearc/overseer.nvim",
  --   event = "VeryLazy",
  --   opts = {},
  -- },

  -- like Cursor AI IDE
  -- {
  --   "yetone/avante.nvim",
  --   event = "VeryLazy",
  --   lazy = false,
  --   opts = {},
  -- },

  -- A Neovim plugin that displays interactive vertical scrollbars and signs.
  {
    "dstein64/nvim-scrollview",
    opts = {
      excluded_filetypes = { "nerdtree" },
      current_only = true,
      base = "right",
      column = 1,
      signs_on_startup = { "all" },
      diagnostics_severities = { vim.diagnostic.severity.ERROR },
      consider_border = true,
    },
  },
}
