-- Standard Operations
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", {
	expr = true,
	silent = true,
})
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", {
	expr = true,
	silent = true,
})
vim.keymap.set("n", "<leader>w", "<cmd>:w<cr>", { desc = "Save" })
vim.keymap.set("n", "<leader>q", "<cmd>:q<cr>", { desc = "Quit" })
vim.keymap.set("n", "\\", "<cmd>vsplit<cr>", { desc = "Vertical Split" })
vim.keymap.set("n", "|", "<cmd>split<cr>", { desc = "Horizontal Split" })

-- Clear search highlights
vim.keymap.set("n", "<esc>", "<cmd>noh<cr>")

-- Buffer Navigation
vim.keymap.set("n", "<leader>c", "<cmd>:bp|bd #<cr>", { desc = "Close Buffer" })
vim.keymap.set("n", "<leader>x", "<cmd>:BufferLineCloseOthers<cr>", { desc = "Close Other Buffers" })
vim.keymap.set("n", "<Tab>", "<cmd>bnext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", "<cmd>bprevious<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>gb", "<cmd>:BufferLinePick<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bc", "<cmd>:BufferLinePickClose<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<F13>", "<cmd>:BufferLineCloseLeft<cr>", { desc = "Close all buffers - left" })
vim.keymap.set("n", "<F14>", "<cmd>:BufferLineCloseRight<cr>", { desc = "Close all buffers - right " })

--Movement
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

--Split Resizing
vim.keymap.set("n", "<S-A-l>", "<C-w><")
vim.keymap.set("n", "<S-A-h>", "<C-w>>")
vim.keymap.set("n", "<S-A-=>", "<C-w>=")
vim.keymap.set("n", "<S-A-j>", "<C-w>-")
vim.keymap.set("n", "<S-A-k>", "<C-w>+")

-- Enter to change word
vim.keymap.set("n", "<CR>", "ciw")
vim.keymap.set("i", "<C-CR>", "<C-o>o") --does not work
--Telescope
vim.keymap.set("n", "<leader>ff", "<cmd>:Telescope find_files<cr>")
vim.keymap.set("n", "<leader>fd", "<cmd>:Telescope diagnostics<cr>")
vim.keymap.set("n", "<leader>fb", "<cmd>:Telescope buffers<cr>")
vim.keymap.set("n", "<leader>fo", "<cmd>:Telescope oldfiles<cr>")
vim.keymap.set("n", "<leader>:", "<cmd>:Telescope command_history<cr>")
vim.keymap.set("n", "<leader>ft", "<cmd>:Telescope live_grep<cr>")
vim.keymap.set("n", "<leader>fr", "<cmd>:Telescope lsp_references<cr>")
vim.keymap.set("n", "<leader>fm", "<cmd>:Telescope marks<cr>")
vim.keymap.set("n", "<leader>fk", "<cmd>:Telescope keymaps<cr>")
vim.keymap.set("n", "<leader>fs", "<cmd>:Telescope lsp_document_symbols<cr>")
vim.keymap.set("n", "<leader>fS", "<cmd>:Telescope lsp_workspace_symbols<cr>")

--Trouble
vim.keymap.set(
	"n",
	"<leader>tw",
	"<cmd>:TroubleToggle workspace_diagnostics<cr>",
	{ desc = "Toggle Trouble workspace diagnostics" }
)
vim.keymap.set(
	"n",
	"<leader>td",
	"<cmd>:TroubleToggle document_diagnostics<cr>",
	{ desc = "Toggle Trouble document diagnostics" }
)
vim.keymap.set("n", "<leader>tq", "<cmd>:TroubleToggle quickfix<cr>", { desc = "Toggle Trouble quickfix" })
vim.keymap.set("n", "<leader>tr", "<cmd>:TroubleToggle lsp_references<cr>", { desc = "Toggle Trouble lsp references" })
vim.keymap.set(
	"n",
	"<leader>gd",
	"<cmd>:TroubleToggle lsp_definitions<cr>",
	{ desc = "Toggle Trouble lsp definitions" }
)

--Toggle Lazygit
vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "Toggle Lazygit" })

--Comment
vim.keymap.set("n", "<leader>/", function()
	require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1)
end, { desc = "Comment" })
vim.keymap.set(
	"v",
	"<leader>/",
	"<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
	{ desc = "Comment Selection" }
)

--Session Manager
-- vim.keymap.set("n", "<leader>S", "<cmd>SessionManager load_session<cr>", { desc = "Load Session" })

--DAP
vim.keymap.set("n", "<leader>db", "<cmd>DapToggleBreakpoint<cr>", { desc = "Add breakpoint at line" })
vim.keymap.set("n", "<leader>dc", "<cmd>DapContinue<cr>", { desc = "DAP continue" })
-- vim.keymap.set("n", "<leader>du", function()
-- 	local widgets = require("dap.ui.widgets")
-- 	local sidebar = widgets.sidebar(widgets.scopes)
-- 	sidebar.open()
-- end, { desc = "Open debugging sidebar" })
