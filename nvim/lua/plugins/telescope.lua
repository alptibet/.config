return {
  "nvim-telescope/telescope.nvim",
  opts = function(_, opts)
    local telescope = require("telescope")

    -- Add ignore patterns
    opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
      file_ignore_patterns = {
        "node_modules",
        ".git",
      },
    })

    -- If you want to ignore in live_grep (ripgrep) as well
    opts.pickers = vim.tbl_deep_extend("force", opts.pickers or {}, {
      live_grep = {
        additional_args = function()
          return { "--glob", "!**/node_modules/*" }
        end,
      },
    })

    return opts
  end,
}
