return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      {
        'williamboman/mason.nvim',
        build = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      {
        'L3MON4D3/LuaSnip',
        dependencies = { "rafamadriz/friendly-snippets" }
      },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'saadparwaiz1/cmp_luasnip' }

    },
    config = function()
      local lsp = require('lsp-zero').preset('recommended')

      lsp.on_attach(function(client, bufnr)
        lsp.default_keymaps({ buffer = bufnr })
      end)

      lsp.set_sign_icons({
        error = '✘',
        warn = '▲',
        hint = '⚑',
        info = '»'
      })

      lsp.format_on_save({
        format_opts = {
          async = false,
          timeout_ms = 10000
        },
        servers = {
          ['lua_ls'] = { 'lua' },
          ['rust_analyzer'] = { 'rust' },
          ['null-ls'] = { 'javascript', 'typescript', 'javascriptreact' }
        }
      })

      require('lspconfig').lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' }
            }
          }
        }
      })

      require('lspconfig').rust_analyzer.setup({
        settings = {
          ['rust-analyzer'] = {
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
          }
        }
      })

      lsp.setup()

      local cmp = require('cmp')
      local cmp_action = require('lsp-zero').cmp_action()
      local cmp_select_opts = { behavior = cmp.SelectBehavior.Select }
      require('luasnip.loaders.from_vscode').lazy_load()

      cmp.setup({
        preselect = 'item',
        completion = {
          completeopt = 'menu,menuone,noinsert'
        },
        sources = {
          { name = 'buffer',  keyword_length = 3 },
          { name = 'nvim_lsp' },
          { name = 'luasnip', keyword_length = 2 },
          { name = 'path' },
        },
        mapping = {
          -- `Enter` key to confirm completion
          ['<Space>'] = cmp.mapping.confirm({ select = false }),
          ["<Tab>"] = cmp.mapping(function()
            if cmp.visible() then
              cmp.select_next_item(cmp_select_opts)
            else
              cmp.complete()
            end
          end),
          ["<S-Tab>"] = cmp.mapping(function()
            if cmp.visible() then
              cmp.select_prev_item(cmp_select_opts)
            else
              cmp.complete()
            end
          end),

          -- Alt+Space to trigger completion menu
          ['<A-Space>'] = cmp.mapping.complete(),

          -- Navigate between snippet placeholder
          ['<C-f>'] = cmp_action.luasnip_jump_backward,
          ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        }
      })
    end
  }
}
