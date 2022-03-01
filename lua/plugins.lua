local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
  local packer_bootstrap = true
end

-- setup file
function get_setup(name)
  return string.format('require("setup.%s")', name)
end

local packer = require 'packer'
return packer.startup(function (use)
  use 'wbthomason/packer.nvim'

  use 'preservim/nerdcommenter'
  use {
    'preservim/nerdtree',
    config = get_setup('nerdtree')
  }

  use {
    'nvim-lualine/lualine.nvim',
    event = "VimEnter",
    config = get_setup("lualine"),
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use {
    'ryanoasis/vim-devicons',
    config = get_setup("vim_devicons")
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = get_setup('telescope')
  }
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    config = get_setup("telescope_fzf_native"),
    run = 'make'
  }

  use 'tpope/vim-fugitive'
 
  use {
    'folke/tokyonight.nvim',
    event = "VimEnter",
    config = get_setup("tokyonight")
  }

  -- lsp support
  use 'VonHeikemen/lsp-zero.nvim'
  use 'williamboman/nvim-lsp-installer'
  use {
    'neovim/nvim-lspconfig',
    config = get_setup("lsp")
  }

  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'saadparwaiz1/cmp_luasnip'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'

  use {
    'L3MON4D3/LuaSnip',
    config = get_setup("luasnip")
  }
  use 'rafamadriz/friendly-snippets'

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = get_setup("treesitter")
  }

  if packer_bootstrap then
    packer.sync()
  end
end)

