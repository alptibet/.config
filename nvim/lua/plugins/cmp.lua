return {
  "hrsh7th/nvim-cmp",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-cmdline" },
    { "saadparwaiz1/cmp_luasnip" },
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local snippets = require("luasnip.loaders.from_vscode")
    local cmp_select_opts = { behavior = cmp.SelectBehavior.Select }

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },

      -- performance = {
      --   debounce = 300,
      --   throttle = 30,
      -- },

      mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<A-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item(cmp_select_opts)
          elseif luasnip.jumpable(1) then
            luasnip.jump(1)
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif luasnip.expandable() then
            luasnip.expand()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item(cmp_select_opts)
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),

      -- Managing Sources for completions
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
        { name = "nvim_lsp_signature_help" },
      }, { { name = "buffer" } }),

      formatting = {
        fields = { "kind", "abbr" },
        format = function(entry, item)
          -- Define menu shorthand for different completion sources.
          local menu_icon = {
            nvim_lsp = "NLSP",
            nvim_lua = "NLUA",
            luasnip = "LSNP",
            buffer = "BUFF",
            path = "PATH",
          }
          -- Set the menu "icon" to the shorthand for each completion source.
          item.menu = menu_icon[entry.source.name]

          -- Set the fixed width of the completion menu to 60 characters.
          -- fixed_width = 20

          -- Set 'fixed_width' to false if not provided.
          fixed_width = fixed_width or false

          -- Get the completion entry text shown in the completion window.
          local content = item.abbr

          -- Set the fixed completion window width.
          if fixed_width then
            vim.o.pumwidth = fixed_width
          end

          -- Get the width of the current window.
          local win_width = vim.api.nvim_win_get_width(0)

          -- Set the max content width based on either: 'fixed_width'
          -- or a percentage of the window width, in this case 20%.
          -- We subtract 10 from 'fixed_width' to leave room for 'kind' fields.
          local max_content_width = fixed_width and fixed_width - 10 or math.floor(win_width * 0.2)

          -- Truncate the completion entry text if it's longer than the
          -- max content width. We subtract 3 from the max content width
          -- to account for the "..." that will be appended to it.
          if #content > max_content_width then
            item.abbr = vim.fn.strcharpart(content, 0, max_content_width - 3) .. "..."
          else
            item.abbr = content .. (" "):rep(max_content_width - #content)
          end
          return item
        end,
      },
    })

    -- Set configuration for specific filetype.
    cmp.setup.filetype("gitcommit", {
      sources = cmp.config.sources({
        { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
      }, {
        { name = "buffer" },
      }),
    })

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ "/", "?" }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        { name = "cmdline" },
      }),
    })

    -- for vscode like snippets
    snippets.lazy_load()
    luasnip.filetype_extend("javascript", { "javascriptreact" })
  end,
}
