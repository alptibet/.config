local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

-- local ft_to_parser = require("nvim-treesitter.parsers").filetype_to_parsername
-- ft_to_parser.motoko = "typescript"

configs.setup {
  ensure_installed = { "rust", "html", "css", "scss", "javascript", "typescript", "json", "lua" }, -- one of "all" or a list of languages
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "markdown" }, -- list of language that will be disabled
  },
  autotag = {
    enable = true,
    disable = { "xml", "markdown" },
  }
}
