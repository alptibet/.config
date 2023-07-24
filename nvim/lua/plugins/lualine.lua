return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  config = function()
    local config = {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = '',
        section_separators = '',
      },
      sections = {
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {}
      }
    }
    local function insert_left(component)
      table.insert(config.sections.lualine_c, component)
    end
    local function insert_right(component)
      table.insert(config.sections.lualine_x, component)
    end

    insert_left { 'filename' }
    insert_left { 'location' }
    insert_right {
      -- Get LSP server name. How to get all?
      function()
        local msg = 'No Active Lsp'
        local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then
          return msg
        end
        for _, client in ipairs(clients) do
          local filetypes = client.config.filetypes
          if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return client.name
          end
        end
        return msg
      end,
      icon = ' LSP:',
    }
    insert_right {
      'o:encoding',
      fmt = string.upper
    }

    insert_right {
      'fileformat',
      fmt = string.upper,
      icons_enabled = true
    }
    require('lualine').setup(config)
  end
}
