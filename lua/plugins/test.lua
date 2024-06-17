return {
  -- org file
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
  },
  {
    "nvim-neorg/neorg",
    dependencies = { "luarocks.nvim" },
    opts = {},
  },

  -- Navigate and manipulate file system
  {
    "stevearc/oil.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    keys = {
      { "-", "<cmd>Oil --float<cr>", { desc = "Open parent directory" } },
    },
    opts = {},
  },

  -- disable list
  { "folke/tokyonight.nvim", enabled = false },
}
