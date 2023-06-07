return {
  colorscheme = "nordic",
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
      "AlexvZyl/nordic.nvim",
      lazy = false,
      priority = 1000,
      config = function() require("nordic").load() end,
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
      ["<Tab>"] = { ":bnext<CR>", desc = "next tab" },
      ["<S-Tab>"] = { ":bprevious<CR>", desc = "prev tab" },
    },
  },
}
