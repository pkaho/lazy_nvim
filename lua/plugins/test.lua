return {
  {
    "sindrets/diffview.nvim",
    opts = {},
  },

  -- orgmode
  -- refer: https://zhuanlan.zhihu.com/p/648802316
  {
    "nvim-orgmode/orgmode",
    event = "VeryLazy",
    ft = { "org" },
    opts = {
      org_agenda_files = "~/Documents/org/*",
      org_default_notes_file = "~/Documents/refile.org",
      org_capture_templates = {
        T = { description = "Task", template = "* TODO %?\n SCHEDULED: %t" },
        t = "TODO",
        tv = {
          description = "Vim Tasks",
          template = "* TODO %?\n SCHEDULED: %t",
          target = "~/Documents/org/vim.org",
        },
        ta = {
          description = "AdSystem Tasks",
          template = "* TODO %?\n SCHEDULED: %t",
          target = "~/Documents/org/adsystem.org",
        },
        tb = {
          description = "AdSystem Tasks",
          template = "* TODO %?\n SCHEDULED: %t",
          target = "~/Documents/org/blog.org",
        },
        ts = {
          description = "Study Tasks",
          template = "* TODO %?\n SCHEDULED: %t",
          target = "~/Documents/org/study.org",
        },
      },
    },
  },

  -- disable list
  { "folke/tokyonight.nvim", enabled = false },
}
