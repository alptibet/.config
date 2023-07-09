vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 200 }
  end,
})

local session = require('session_manager')
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    session.autosave_session()
  end,
})
