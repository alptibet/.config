local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
  return
end

lualine.setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = {
      { "branch", icon = "" },
      {
        "diff",
        symbols = {
          added    = " ",
          modified = " ",
          removed  = " "
        }
      }
    },
    lualine_c = { { 'filename', path = 1, } },
    lualine_x = { {
      "diagnostics",
      sources = { "nvim_lsp" },
      sections = { "error", "warn", "info", "hint" },
      symbols = {
        error = " ",
        warn  = " ",
        info  = " ",
        hint  = " "
      }
    } },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
}
