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
		"sho-87/kanagawa-paper.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
}
