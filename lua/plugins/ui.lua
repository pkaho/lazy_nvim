return {
  {
    "akinsho/bufferline.nvim",
    keys = {
      { "<leader>bc", "<cmd>BufferLinePick<cr>", "choice buffer" },
    },
  },

  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = [[]]
        }
      },
    },
  },
}
