vim.cmd [[
  packadd packer.nvim
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]]

return require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- let packer manage itself
  use 'kyazdani42/nvim-web-devicons'
  use {'mboughaba/i3config.vim', config = [[require('config.i3config')]]}
  use 'tpope/vim-commentary'
  use {
    'nvim-treesitter/nvim-treesitter',
    config = [[require('config.treesitter')]],
    requires = {
      'windwp/nvim-autopairs',
      'windwp/nvim-ts-autotag'
    },
    wants = {
      'nvim-autopairs',
      'nvim-ts-autotag'
    },
    run = ":TSUpdate"
  }
  use {
    {
      'nvim-telescope/telescope.nvim',
      requires = {
        'nvim-lua/popup.nvim',
        'nvim-lua/plenary.nvim',
        'telescope-frecency.nvim',
        'telescope-fzf-native.nvim',
      },
      wants = {
        'popup.nvim',
        'plenary.nvim',
        'telescope-frecency.nvim',
        'telescope-fzf-native.nvim',
      },
      setup = [[require('config.telescope_setup')]],
      config = [[require('config.telescope')]],
      cmd = 'Telescope',
      module = 'telescope',
    },
    {
      'nvim-telescope/telescope-frecency.nvim',
      after = 'telescope.nvim',
      requires = 'tami5/sql.nvim',
    },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      run = 'make',
    },
  }
  use 'NLKNguyen/papercolor-theme'
  use {
    'neovim/nvim-lspconfig',
    config = [[require('config.lspconfig')]],
    requires = {
     'onsails/lspkind-nvim'
    }
  }
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
      'hrsh7th/cmp-nvim-lsp',
      { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
      {'hrsh7th/cmp-vsnip', after = 'nvim-cmp' },
      {'hrsh7th/vim-vsnip', after = 'nvim-cmp' }
    },
    config = [[require('config.cmp')]],
    event = 'InsertEnter *',
  }
  use {'hoob3rt/lualine.nvim', config = [[require('config.lualine')]]}
  use {'ygm2/rooter.nvim', config = [[require('config.rooter')]]}
  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons', config = [[require('config.bufferline')]]}
  use 'tpope/vim-eunuch'
  use {'folke/tokyonight.nvim', config = [[require('config.tokyonight')]]}
  use {
    'lewis6991/gitsigns.nvim',
    requires = 'nvim-lua/plenary.nvim',
    event = 'BufReadPre',
    config = [[require('config.gitsigns')]]
  }
  use {'mhartington/formatter.nvim', config = [[require('config.formatter')]]}
  use {'ray-x/go.nvim', config = [[require('config.go')]]}
  use 'nvim-telescope/telescope-file-browser.nvim'
end)
