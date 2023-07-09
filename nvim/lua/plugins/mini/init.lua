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
  {
    "echasnovski/mini.starter",
    version = false, -- wait till new 0.7.0 release to put it back on semver
    event = "VimEnter",
    opts = function()
      local logo = table.concat({
        "     ___           _/7        `  ___  '           '*`           |||           ,,,           +++           '*`      ",
        "    (o o)         (o o)      -  (O o)  -         (o o)         (o o)         (o o)         (o o)         (o o)     ",
        "ooO--(_)--Ooo-ooO--(_)--Ooo-ooO--(_)--Ooo----ooO--(_)--Ooo-ooO--(_)--Ooo-ooO--(_)--Ooo-ooO--(_)--Ooo-ooO--(_)--Ooo-",
      }, "\n")

      local config = {
        header = logo,
      }
      return config
    end,
    config = function(_, config)
      -- close Lazy and re-open when starter is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "MiniStarterOpened",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      local starter = require("mini.starter")
      starter.setup(config)
    end,
  }
}
