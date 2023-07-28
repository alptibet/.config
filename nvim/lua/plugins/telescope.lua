return {
  "nvim-telescope/telescope.nvim",
  tag = '0.1.2',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'BurntSushi/ripgrep'
  },
  cmd = "Telescope",
  event = "VeryLazy",
  config = function()
    require('telescope').setup({
      mappings = {
        i = {
          ["<C-k>"] = require('telescope.actions').move_selection_next,
          ["<C-j>"] = require('telescope.actions').move_selection_previous,
          ["<C-c>"] = require('telescope.actions').close,
          ["<C-u>"] = false
        }
      },
      pickers = {
        find_files = {
          theme = "dropdown"
        },
        live_grep = {
          theme = "dropdown"
        },
        grep_string = {
          theme = "dropdown"
        },
        buffers = {
          theme = "dropdown"
        },
        marks = {
          theme = "dropdown"
        },
        lsp_references = {
          theme = "dropdown",
          initial_mode = "normal"
        },
        diagnostics = {
          theme = "dropdown"
        }
      }
    })
  end
}
