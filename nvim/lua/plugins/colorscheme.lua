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
		"AlexvZyl/nordic.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nordic").setup({
				-- transparent_bg = true,
				swap_backgrounds = true,
			})
		end,
	},
}
