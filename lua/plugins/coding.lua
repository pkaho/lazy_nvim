return {
  -- A simple popup display that provides breadcrumbs feature
  {
    "SmiteshP/nvim-navbuddy",
    event = "LazyFile",
    dependencies = {
      "neovim/nvim-lspconfig",
      "SmiteshP/nvim-navic",
      "MunifTanjim/nui.nvim",
      "nvim-telescope/telescope.nvim",
    },
    keys = {
      { "<leader>cb", "<cmd>Navbuddy<cr>", desc = "Navbuddy" },
    },
    config = function()
      require("nvim-navbuddy").setup({
        window = {
          border = "rounded",
        },
        lsp = { auto_attach = true },
      })
    end,
  },

  -- use the `w,e,b` motions liake a spider
  {
    "chrisgrieser/nvim-spider",
    event = "LazyFile",
    config = function()
      require("spider").setup({
        skipInsignificantPunctuation = false,
      })
      vim.keymap.set({ "n", "o", "x" }, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
      vim.keymap.set({ "n", "o", "x" }, "e", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })
      vim.keymap.set({ "n", "o", "x" }, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })
      vim.keymap.set({ "n", "o", "x" }, "ge", "<cmd>lua require('spider').motion('ge')<CR>", { desc = "Spider-ge" })
    end,
  },

  -- TODO: add config
  {
    "mg979/vim-visual-multi",
    event = "VeryLazy",
    init = function()
      -- Multi-Cursor https://github.com/mg979/vim-visual-multi/blob/master/doc/vm-mappings.txt
      -- vim.g.VM_leader = "\\"
      vim.g.VM_theme = "purplegray"

      -- https://github.com/mg979/vim-visual-multi/wiki/Mappings#full-mappings-list
      vim.g.VM_set_statusline = 0 -- already set via lualine component
    end,
  },

  -- snippets, use nvim-snippets or LuaSnip
  -- If use LuaSnip, need to add LuaSnip Extra to LazyExtras
  {
    "garymjr/nvim-snippets",
    opts = {
      search_paths = { vim.fn.stdpath("config") .. "/lua/snippets" },
    },
  },
  -- {
  --   "L3MON4D3/LuaSnip",
  --   config = function()
  --     -- add custom snippets
  --     -- refer: https://github.com/LazyVim/LazyVim/discussions/54#discussioncomment-4675882
  --     -- refer: https://zjp-cn.github.io/neovim0.6-blogs/nvim/luasnip/doc1.html
  --     -- package.json
  --     -- refer: https://github.com/rafamadriz/friendly-snippets/blob/main/package.json
  --     local snippets_path = vim.fn.stdpath("config") .. "/lua/snippets"
  --     require("luasnip.loaders.from_lua").load({ paths = { snippets_path } })
  --   end,
  -- },

  -- setup supertab in cmp
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local cmp = require("cmp")

      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif vim.snippet.active({ direction = 1 }) then
            vim.schedule(function()
              vim.snippet.jump(1)
            end)
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif vim.snippet.active({ direction = -1 }) then
            vim.schedule(function()
              vim.snippet.jump(-1)
            end)
          else
            fallback()
          end
        end, { "i", "s" }),
      })

      -- add sources
      -- opts.sources = vim.tbl_extend("force", opts.sources, {
      --   { name = "codeium" },
      -- })

      -- override sources
      -- opts.sources = cmp.config.sources({
      --   { name = "codeium" },
      --   { name = "nvim_lsp" },
      --   { name = "luasnip" },
      --   { name = "path" },
      --   { name = "buffer" },
      -- })
    end,
  },

  -- toggle zen mode
  {
    "folke/zen-mode.nvim",
    event = "LazyFile",
    cmd = "ZenMode",
    opts = {},
    keys = {
      { "<leader>cz", "<cmd>ZenMode<CR>", desc = "Zen Mode" },
    },
  },

  -- dims inactive portions, pairs well with zen-mode
  {
    "folke/twilight.nvim",
    event = "LazyFile",
    keys = {
      { "<leader>ct", "<cmd>Twilight<cr>", desc = "Twilight" },
    },
  },

  -- align text interactively
  {
    "echasnovski/mini.align",
    event = "LazyFile",
    opts = {
      mappings = {
        start = "ga",
        start_with_preview = "gA",
      },
    },
  },

  -- removes trailing white space and empty lines at EOF
  {
    "mcauley-penney/tidy.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>cw",
        function()
          require("tidy").run()
        end,
        desc = "Tidy Run",
      },
      {
        "<leader>cW",
        function()
          require("tidy").toggle()
        end,
        desc = "Tidy Toggle",
      },
    },
    opts = {
      filetype_exclude = { "markdown", "diff" },
    },
  },

  -- splitting/joining blocks of code
  {
    "Wansmer/treesj",
    event = "LazyFile",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    keys = {
      { "<leader>cj", "<cmd>TSJToggle<cr>", desc = "Treesj Toggle" },
    },
    config = function()
      require("treesj").setup({
        use_default_keymaps = false,
      })
    end,
  },
}
