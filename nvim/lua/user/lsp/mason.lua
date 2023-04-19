local status_ok, mason = pcall(require, "mason")
if not status_ok then
  return
end

local status_ok_1, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status_ok_1 then
  return
end

local servers = {
  "lua_ls",
  "rust_analyzer",
  "cssls",
  "cssmodules_ls",
  "html",
  "tsserver",
  "jsonls",
  "emmet_ls",
  "svelte"
}

local settings = {
  ui = {
    border = "rounded",
  },
  log_level = vim.log.levels.INFO,
  max_concurrent_installers = 4,
}

mason.setup(settings)
mason_lspconfig.setup {
  ensure_installed = servers,
  automatic_installation = true
}

local lsp_config_status_ok, lspconfig = pcall(require, "lspconfig")
if not lsp_config_status_ok then
  return
end

for _, server in pairs(servers) do
  opts = {
    on_attach = require("user.lsp.handlers").on_attach,
    capabilities = require("user.lsp.handlers").capabilities,
  }

  if server == "lua_ls" then
    local lua_ls_opts = require("user.lsp.settings.lua_ls")
    opts = vim.tbl_deep_extend("force", lua_ls_opts, opts)
    lspconfig.lua_ls.setup(opts)
    goto continue
  end

  if server == "json_ls" then
    local jsonls_opts = require("user.lsp.settings.jsonls")
    opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
    lspconfig.json_ls.setup(opts)
    goto continue
  end

  if server == "rust_analyzer" then
    local rust_options = require("user.lsp.settings.rust")
    opts = vim.tbl_deep_extend("force", rust_options, opts)
    lspconfig.rust_analyzer.setup(opts)
    goto continue
  end

  lspconfig[server].setup(opts)
  ::continue::
end
