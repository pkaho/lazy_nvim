return {
  {
    'LazyVim/LazyVim',
    opts = {
      colorscheme = 'catppuccin',
    },
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    opts = {
      flavour = 'mocha',   -- latte, frappe, macchiato, mocha, auto
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
}
