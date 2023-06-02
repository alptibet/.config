return {
  colorscheme = "nightfox",
  lsp = {
    servers = { "rust_analyzer" },
    config = {
      rust_analyzer = {
        settings = {
          ["rust-analyzer"] = {
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
      },
    },
  },
  plugins = {
    {
      "kylechui/nvim-surround",
      version = "*", -- Use for stability; omit to use `main` branch for the latest features
      event = "VeryLazy",
      config = function()
        require("nvim-surround").setup {
          -- Configuration here, or leave empty to use defaults
        }
      end,
    },
    {
      "EdenEast/nightfox.nvim",
    },
    {
      "L3MON4D3/LuaSnip",
      dependencies = { "rafamadriz/friendly-snippets" },
      config = function(plugins, opts)
        require "plugins.configs.luasnip" (plugins, opts)
        require("luasnip.loaders.from_vscode").lazy_load()
      end,
    },
    {
      "VonHeikemen/fine-cmdline.nvim",
      keys = {
        { ":", "<cmd>FineCmdline<cr>", desc = "FineCmdLine" },
      },
      opts = {
        popup = {
          size = {
            width = "30%",
          },
        },
      },
    },
  },
  mappings = {
    n = {
      ["<CR>"] = { "ciw", desc = "change in word" },
    },
  },
}
