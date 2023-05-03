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
      "AlexvZyl/nordic.nvim",
      lazy = false,
      priority = 1000,
      opts = {
        theme = "onedark",
        bold_keywords = false,
        italic_comments = true,
        transparent_bg = false,
        bright_border = true,
        nordic = {
          reduced_blue = true,
        },
        onedark = {
          brighter_whites = true,
        },
        cursorline = {
          bold = false,
          theme = "light",
          hide_unfocused = true,
        },
        telescope = {
          style = "classic",
        },
      },
      config = function(_, opts) require("nordic").setup(opts) end,
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
  -- polish = {
  --   vim.on_key(nil, vim.api.nvim_get_namespaces()["auto_hlsearch"]),
  -- },
}
