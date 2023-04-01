local line_ok, feline = pcall(require, "feline")
if not line_ok then
  return
end

local my_fox = {
  fg = "#f2f4f8",
  bg = "#161616",
  green = "#25be6a",
  yellow = "#ceb97b",
  orange = "#cf836d",
  magenta = "#be95ff",
  red = "#ee5396",
  cyan = "#33b1ff",
}

local vi_mode_colors = {
  NORMAL = "green",
  OP = "green",
  INSERT = "yellow",
  VISUAL = "magenta",
  LINES = "yellow",
  BLOCK = "red",
  REPLACE = "red",
  COMMAND = "cyan",
}

local config = {
  vim_mode = {
    provider = {
      name = "vi_mode",
      opts = {
        show_mode_name = true,
        -- padding = "center", -- Uncomment for extra padding.
      },
    },
    hl = function()
      return {
        fg = require("feline.providers.vi_mode").get_mode_color(),
        bg = "bg",
        style = "bold",
        name = "NeovimModeHLColor",
      }
    end,
    left_sep = "block",
    right_sep = "block",
  },
  gitBranch = {
    provider = "git_branch",
    hl = {
      fg = "yellow",
      bg = "bg",
      style = "bold",
    },
    left_sep = "block",
    right_sep = "block",
  },
  gitDiffAdded = {
    provider = "git_diff_added",
    hl = {
      fg = "green",
      bg = "bg",
    },
    left_sep = "block",
    right_sep = "block",
  },
  gitDiffRemoved = {
    provider = "git_diff_removed",
    hl = {
      fg = "red",
      bg = "bg",
    },
    left_sep = "block",
    right_sep = "block",
  },
  gitDiffChanged = {
    provider = "git_diff_changed",
    hl = {
      fg = "orange",
      bg = "bg",
    },
    left_sep = "block",
    right_sep = "right_filled",
  },
  separator = {
    provider = "",
  },
  fileinfo = {
    provider = {
      name = "file_info",
      opts = {
        type = "relative",
      },
    },
    hl = {
      bg = "bg",
      fg = "cyan",
      style = "bold",
    },
    left_sep = " ",
    right_sep = " ",
  },
  diagnostic_errors = {
    provider = "diagnostic_errors",
    hl = {
      fg = "red",
    },
  },
  diagnostic_warnings = {
    provider = "diagnostic_warnings",
    hl = {
      fg = "yellow",
    },
  },
  diagnostic_hints = {
    provider = "diagnostic_hints",
    hl = {
      fg = "cyan",
    },
  },
  diagnostic_info = {
    provider = "diagnostic_info",
  },
  lsp_client_names = {
    provider = "lsp_client_names",
    hl = {
      fg = "magenta",
      bg = "bg",
      style = "bold",
    },
    left_sep = "left_filled",
    right_sep = "block",
  },
  file_type = {
    provider = {
      name = "file_type",
      opts = {
        filetype_icon = true,
        case = "titlecase",
      },
    },
    hl = {
      fg = "red",
      bg = "bg",
      style = "bold",
    },
    left_sep = "block",
    right_sep = "block",
  },
  file_encoding = {
    provider = "file_encoding",
    hl = {
      fg = "yellow",
      bg = "bg",
      style = "bold",
    },
    left_sep = "block",
    right_sep = "block",
  },
  position = {
    provider = "position",
    hl = {
      fg = "green",
      bg = "bg",
      style = "bold",
    },
    left_sep = "block",
    right_sep = "block",
  },
  line_percentage = {
    provider = "line_percentage",
    hl = {
      fg = "cyan",
      bg = "bg",
      style = "bold",
    },
    left_sep = "block",
    right_sep = "block",
  },
  scroll_bar = {
    provider = "scroll_bar",
    hl = {
      fg = "cyan",
      style = "bold",
    },
  },
}

local disabled = {
  filetypes = { '^NvimTree$' }
}

local left = {
  config.vim_mode,
  config.gitBranch,
  config.gitDiffAdded,
  config.gitDiffRemoved,
  config.gitDiffChanged,
  config.separator,
}

local middle = {
  config.fileinfo,
  config.diagnostic_errors,
  config.diagnostic_warnings,
  config.diagnostic_info,
  config.diagnostic_hints,
}

local right = {
  config.lsp_client_names,
  config.file_type,
  config.file_encoding,
  config.position,
  config.line_percentage,
  config.scroll_bar,
}

local components = {
  active = {
    left,
    middle,
    right,
  },
  inactive = {
    left,
    middle,
    right,
  },
}

feline.setup({
  components = components,
  theme = my_fox,
  vi_mode_colors = vi_mode_colors,
  disable = disabled
})
