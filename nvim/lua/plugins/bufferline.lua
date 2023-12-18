return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  config = function(_, opts)
    require("bufferline").setup({
      options =
      {
        indicator = {
          style = "none",
          diagnostics = "nvim_lsp"
        }
      }
    })
  end
}
