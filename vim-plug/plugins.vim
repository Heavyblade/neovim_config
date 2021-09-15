" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')
    " General
    Plug 'scrooloose/NERDTree'
    Plug 'jiangmiao/auto-pairs'
    Plug 'preservim/nerdcommenter'
    Plug 'mhinz/vim-startify'
    Plug 'mileszs/ack.vim'
    Plug 'simeji/winresizer'
    Plug 't9md/vim-choosewin'
    Plug 'tpope/vim-commentary'
    Plug 'haya14busa/incsearch.vim'
    Plug 'easymotion/vim-easymotion'
    Plug 'ntpeters/vim-better-whitespace'
    Plug 'jlanzarotta/bufexplorer'

    " Git
    Plug 'cohama/agit.vim'
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'

    " UI
    Plug 'Yggdroot/indentLine'
    Plug 'itchyny/lightline.vim'
    Plug 'ryanoasis/vim-devicons'

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
call plug#end()
