require("config.lazy")
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.cmd.colorscheme "mellow"

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require("config.options")
    require("config.autocommands")
    require("config.keymaps")
  end
})
