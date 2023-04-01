local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath 'data' .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  }

  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerInstall
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  snapshot_path = fn.stdpath 'config' .. "/snapshots",
  max_jobs = 50,
  display = {
    open_fn = function()
      return require('packer.util').float { border = "rounded" }
    end,
    promp_border = 'rounded',
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use 'wbthomason/packer.nvim' -- Have packer manage itself
  use 'nvim-lua/plenary.nvim' -- Useful lua functions used ny lots of plugins
  use 'windwp/nvim-autopairs' -- Autopairs, integrates with both cmp and treesitter
  use 'numToStr/Comment.nvim' -- Easily comment stuff
  use 'kyazdani42/nvim-web-devicons'
  use 'feline-nvim/feline.nvim'
  use 'lewis6991/impatient.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'goolord/alpha-nvim'
  use 'folke/which-key.nvim'
  use 'prettier/vim-prettier'
  use 'ap/vim-css-color'
  use 'Shatur/neovim-session-manager'
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
  }
  -- Colorschemes
  use 'rebelot/kanagawa.nvim'
  use 'EdenEast/nightfox.nvim'
  -- cmp plugins
  use 'ms-jpq/coq_nvim'
  use 'ms-jpq/coq.artifacts'
  -- LSP
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'neovim/nvim-lspconfig' -- enable LSP
  use 'jose-elias-alvarez/null-ls.nvim' -- for formatters and linters
  use 'lvimuser/lsp-inlayhints.nvim' -- for inlay hints
  use 'j-hui/fidget.nvim'
  -- Telescope
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }
  -- Git
  use 'lewis6991/gitsigns.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
