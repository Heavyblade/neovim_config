" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')
    " General
    Plug 'jiangmiao/auto-pairs'
    Plug 'preservim/nerdcommenter'
    Plug 'tpope/vim-commentary'
    Plug 'mileszs/ack.vim'
    Plug 'simeji/winresizer'
    Plug 't9md/vim-choosewin'
    Plug 'haya14busa/incsearch.vim'
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'phaazon/hop.nvim'
    Plug 'mhinz/vim-startify'
    Plug 'ThePrimeagen/harpoon'
    Plug 'tpope/vim-surround'

    " Git
    Plug 'cohama/agit.vim'
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'

    " UI
    Plug 'Yggdroot/indentLine'
    Plug 'itchyny/lightline.vim'
    Plug 'ryanoasis/vim-devicons'
    Plug 'scrooloose/NERDTree'

    " Colors
    Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
    Plug 'dracula/vim', { 'as': 'dracula' }

    " Languages
    Plug 'vim-ruby/vim-ruby'
    Plug 'tpope/vim-rails'
    Plug 'fatih/vim-go'
    Plug 'elzr/vim-json'
    Plug 'neoclide/vim-jsx-improve'
    Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'branch': 'release/0.x' }
    Plug 'heavenshell/vim-jsdoc'
    Plug 'vim-test/vim-test'
    Plug 'voldikss/vim-floaterm'

    " Gist vim
    Plug 'mattn/vim-gist'
    Plug 'mattn/webapi-vim'

    "Telescope
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

    " Intellisense
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'honza/vim-snippets'
    Plug 'ludovicchabant/vim-gutentags'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
call plug#end()
