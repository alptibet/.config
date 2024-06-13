return {
	{
		"deparr/tairiki.nvim",
		lazy = false,
		priority = 1000, -- only necessary if you use tairiki as default theme
		config = function()
			require("tairiki").setup({
				transparent = true,
			})
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				transparent_background = true,
			})
		end,
	},
}
