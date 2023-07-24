return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = {
    icons_enabled = true,
    theme = 'auto',
  },
  config = function(_, opts)
    require('lualine').setup(opts)
  end
}
