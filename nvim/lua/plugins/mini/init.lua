return {
  {
    'echasnovski/mini.pairs',
    version = '*',
    event = "InsertEnter",
    config = function()
      require("mini.pairs").setup()
    end
  },
  {
    'echasnovski/mini.files',
    version = false,
    keys = { {
      "<leader>e",
      function()
        require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
      end,
      desc = "Mini Files"
    },
      {
        "<leader>E",
        function()
          require("mini.files").open(vim.loop.cwd(), true)
        end,
        desc = "Mini Files cwd"
      }
    },
    config = function()
      require("mini.files").setup()
    end
  },
  {
    'echasnovski/mini.statusline',
    version = false,
    config = function()
      require("mini.statusline").setup()
    end
  },
}
