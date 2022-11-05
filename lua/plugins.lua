-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- General
  use 'windwp/nvim-autopairs'
  use {
      'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup()
      end
  }
  use 'mileszs/ack.vim'
  use 'simeji/winresizer'
  use 'haya14busa/incsearch.vim'
  use {
      'phaazon/hop.nvim',
      branch = 'v1'
    }
  use 'ThePrimeagen/harpoon'
  use 'tpope/vim-surround'

  -- Colors
  use {
      'folke/tokyonight.nvim',
      branch = 'main'
  }
  use "rebelot/kanagawa.nvim"

  -- Git
  use 'cohama/agit.vim'
  use 'airblade/vim-gitgutter'
  use 'tpope/vim-fugitive'

  -- UI
  use 'Yggdroot/indentLine'
  use 'nvim-lualine/lualine.nvim'
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
  }
  use {
    'SmiteshP/nvim-navic',
    requires = 'neovim/nvim-lspconfig'
  }
  -- Languages
  use 'fatih/vim-go'
  use 'elzr/vim-json'
  use 'neoclide/vim-jsx-improve'
  use 'vim-test/vim-test'
  use 'voldikss/vim-floaterm'
  use 'tpope/vim-rails'

  -- Gist vim
  use 'mattn/vim-gist'
  use 'mattn/webapi-vim'

  -- Telescope
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use {
      'nvim-telescope/telescope-fzf-native.nvim',
      run = 'make'
  }

  -- LSP
  use {
    "neovim/nvim-lspconfig",
    opt = true,
    event = "BufReadPost",
    wants = { "nvim-lsp-installer" },
    config = function()
      require("config.lsp").setup()
    end,
    requires = {
      "williamboman/nvim-lsp-installer",
    },
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use { 'tami5/lspsaga.nvim' }

  use {
    "hrsh7th/nvim-cmp",
    config = function()
      require("config.cmp").setup()
    end,
    wants = { "LuaSnip" },
    requires = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",
      "ray-x/cmp-treesitter",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      {
        "L3MON4D3/LuaSnip",
        wants = "friendly-snippets",
        config = function()
          require("config.luasnip").setup()
        end,
      },
      "rafamadriz/friendly-snippets",
    },
    disable = false,
  }

  use 'folke/which-key.nvim'
  use 'ludovicchabant/vim-gutentags'
  use {
      'folke/trouble.nvim',
      requires = { 'kyazdani42/nvim-web-devicons' },
  }

  use {
      "nvim-neorg/neorg",
      config = function()
        require("config.initialize.norg").setup()
      end,
      requires =
      {
        "nvim-lua/plenary.nvim",
        "Pocco81/true-zen.nvim",
      }
  }

  use "~/rails/stackmap"
end)
