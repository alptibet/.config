return {
  "jose-elias-alvarez/null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "mason.nvim" },
  config = function()
    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting
    local sources = {
      formatting.prettierd,
      formatting.stylua
    }
    null_ls.setup {
      sources = sources
    }
  end
}
