return {
  "max397574/better-escape.nvim",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    mapping = { 'jk', 'kj' },
    timeout = 300,
  },
  config = function(_, opts)
    require("better_escape").setup(opts)
  end,
}
