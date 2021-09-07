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

    " Git
    Plug 'cohama/agit.vim'
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'

    " UI
    Plug 'Yggdroot/indentLine'
    Plug 'itchyny/lightline.vim'
    Plug 'ryanoasis/vim-devicons'

    " Colors
    Plug 'dracula/vim'
    Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

    " Languages
    Plug 'vim-ruby/vim-ruby'
    Plug 'tpope/vim-rails'
    Plug 'fatih/vim-go'
    Plug 'elzr/vim-json'
    Plug 'neoclide/vim-jsx-improve'
    
    " Gist vim
    Plug 'mattn/vim-gist'
    Plug 'mattn/webapi-vim'

    "Telescope
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }


    " Intellisense
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-lua/completion-nvim'
call plug#end()
