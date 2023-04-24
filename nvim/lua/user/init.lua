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
      --This will be removed after fix
      "nvim-neo-tree/neo-tree.nvim",
      opts = function(_, opts)
        opts.source_selector = {
          winbar = true, -- toggle to show selector on winbar
          statusline = false,
          sources = {
            { source = "filesystem" },
            { source = "buffers" },
            { source = "git_status" },
          },
        }
        return opts
      end,
    },
    {
      "EdenEast/nightfox.nvim",
    },
    {
      "nvim-neo-tree/neo-tree.nvim",
      opts = {
        filesystem = {
          filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = true,
            always_show = {
              ".env",
            },
            never_show = {
              ".DS_Store",
              "thumbs.db",
              "node_modules",
              ".parcel-cache",
              ".vscode",
              "target",
              ".git",
            },
          },
        },
      },
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
