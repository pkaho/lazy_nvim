return {
  {
    'lukas-reineke/indent-blankline.nvim',
    opts = {
      scope = { show_start = true, show_end = true },
    }
  },

  {
    'nvimdev/dashboard-nvim',
    opts = function(_, opts)
      local logo = [[
██╗  ██╗███████╗██╗     ██╗██╗  ██╗
██║  ██║██╔════╝██║     ██║╚██╗██╔╝
███████║█████╗  ██║     ██║ ╚███╔╝
██╔══██║██╔══╝  ██║     ██║ ██╔██╗
██║  ██║███████╗███████╗██║██╔╝ ██╗
╚═╝  ╚═╝╚══════╝╚══════╝╚═╝╚═╝  ╚═╝
      ]]
      logo = string.rep('\n', 8) .. logo .. '\n\n'

      opts.config.header = vim.split(logo, '\n')
      opts.theme = 'doom'
    end
  },
}
