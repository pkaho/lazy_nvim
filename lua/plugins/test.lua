return {
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    event = "BufRead",
    keys = {
      {
        "zR",
        function()
          require("ufo").openAllFolds()
        end,
        desc = "Open all folds",
      },
      {
        "zM",
        function()
          require("ufo").closeAllFolds()
        end,
        desc = "Close all folds",
      },
      {
        "zK",
        function()
          local winid = require("ufo").peekFoldedLinesUnderCursor()
          if not winid then
            vim.lsp.buf.hover()
          end
        end,
        desc = "Peek folded lines under cursor",
      },
    },
    config = function()
      vim.o.foldcolumn = "1"
      vim.o.foldlevel = 90
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
      require("ufo").setup({
        open_fold_hl_timeout = 150,
        close_fold_kinds_for_ft = {
          default = { "imports", "comment" },
        },
        preview = {
          win_config = {
            border = { "", "─", "", "", "", "─", "", "" },
            winhighlight = "Normal:Folded",
            winblend = 0,
          },
          mappings = {
            scrollU = "<C-u>",
            scrollD = "<C-d>",
            jumpTop = "[",
            jumpBot = "]",
          },
        },
      })
    end,
  },
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
