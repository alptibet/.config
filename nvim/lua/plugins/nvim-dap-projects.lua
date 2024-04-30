return {
  'ldelossa/nvim-dap-projects',
  ft="go",
  config = function ()
    require("nvim-dap-projects").setup()
    require("nvim-dap-projects").search_project_config()
  end
}
