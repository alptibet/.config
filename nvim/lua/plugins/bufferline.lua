return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  config = function(_, opts) require("bufferline").setup(opts) end
}
