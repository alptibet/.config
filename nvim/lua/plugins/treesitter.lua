return {
  'nvim-treesitter/nvim-treesitter',
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "TSUpdateSync" },
  opts = {
    highlight = { enable = true },
    indent = { enable = true },
    ensure_installed = {
      "html",
      "javascript",
      "json",
      "lua",
      "tsx",
      "typescript",
      "vim",
      "css"
    },
  },
  config = function(_, opts) require("nvim-treesitter.configs").setup(opts) end
}
