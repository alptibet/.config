return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {
    indent = { char = '│', tab_char = '│' },
    whitespace = { highlight = { "Whitespace", "Nontext" } },
  },
  event = { "BufReadPost", "BufNewFile" },
}
