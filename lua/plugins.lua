-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- General
  use 'jiangmiao/auto-pairs'
  use 'preservim/nerdcommenter'
  use 'tpope/vim-commentary'
  use 'mileszs/ack.vim'
  use 'simeji/winresizer'
  use 'haya14busa/incsearch.vim'
  use 'ntpeters/vim-better-whitespace'
  use {
      'phaazon/hop.nvim',
      branch = 'v1'
    }
  use 'ThePrimeagen/harpoon'
  use 'tpope/vim-surround'

  -- Git
  use 'cohama/agit.vim'
  use 'airblade/vim-gitgutter'
  use 'tpope/vim-fugitive'

  -- UI
  use 'Yggdroot/indentLine'
  use 'nvim-lualine/lualine.nvim'
  use 'ryanoasis/vim-devicons'
  use 'scrooloose/NERDTree'

  -- Colors
  use {
      'folke/tokyonight.nvim',
      branch = 'main'
  }
  use {
      'dracula/vim',
      as = 'dracula'
  }

  -- Languages
  use 'vim-ruby/vim-ruby'
  use 'tpope/vim-rails'
  use 'fatih/vim-go'
  use 'elzr/vim-json'
  use 'neoclide/vim-jsx-improve'
  use {
      'prettier/vim-prettier',
      run = 'yarn install',
      branch = 'release/0.x'
  }
  use 'heavenshell/vim-jsdoc'
  use 'vim-test/vim-test'
  use 'voldikss/vim-floaterm'

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

  -- Intellisense
  use {
      'neoclide/coc.nvim',
       branch = 'release'
  }
  use 'honza/vim-snippets'
  use 'ludovicchabant/vim-gutentags'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
end)
