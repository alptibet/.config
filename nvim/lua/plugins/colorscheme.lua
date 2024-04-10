return {
  {
    "aktersnurra/no-clown-fiesta.nvim",
    config = function()
      require("no-clown-fiesta").setup({
        transparent = true,
      })
    end
  },
  { "RRethy/nvim-base16" }
}
