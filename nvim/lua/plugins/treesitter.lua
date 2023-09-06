return {
  "nvim-treesitter/nvim-treesitter",
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
      "css",
    },
    autotag = {
      enable = true,
      enable_rename = true,
      enable_close = true,
      enable_close_on_slash = false,
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
