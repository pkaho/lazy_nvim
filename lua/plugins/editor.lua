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

  -- top right filename
  -- refer: https://github.com/LazyVim/LazyVim/discussions/1188#discussioncomment-6516567
  {
    "b0o/incline.nvim",
    event = "BufReadPre",
    enabled = true,
    keys = {
      {
        "<leader>ua",
        function()
          require("incline").toggle()
        end,
        desc = "toggle incline"
      }
    },
    config = function()
      -- local colors = require("tokyonight.colors").setup()
      -- local colors = require("catppuccin.palettes.mocha")
      -- local colors = require("gruvbox").palette
      require("incline").setup({
        highlight = {
          groups = {
            InclineNormal = { guibg = "#ff8f5f", guifg = "#000000" },
            InclineNormalNC = { guifg = "#ff8f5f", guibg = "#000000" },
          },
        },
        window = { margin = { vertical = 0, horizontal = 1 } },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          local icon, color = require("nvim-web-devicons").get_icon_color(filename)
          return { { icon, guifg = color }, { " " }, { filename } }
        end,
      })
    end,
  },

  -- peek lines of the buffer
  {
    "nacro90/numb.nvim",
    event = "VeryLazy",
    opts = {
      show_numbers = true,
      show_curosrline = true,
    },
  },

  -- edgy remove left
  {
    "folke/edgy.nvim",
    opts = function(_, opts)
      opts.left = { "None" }
    end,
  },

  -- colorizer and picker
  {
    "norcalli/nvim-colorizer.lua",
    opts = { "*" },
  },
  {
    "uga-rosa/ccc.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>cp",
        "<cmd>CccPick<cr>",
        desc = "ColorPick",
      },
    },
    opts = {},
  },

  -- neo-tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "s1n7ax/nvim-window-picker",
    },
    keys = {
      {
        -- refer: https://github.com/AstroNvim/AstroNvim/blob/main/lua/astronvim/plugins/neo-tree.lua
        "<leader>fo",
        function()
          if vim.bo.filetype == "neo-tree" then
            vim.cmd.wincmd("p")
          else
            vim.cmd.Neotree("focus")
          end
        end,
        desc = "Toggle Explorer Focus",
      },
      { "<leader>cs", "<cmd>Neotree float document_symbols<cr>", desc = "Symbols (Neotree)" },
    },

    opts = {
      sources = { "filesystem", "buffers", "git_status", "document_symbols" },
      window = {
        position = "left",
        mappings = {
          -- refer: https://github.com/nvim-neo-tree/neo-tree.nvim?tab=readme-ov-file#longer-example-for-packer
          ["w"] = "open_with_window_picker", -- need install "s1n7ax/nvim-window-picker"

          -- Switch between different views
          -- refer: https://github.com/nvim-neo-tree/neo-tree.nvim/wiki/Recipes#switch-between-filesystem-buffers-and-git_status
          ["e"] = {
            function()
              vim.api.nvim_exec2("Neotree focus filesystem", { output = true })
            end,
            desc = "focus_filesystem",
          },
          ["b"] = {
            function()
              vim.api.nvim_exec2("Neotree focus buffers", { output = true })
            end,
            desc = "focus_buffers",
          },
          ["g"] = {
            function()
              vim.api.nvim_exec2("Neotree focus git_status", { output = true })
            end,
            desc = "focus_git_status",
          },
          ["~"] = {
            function()
              vim.api.nvim_exec2("Neotree focus document_symbols", { output = true })
            end,
            desc = "focus_symbols",
          },

          -- Navigationwith HJKL
          -- refer: https://github.com/nvim-neo-tree/neo-tree.nvim/discussions/163#discussioncomment-4747082
          ["h"] = {
            function(state)
              local node = state.tree:get_node()
              if (node.type == "directory" or node:has_children()) and node:is_expanded() then
                state.commands.toggle_node(state)
              else
                require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
              end
            end,
            desc = "parent_or_close",
          },
          ["l"] = {
            function(state)
              local node = state.tree:get_node()
              if node.type == "directory" or node:has_children() then
                if not node:is_expanded() then
                  state.commands.toggle_node(state)
                else
                  require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
                end
              end
            end,
            desc = "chlid_or_open",
          },

          -- Go to first/last sibling
          -- refer: https://github.com/nvim-neo-tree/neo-tree.nvim/discussions/220
          ["J"] = {
            function(state)
              local tree = state.tree
              local node = tree:get_node()
              local siblings = tree:get_nodes(node:get_parent_id())
              local renderer = require("neo-tree.ui.renderer")
              renderer.focus_node(state, siblings[#siblings]:get_id())
            end,
            desc = "go_to_last_sibling",
          },
          ["K"] = {
            function(state)
              local tree = state.tree
              local node = tree:get_node()
              local siblings = tree:get_nodes(node:get_parent_id())
              local renderer = require("neo-tree.ui.renderer")
              renderer.focus_node(state, siblings[1]:get_id())
            end,
            desc = "go_to_first_sibling",
          },

          -- Open file without losing sidebar focus
          -- refer: https://github.com/nvim-neo-tree/neo-tree.nvim/wiki/Tips
          ["<tab>"] = {
            function(state)
              state.commands["open"](state)
              vim.cmd("Neotree reveal")
            end,
            desc = "open_file_without_losing_sidebar_focus",
          },

          -- Preview mode
          ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
        },
      },
    },
  },

  -- git blame
  {
    "f-person/git-blame.nvim",
    event = "LazyFile",
    opts = {},
  },

  -- rainbow brackets
  {
    "hiphish/rainbow-delimiters.nvim",
    event = "LazyFile",
    config = function()
      require("rainbow-delimiters.setup").setup({
        strategy = {
          -- [""] = rainbow_delimiters.strategy["global"],
          -- vim = rainbow_delimiters.strategy["local"],
        },
        query = {
          [""] = "rainbow-delimiters",
          lua = "rainbow-blocks",
        },
        priority = {
          [""] = 110,
          lua = 210,
        },
        highlight = {
          "RainbowDelimiterBlue",
          "RainbowDelimiterYellow",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          -- "RainbowDelimiterCyan",
          -- "RainbowDelimiterRed",
        },
      })
    end,
  },
}
