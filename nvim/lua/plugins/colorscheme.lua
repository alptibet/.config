return {
  {
    "rebelot/kanagawa.nvim",
    config = function()
      require("kanagawa").setup({
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = "none",
              },
            },
          },
        },
      })
    end,
  },
  -- {
  --   "marko-cerovac/material.nvim",
  --   config = function()
  --     require("material").setup({
  --       disable = {
  --         background = true,
  --         borders = false,
  --       },
  --       lualine_style = "stealth",
  --       plugins = {
  --         "fidget",
  --         "mini",
  --         "illuminate",
  --         "indent-blankline",
  --         "lspsaga",
  --         "nvim-cmp",
  --         "nvim-navic",
  --         "nvim-web-devicons",
  --         "telescope",
  --         "trouble"
  --       }
  --     })
  --   end
  -- },
  {
    "aktersnurra/no-clown-fiesta.nvim",
    config = function()
      require("no-clown-fiesta").setup({
        transparent = true,
      })
    end
  }
}
