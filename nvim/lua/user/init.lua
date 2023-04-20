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
}
