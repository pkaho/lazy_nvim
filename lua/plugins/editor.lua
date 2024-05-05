return {
  -- edgy remove left
  {
    'folke/edgy.nvim',
    opts = function(_, opts)
      opts.left = nil
    end
  },

  -- color highlighter
  {
    'norcalli/nvim-colorizer.lua',
    opts = { '*' },
  },

  -- neo-tree
  {
    'nvim-neo-tree/neo-tree.nvim',
    dependencies = {
      's1n7ax/nvim-window-picker',
    },
    keys = {
      {
        -- refer: https://github.com/AstroNvim/AstroNvim/blob/main/lua/astronvim/plugins/neo-tree.lua
        '<leader>o',
        function()
          if vim.bo.filetype == 'neo-tree' then
            vim.cmd.wincmd 'p'
          else
            vim.cmd.Neotree 'focus'
          end
        end,
        desc = 'Toggle Explorer Focus',
      },
      { '<leader>co', '<cmd>Neotree float document_symbols<cr>', desc = 'Symbols (Neotree)' },
    },

    opts = {
      window = {
        position = 'left',
        mappings = {
          -- refer: https://github.com/nvim-neo-tree/neo-tree.nvim?tab=readme-ov-file#longer-example-for-packer
          ['w'] = 'open_with_window_picker', -- need install 's1n7ax/nvim-window-picker'

          -- Switch between different views
          -- refer: https://github.com/nvim-neo-tree/neo-tree.nvim/wiki/Recipes#switch-between-filesystem-buffers-and-git_status
          ['e'] = { function() vim.api.nvim_exec('Neotree focus filesystem', true) end, desc = 'focus_filesystem' },
          ['b'] = { function() vim.api.nvim_exec('Neotree focus buffers', true) end, desc = 'focus_buffers' },
          ['g'] = { function() vim.api.nvim_exec('Neotree focus git_status', true) end, desc = 'focus_git_status' },

          -- Navigationwith HJKL
          -- refer: https://github.com/nvim-neo-tree/neo-tree.nvim/discussions/163#discussioncomment-4747082
          ['h'] = {
            function(state)
              local node = state.tree:get_node()
              if (node.type == 'directory' or node:has_children()) and node:is_expanded() then
                state.commands.toggle_node(state)
              else
                require('neo-tree.ui.renderer').focus_node(state, node:get_parent_id())
              end
            end,
            desc = 'parent_or_close',
          },
          ['l'] = {
            function(state)
              local node = state.tree:get_node()
              if node.type == 'directory' or node:has_children() then
                if not node:is_expanded() then
                  state.commands.toggle_node(state)
                else
                  require('neo-tree.ui.renderer').focus_node(state, node:get_child_ids()[1])
                end
              end
            end,
            desc = 'chlid_or_open',
          },

          -- Go to first/last sibling
          -- refer: https://github.com/nvim-neo-tree/neo-tree.nvim/discussions/220
          ["J"] = {
            function(state)
              local tree = state.tree
              local node = tree:get_node()
              local siblings = tree:get_nodes(node:get_parent_id())
              local renderer = require('neo-tree.ui.renderer')
              renderer.focus_node(state, siblings[#siblings]:get_id())
            end,
            desc = 'go_to_last_sibling',
          },
          ["K"] = {
            function(state)
              local tree = state.tree
              local node = tree:get_node()
              local siblings = tree:get_nodes(node:get_parent_id())
              local renderer = require('neo-tree.ui.renderer')
              renderer.focus_node(state, siblings[1]:get_id())
            end,
            desc = 'go_to_first_sibling',
          },

          -- Open file without losing sidebar focus
          -- refer: https://github.com/nvim-neo-tree/neo-tree.nvim/wiki/Tips
          ['<tab>'] = {
            function(state)
              state.commands['open'](state)
              vim.cmd('Neotree reveal')
            end,
            desc = 'open_file_without_losing_sidebar_focus',
          },

          -- Preview mode
          ['P'] = { 'toggle_preview', config = { use_float = true, use_image_nvim = true } },
        },
      }
    }
  },

  -- toggle zen mode
  {
    'folke/zen-mode.nvim',
    event = 'LazyFile',
    cmd = 'ZenMode',
    opts = {},
    keys = {
      { '<leader>z', '<cmd>ZenMode<CR>', desc = 'Zen Mode' },
    },
  },

  -- dims inactive portions, pairs well with zen-mode
  {
    'folke/twilight.nvim',
    event = 'LazyFile',
    keys = {
      { '<leader>ct', '<cmd>Twilight<cr>', desc = 'Twilight' },
    },
  },

  -- align text interactively
  {
    'echasnovski/mini.align',
    event = 'LazyFile',
    opts = {
      mappings = {
        start = 'ga',
        start_with_preview = 'gA',
      },
    },
  },

  -- git blame
  {
    'f-person/git-blame.nvim',
    event = 'LazyFile',
    opts = {},
  },

  -- rainbow brackets
  {
    'hiphish/rainbow-delimiters.nvim',
    event = 'LazyFile',
    config = function()
      require('rainbow-delimiters.setup').setup {
        strategy = {
          -- [''] = rainbow_delimiters.strategy['global'],
          -- vim = rainbow_delimiters.strategy['local'],
        },
        query = {
          [''] = 'rainbow-delimiters',
          lua = 'rainbow-blocks',
        },
        priority = {
          [''] = 110,
          lua = 210,
        },
        highlight = {
          'RainbowDelimiterBlue',
          'RainbowDelimiterYellow',
          'RainbowDelimiterOrange',
          'RainbowDelimiterGreen',
          'RainbowDelimiterViolet',
          -- 'RainbowDelimiterCyan',
          -- 'RainbowDelimiterRed',
        },
      }
    end,
  },

  -- removes trailing white space and empty lines at EOF
  {
    'mcauley-penney/tidy.nvim',
    event = 'VeryLazy',
    keys = {
      { '<leader>cw', function() require('tidy').run() end,    desc = 'Tidy Run' },
      { '<leader>cW', function() require('tidy').toggle() end, desc = 'Tidy Toggle' },
    },
    opts = {
      filetype_exclude = { 'markdown', 'diff' },
    },
  },
}
