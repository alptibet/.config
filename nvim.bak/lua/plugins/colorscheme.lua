return {
  {
    "aktersnurra/no-clown-fiesta.nvim",
    config = function()
      require("no-clown-fiesta").setup({
        transparent = true,
      })
    end
  },
  {
    'deparr/tairiki.nvim',
    lazy = false,
    priority = 1000, -- only necessary if you use tairiki as default theme
    config = function()
      require('tairiki').setup {
        transparent = true
      }
    end,
  }
}