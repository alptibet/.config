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
			pickers = {
				find_files = {
					theme = "ivy",
					hidden = true,
				},
				live_grep = {
					theme = "ivy",
				},
				grep_string = {
					theme = "ivy",
				},
				buffers = {
					theme = "ivy",
				},
				marks = {
					theme = "ivy",
				},
				lsp_references = {
					theme = "ivy",
					initial_mode = "normal",
				},
				diagnostics = {
					theme = "ivy",
				},
			},
		})
	end,
}
