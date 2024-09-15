return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
      -- colorscheme = "rose-pine",
      -- colorscheme = "gruvbox",
      -- colorscheme = "cyberdream",
      -- colorscheme = "flexoki-dark", -- flexoki-dark, flexoki-light
      -- colorscheme = "nord",
    },
  },

  -- gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    event = "VeryLazy",
    opts = {
      dim_inactive = true,
      transparent_mode = false,
    },
  },

  -- catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    opts = {
      flavour = "mocha", -- auto, latte, frappe, macchiato, mocha
      dim_inactive = {
        enabled = true, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
      },
    },
  },

  -- rose-pine
  {
    "rose-pine/neovim",
    event = "VeryLazy",
    name = "rose-pine",
    opts = {
      variant = "moon", -- auto, main, moon, or dawn
      dim_inactive_windows = true,
      style = {
        bold = true,
        italic = true,
        transparency = false,
      },
    },
  },

  -- cyberdream
  {
    "scottmckendry/cyberdream.nvim",
    event = "VeryLazy",
    dependencies = {
      "mawkler/modicator.nvim",
      enabled = true,
    },
    lazy = false,
    priority = 1000,
    opts = {
      transparent = false,
      italic_comments = true,
      theme = {
        variant = "auto", -- default, auto, light
      },
    },
  },

  -- flexoki
  {
    "kepano/flexoki-neovim",
    event = "VeryLazy",
    name = "flexoki",
  },

  -- nord
  {
    event = "VeryLazy",
    "shaunsingh/nord.nvim",
  },
}
