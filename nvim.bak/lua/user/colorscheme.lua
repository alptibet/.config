local present = pcall(require, "nightfox")
if not present then
  return
end

vim.cmd("colorscheme carbonfox")

vim.api.nvim_set_hl(0, 'Primary', { fg = "#1F1F28" });
vim.api.nvim_set_hl(0, 'Secondary', { fg = "#3B4252" });
vim.api.nvim_set_hl(0, 'Accent', { fg = "#76946A" });
vim.api.nvim_set_hl(0, 'PrimaryBold', { bold = true, fg = "#2E3440" });
vim.api.nvim_set_hl(0, 'SecondaryBold', { bold = true, fg = "#3B4252" });
vim.api.nvim_set_hl(0, 'HeaderInfo', { bold = true, fg = "#FFA066" });
vim.api.nvim_set_hl(0, 'Header', { fg = "#223249" });

-- Floats/Windows
vim.api.nvim_set_hl(0, 'NormalFloat', { bg = "None", fg = "None" });
vim.api.nvim_set_hl(0, 'FloatBorder', { bg = "None" });
vim.api.nvim_set_hl(0, 'WhichKeyFloat', { bg = "None" });
