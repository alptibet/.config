return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "TSUpdateSync" },
  opts = {
    context_commentstring = {
      enable = true,
    },
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
    vim.g.skip_ts_context_commentstring_module = true
    require("nvim-treesitter.configs").setup(opts)
    require("ts_context_commentstring").setup()
  end,
}
