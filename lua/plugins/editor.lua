return {
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
