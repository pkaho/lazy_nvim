return {
  -- project manager
  {
    "ahmedkhalf/project.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>P", "<cmd>lua require('telescope').extensions.projects.projects()<cr>", desc = "Projects Manager" },
    },
    config = function()
      require("project_nvim").setup({
        active = true,
        on_config_done = nil,
        manual_mode = false,
        detection_methods = { "pattern" },
        patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "pom.xml" },
        ignore_lsp = {},
        exclude_dirs = {},
        show_hidden = false,
        silent_chdir = true,
        scope_chdir = "global",
      })
    end,
  },

  -- git
  {
    "neogitorg/neogit",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
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
    "ThePrimeagen/refactoring.nvim",
    keys = {
      {
        "<leader>r",
        function()
          require("refactoring").selector_refactor()
        end,
        desc = "Refactoring tool",
        mode = "v",
      },
    },
    opts = {},
  },

  -- Incremental rename
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    config = true,
  },

  -- create annotations with one keybind, and jump your cursor in the inserted annotation
  {
    "danymat/neogen",
    keys = {
      {
        "<leader>cc",
        function()
          require("neogen").generate({})
        end,
        desc = "Neogen Comment",
      },
    },
    opts = { snippet_engine = "luasnip" },
  },

  -- python venv selector
  -- refer: https://www.bilibili.com/video/BV1KD421p7Lv/?spm_id_from=333.1245.0.0&vd_source=857ae8fbced0ce6b196b0b0b931e3d87
  -- need create pyproject.toml in project dir
  {
    "linux-cultist/venv-selector.nvim",
    event = "LazyFile",
    branch = "regexp",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-telescope/telescope.nvim",
      "mfussenegger/nvim-dap-python",
    },
    keys = {
      { "<leader>cv", "<cmd>VenvSelect<cr>" },
      { "<leader>cV", "<cmd>VenvSelectCached<cr>" },
    },
    opts = {},
  },

  -- disable list
  { "folke/tokyonight.nvim", enable = false },
}
