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
    "mbbill/undotree"
  }

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
}
