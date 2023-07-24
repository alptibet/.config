return {
  {
    'kvrohit/mellow.nvim'
  },
  {
    'aktersnurra/no-clown-fiesta.nvim'
  },
  {
    'rebelot/kanagawa.nvim',
    config = function()
      require('kanagawa').setup({
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = 'none'
              }
            }
          }
        }
      })
    end
  }
}
