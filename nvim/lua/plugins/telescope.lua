return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.2",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "BurntSushi/ripgrep",
    },
    cmd = "Telescope",
    event = "VeryLazy",
    config = function()
        require("telescope").setup({
            defaults = {
                layout_strategy = "horizontal",
                layout_config = {
                    horizontal = {
                        prompt_position = "top",
                        preview_width = 0.5,
                    },
                    width = 0.8,
                    height = 0.8,
                    preview_cutoff = 120,
                },
                sorting_strategy = "ascending",
                winblend = 0,
                file_ignore_patterns = {
                    "node_modules",
                    ".git",
                },
                mappings = {
                    i = {
                        ["<C-k>"] = require("telescope.actions").move_selection_previous,
                        ["<C-j>"] = require("telescope.actions").move_selection_next,
                        ["<C-c>"] = require("telescope.actions").close,
                        ["<C-u>"] = false,
                    },
                },
            },
            -- pickers = {
            --     find_files = {
            --         theme = "ivy",
            --         hidden = true,
            --         find_command = { "rg", "--files", "--sort", "path" }
            --     },
            --     live_grep = {
            --         theme = "ivy",
            --     },
            --     grep_string = {
            --         theme = "ivy",
            --     },
            --     buffers = {
            --         theme = "ivy",
            --     },
            --     marks = {
            --         theme = "ivy",
            --     },
            --     lsp_references = {
            --         theme = "ivy",
            --         initial_mode = "normal",
            --     },
            --     diagnostics = {
            --         theme = "ivy",
            --     },
            -- },
        })
    end,
}
