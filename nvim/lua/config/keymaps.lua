-- Standard Operations
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", {
  expr = true,
  silent = true
})
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", {
  expr = true,
  silent = true
})
vim.keymap.set("n", "<leader>w", "<cmd>:w<cr>", {
  desc = "Save"
})
vim.keymap.set("n", "<leader>q", "<cmd>:q<cr>", {
  desc = "Quit"
})
vim.keymap.set("n", "|", "<cmd>vsplit<cr>", {
  desc = "Vertical Split"
})
vim.keymap.set("n", "\\", "<cmd>split<cr>", {
  desc = "Horizontal Split"
})
vim.keymap.set("n", "<leader>c", "<cmd>:bd<cr>", {
  desc = "Close Buffer"
})

-- Clear search highlights
vim.keymap.set("n", "<esc>", "<cmd>noh<cr>")

-- Buffer Navigation
vim.keymap.set("n", "<Tab>", "<cmd>bnext<cr>", {
  desc = "Next buffer"
})
vim.keymap.set("n", "<S-Tab>", "<cmd>bprevious<cr>", {
  desc = "Next buffer"
})

-- Movement
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

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
