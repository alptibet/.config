-- Standard Operations
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", {
  expr = true,
  silent = true
})
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", {
  expr = true,
  silent = true
})
vim.keymap.set("n", "<leader>w", "<cmd>:w<cr>", { desc = "Save" })
vim.keymap.set("n", "<leader>q", "<cmd>:q<cr>", { desc = "Quit" })
vim.keymap.set("n", "|", "<cmd>vsplit<cr>", { desc = "Vertical Split" })
vim.keymap.set("n", "\\", "<cmd>split<cr>", { desc = "Horizontal Split" })

-- Clear search highlights
vim.keymap.set("n", "<esc>", "<cmd>noh<cr>")

-- File Explorer
vim.keymap.set("n", "<leader>o", "<cmd>:NeoTreeFocusToggle<cr>", { desc = "NeoTree Toggle Focus" })
vim.keymap.set("n", "<leader>r", "<cmd>:NeoTreeReveal<cr>", { desc = "NeoTree Reveal File" })
vim.keymap.set("n", "<leader>h", "<cmd>:NeoTreeFloat<cr>", { desc = "NeoTree Float" })

-- Buffer Navigation
vim.keymap.set("n", "<leader>c", "<cmd>:bd<cr>", { desc = "Close Buffer" })
vim.keymap.set("n", "<leader>x", "<cmd>:BufferLineCloseOthers<cr>", { desc = "Close Other Buffers" })
vim.keymap.set("n", "<Tab>", "<cmd>bnext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", "<cmd>bprevious<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>gb", "<cmd>:BufferLinePick<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bc", "<cmd>:BufferLinePickClose<cr>", { desc = "Next buffer" })

--Movement
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Enter to change word
vim.keymap.set("n", "<CR>", "ciw")

--Telescope
vim.keymap.set("n", "<leader>ff", "<cmd>:Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fd", "<cmd>:Telescope diagnostics<cr>")
vim.keymap.set("n", "<leader>fb", "<cmd>:Telescope buffers<cr>")
vim.keymap.set("n", "<leader>fo", "<cmd>:Telescope oldfiles<cr>")
vim.keymap.set("n", "<leader>:", "<cmd>:Telescope command_history<cr>")
vim.keymap.set("n", "<leader>ft", "<cmd>:Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>fs", "<cmd>:Telescope grep_string<cr>")

--Trouble
vim.keymap.set("n", "<leader>sd", "<cmd>:TroubleToggle<cr>", { desc = "Toggle Trouble" })

--Toggle Lazygit
vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = 'Toggle Lazygit' })

--Toggle Aerial
vim.keymap.set("n", "<leader>ls", "<cmd>AerialToggle<cr>", { desc = 'Toogle Aerial' })

--Comment
vim.keymap.set("n", "<leader>/",
  function() require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1) end,
  { desc = 'Toogle Aerial' })
vim.keymap.set("v", "<leader>/", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
  { desc = 'Toogle Aerial' })

--Session Manager
vim.keymap.set("n", "<leader>S", "<cmd>SessionManager load_session<cr>", { desc = 'Toogle Aerial' })
