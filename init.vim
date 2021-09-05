set expandtab
set smartindent
set tabstop=4 softtabstop=4
set shiftwidth=4
set relativenumber
set nu
set noerrorbells
set nowrap "matiene las lineas largas ocultando lo que no se ve
set smartcase
set noswapfile
set nobackup
set undodir=$HOME/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set completeopt=menuone,noinsert,noselect
set signcolumn=yes
set mouse=a
set clipboard=unnamedplus
set ttyfast
let mapleader=","

"xxxxxxxx SOURCE EXTRAS xxxxxxxx
source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/after/telescope.nvim.vim
source $HOME/.config/nvim/after/lsp_config.nvim.vim

syntax on
colorscheme dracula

"xxxxxxxx REMAPS xxxxxxxx

map <F4> :tabnew<cr>
map <F5> :WinResizerStartResize<cr>
map <F6> :ALEToggle<cr>
map <F2> :NERDTreeToggle<cr>
map <C-w> :bd<cr>
map <C-p> :Telescope find_files<cr>
nnoremap <Leader>gs :Git<cr>
nmap  -  <Plug>(choosewin)

"xxxxxxxx CONFIGURATIONS xxxxxxxx

" ack.vim --- {{{

    " Use ripgrep for searching ⚡️
    " Options include:
    " --vimgrep -> Needed to parse the rg response properly for ack.vim
    " --type-not sql -> Avoid huge sql file dumps as it slows down the search
    " --smart-case -> Search case insensitive if all lowercase pattern, Search case sensitively otherwise
    let g:ackprg = 'rg --vimgrep --type-not sql --smart-case'

    " Auto close the Quickfix list after pressing '<enter>' on a list item
    let g:ack_autoclose = 1

    " Any empty ack search will search for the work the cursor is on
    let g:ack_use_cword_for_empty_search = 1

    " Don't jump to first match
    cnoreabbrev Ack Ack!

    " Maps <leader>/ so we're ready to type the search keyword
    nnoremap <Leader>/ :Ack!<Space>

    " Navigate quickfix list with ease
    nnoremap <silent> [q :cprevious<CR>
    nnoremap <silent> ]q :cnext<CR>
" }}}


" vim-choosewin
let g:choosewin_overlay_enable = 1

" NERDTreee
let NERDTreeShowHidden=1

