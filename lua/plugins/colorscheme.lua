return {
  {
    'LazyVim/LazyVim',
    opts = {
      -- colorscheme = 'catppuccin',
      -- colorscheme = 'rose-pine',
      colorscheme = 'gruvbox',
    },
  },

  -- gruvbox
  { 'ellisonleao/gruvbox.nvim' },

  -- catppuccin
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    opts = {
      flavour = 'mocha',   -- auto, latte, frappe, macchiato, mocha
      dim_inactive = {
        enabled = true,    -- dims the background color of inactive window
        shade = 'dark',
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
      },
      integrations = {
        telescope = {
          style = 'nvchad',
        },
      },
    },
  },

  -- rose-pine
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    opts = {
      variant = 'moon', -- auto, main, moon, or dawn
      dim_inactive_windows = true,
      style = {
        bold = true,
        italic = true,
        transparency = false,
      },
    },
  },
}
