require("config.options")
require("config.keymaps")
require("config.lazy")
vim.cmd.colorscheme "mellow"

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require("config.autocommands")
  end
})
