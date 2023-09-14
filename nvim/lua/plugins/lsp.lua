return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "glepnir/lspsaga.nvim" },
    { "onsails/lspkind.nvim" },
    {
      "jay-babu/mason-nvim-dap.nvim",
      dependencies = { "mfussenegger/nvim-dap" },
    },
  },

  config = function()
    local Mason = require("mason")
    local MasonLspConfig = require("mason-lspconfig")
    local MasonNvimDap = require("mason-nvim-dap")
    local LspConfig = require("lspconfig")
    local CmpNvimLsp = require("cmp_nvim_lsp")
    local Navic = require("nvim-navic")

    vim.api.nvim_create_autocmd("LspAttach", {
      desc = "LSP actions",
      callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
        vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
        vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
        vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
        vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
        vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
        vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
        vim.keymap.set("n", "<leader>R", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
        vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
        vim.keymap.set("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
        vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
        vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>", opts)
        vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>", opts)
      end,
    })

    Mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    MasonLspConfig.setup({
      ensure_installed = {
        "lua_ls",
        "cssls",
        "html",
        "rust_analyzer",
        "tsserver",
      },
    })

    MasonNvimDap.setup({
      ensure_installed = { "node2", "js-debug-adapter" },
      handlers = {}, -- sets up dap in the predefined manner
    })

    local capabilities = CmpNvimLsp.default_capabilities()
    local on_attach = function(client, bufnr)
      if client.server_capabilities.documentSymbolProvider then
        Navic.attach(client, bufnr)
      end
    end

    LspConfig.tsserver.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      root_dir = require("lspconfig.util").root_pattern(".git"),
    })

    LspConfig.rust_analyzer.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        ["rust-analyzer"] = {
          hint = { enable = true },
          cargo = {
            loadOutDirsFromCheck = true,
            features = "all",
          },
          checkOnSave = {
            command = "clippy",
          },
          procMacro = {
            enable = true,
          },
        },
      },
    })

    LspConfig.eslint.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    LspConfig.html.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    LspConfig.marksman.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    LspConfig.lua_ls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
    })

    LspConfig.cssls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    LspConfig.tailwindcss.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    LspConfig.emmet_language_server.setup({
      filetypes = {
        "css",
        "eruby",
        "html",
        "javascript",
        "javascriptreact",
        "less",
        "sass",
        "scss",
        "svelte",
        "pug",
        "typescriptreact",
        "vue",
      },
      init_options = {
        --- @type table<string, any> https://docs.emmet.io/customization/preferences/
        preferences = {},
        --- @type "always" | "never" defaults to `"always"`
        showexpandedabbreviation = "always",
        --- @type boolean defaults to `true`
        showabbreviationsuggestions = true,
        --- @type boolean defaults to `false`
        showsuggestionsassnippets = false,
        --- @type table<string, any> https://docs.emmet.io/customization/syntax-profiles/
        syntaxprofiles = {},
        --- @type table<string, string> https://docs.emmet.io/customization/snippets/#variables
        variables = {},
        --- @type string[]
        excludelanguages = {},
      },
    })
  end,
}
