return {
  {
    'norcalli/nvim-colorizer.lua',
    opts = { '*' },
  },
  {
    'ziontee113/color-picker.nvim',
    event = 'VeryLazy',
    keys = {
      {
        '<leader>p', '<cmd>PickColor<cr>', desc = 'PickColor'
      },
    },
    opts = {
      ['icons'] = { '#', '' },
      ["border"] = "rounded", -- none | single | double | rounded | solid | shadow
      ["keymap"] = {          -- mapping example:
        ["U"] = "<Plug>ColorPickerSlider5Decrease",
        ["O"] = "<Plug>ColorPickerSlider5Increase",
      },
      ["background_highlight_group"] = "Normal",  -- default
      ["border_highlight_group"] = "FloatBorder", -- default
      ["text_highlight_group"] = "Normal",        --default
    },
  },
}
