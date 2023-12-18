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
  {
    "marko-cerovac/material.nvim",
    config = function()
      require("material").setup({
        disable = {
          background = true,
          borders = false,
        },
        lualine_style = "stealth"
      })
    end
  }
}
