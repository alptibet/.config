return {
  "VonHeikemen/fine-cmdline.nvim",
  dependencies = { 'MunifTanjim/nui.nvim' },
  keys = {
    { ":", "<cmd>FineCmdline<cr>", desc = "FineCmdLine" },
  },
  opts = {
    popup = {
      size = {
        width = "30%",
      },
    },
  },
}
