return {
  -- Use <tab> for completion and snippets (supertab)
  -- first: disable default <tab> and <s-tab> behavior in LuaSnip
  {
    'L3MON4D3/LuaSnip',
    keys = function()
      return {}
    end,
    config = function()
      -- add custom snippets
      -- refer: https://github.com/LazyVim/LazyVim/discussions/54#discussioncomment-4675882
      -- refer: https://zjp-cn.github.io/neovim0.6-blogs/nvim/luasnip/doc1.html
      -- package.json
      -- refer: https://github.com/rafamadriz/friendly-snippets/blob/main/package.json
      local snippets_path = vim.fn.stdpath('config') .. '/lua/config/snippets'
      require('luasnip.loaders.from_vscode').load({ paths = snippets_path })
      require('luasnip.loaders.from_lua').load({ paths = snippets_path })
    end
  },
  -- then: setup supertab in cmp
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-emoji',
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
      end

      local luasnip = require('luasnip')
      local cmp = require('cmp')

      opts.mapping = vim.tbl_extend('force', opts.mapping, {
        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- this way you will only jump inside the snippet region
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { 'i', 's' }),
      })

      -- add sources
      opts.sources = vim.tbl_extend('force', opts.sources, {
        { name = 'codeium' },
      })

      -- override sources
      -- opts.sources = cmp.config.sources({
      --   { name = 'nvim_lsp' },
      --   { name = 'luasnip' },
      --   { name = 'path' },
      --   { name = 'buffer' },
      --   { name = 'codeium' },
      -- })
    end,
  },
}
