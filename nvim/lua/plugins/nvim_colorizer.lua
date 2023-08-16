return {
  'NvChad/nvim-colorizer.lua',
  enabled = false,
  event = 'BufReadPost',
  config = function()
    require('colorizer').setup()
  end
}
