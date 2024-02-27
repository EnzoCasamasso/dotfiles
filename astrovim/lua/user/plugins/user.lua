return {
  {
    "rebelot/kanagawa.nvim",
    config = function()
      local kanagawa = require "kanagawa"
      kanagawa.setup {
        theme = "wave",
        transparent = false,
      }
    end,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "tiagovla/tokyodark.nvim",
    opts = {
      -- custom options here
    },
    config = function(_, opts)
      require("tokyodark").setup(opts) -- calling setup is optional
      vim.cmd [[colorscheme tokyodark]]
    end,
  },
}
