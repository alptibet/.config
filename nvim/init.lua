require("config.options")
require("config.keymaps")
require("config.lazy")

vim.cmd.colorscheme("carbonfox")

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require("config.autocommands")
  end,
})
vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
