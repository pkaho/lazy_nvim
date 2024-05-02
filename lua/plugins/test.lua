return {
  -- python venv selector
  -- refer: https://www.bilibili.com/video/BV1KD421p7Lv/?spm_id_from=333.1245.0.0&vd_source=857ae8fbced0ce6b196b0b0b931e3d87
  -- need create pyproject.toml in project dir
  {
    'linux-cultist/venv-selector.nvim',
    event = 'LazyFile',
    dependencies = {
      'neovim/nvim-lspconfig',
      'nvim-telescope/telescope.nvim',
      'mfussenegger/nvim-dap-python',
    },
    keys = {
      { '<leader>cv', '<cmd>VenvSelect<cr>' },
      { '<leader>cV', '<cmd>VenvSelectCached<cr>' },
    },
    opts = {},
  },
}
