return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    auto_clean_after_session_restore = true,
    close_if_last_window = false,
    enable_git_status = true,
    enable_diagnostics = true,
    sources = { "filesystem", "buffers", "git_status", "document_symbols" },
    open_files_do_not_replace_types = { "terminal", "Trouble", "qf", "Outline" },
    default_component_configs = {
      indent = {
        with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
        expander_collapsed = "",
        expander_expanded = "",
        expander_highlight = "NeoTreeExpander",
      },
      icon = {
        folder_empty = "󰜌",
        folder_empty_open = "󰜌",
      },
      -- name = {
      --   trailing_slash = false,
      --   use_git_status_colors = true,
      --   highlight = "NeoTreeFileName",
      -- },
      git_status = {
        symbols = {
          renamed = "󰁕",
          unstaged = "󰄱",
        },
      },
    },
    commands = {
      parent_or_close = function(state)
        local node = state.tree:get_node()
        if (node.type == "directory" or node:has_children()) and node:is_expanded() then
          state.commands.toggle_node(state)
        else
          require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
        end
      end,
      child_or_open = function(state)
        local node = state.tree:get_node()
        if node.type == "directory" or node:has_children() then
          if not node:is_expanded() then -- if unexpanded, expand
            state.commands.toggle_node(state)
          else                           -- if expanded and has children, seleect the next child
            require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
          end
        else -- if not a directory just open it
          state.commands.open(state)
        end
      end,
    },
    filesystem = {
      follow_current_file = false,
      bind_to_cwd = true,
      hijack_netrw_behavior = "open_default",
      use_libuv_file_watcher = true,
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
        hide_by_name = { "node_modules" },
        never_show = { ".DS_Store" }
      }
    },
    window = {
      mappings = {
        ["<space>"] = false,
        ["<"] = "prev_source",
        [">"] = "next_source",
        h = "parent_or_close",
        l = "child_or_open"
      }
    }
  },
  config = function(_, opts)
    require("neo-tree").setup(opts)
  end
}
