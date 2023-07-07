return {
  "SmiteshP/nvim-navic",
  lazy = true,
  init = function()
    local navic = require("nvim-navic")
    require("lspconfig").tsserver.setup {
      on_attach = function(client, bufnr)
        navic.attach(client, bufnr)
      end
    }
  end,
  opts = function()
    return {
      highlights = true,
      seperator = " ",
      depth_limit = 5
    }
  end,
}
