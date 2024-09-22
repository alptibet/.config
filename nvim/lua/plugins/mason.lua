return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "eslint-lsp",
        "prettierd",
        "stylua",
        "delve",
        "sql-formatter",
        "gopls",
        "golangci-lint",
      },
    },
  },
}
