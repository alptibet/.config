local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require "telescope.actions"
local fb_actions = require "telescope".extensions.file_browser.actions


telescope.setup {
  defaults = {

    file_ignore_patterns = { "target.*", "node%_modules.*", ".git/.*", ".DS_Store", ".parcel-cache" },
    prompt_prefix = " ",
    selection_caret = " ",
    path_display = { "smart" },

    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-c>"] = actions.close,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,
      },

      n = {
        ["<esc>"] = actions.close,
        ["<CR>"] = actions.select_default,
        ["<C-x>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
      },
    },
  },
  pickers = {
    live_grep = {
      theme = "dropdown",
    },
    grep_string = {
      theme = "dropdown",
      initial_mode = "normal"
    },
    find_files = {
      theme = "dropdown",
      hidden = true,
    },
    buffers = {
      theme = "dropdown",
      previewer = false,
      initial_mode = "normal",
    },
    lsp_references = {
      theme = "dropdown",
      initial_mode = "normal",
    },
    diagnostics = {
      theme = "dropdown",
      initial_mode = "normal"
    },
    lsp_definitions = {
      theme = "dropdown",
      initial_mode = "normal",
    },
    lsp_declarations = {
      theme = "dropdown",
      initial_mode = "normal",
    },
    lsp_implementations = {
      theme = "dropdown",
      initial_mode = "normal",
    },
  },
  extensions = {
    file_browser = {
      hidden = true,
      hijack_nwtree= true,
      initial_mode = 'normal',
      cwd_to_path = true,
      path = "%:p:h",
      mappings = {
        ['i'] = {
          ['<C-n>'] = fb_actions.create,
          ['<C-d>'] = fb_actions.remove,
          ['<C-r>'] = fb_actions.rename,
          ['<C-y>'] = fb_actions.copy,
          ['<C-h>'] = fb_actions.toggle_hidden,
          ['C-/'] = fb_actions.goto_parent_dir,
        },
        ['n'] = {
          ['n'] = fb_actions.create,
          ['d'] = fb_actions.remove,
          ['y'] = fb_actions.copy,
          ['h'] = fb_actions.toggle_hidden,
          ['/'] = fb_actions.goto_parent_dir,
        }
      }
    }
  },
}

telescope.load_extension("file_browser")
