return {
  {
    "nvimdev/dashboard-nvim",
    opts = function(_, opts)
      local logo = [[
    ]]
      logo = string.rep("\n", 8) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
      opts.theme = "doom"
    end,
  },

  {
    "akinsho/bufferline.nvim",
    keys = {
      { "<leader>bc", "<cmd>BufferLinePick<cr>", "choice buffer" },
    },
  },
}
