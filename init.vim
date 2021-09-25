set expandtab
set smartindent
set tabstop=4 softtabstop=4
set shiftwidth=4
set relativenumber
set nu
set noerrorbells
set nowrap "matiene las lineas largas ocultando lo que no se ve
set ignorecase
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
set encoding=utf-8
set hidden
set nowritebackup
set updatetime=3000 " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" Folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

let g:tokyonight_style="night"

"xxxxxxxx SOURCE EXTRAS xxxxxxxx
source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/after/telescope.nvim.vim
source $HOME/.config/nvim/after/treesitter.nvim.vim
"source $HOME/.config/nvim/after/lsp_config.nvim.vim

syntax on
colorscheme tokyonight
"hi Normal guibg=NONE ctermbg=NONE

"xxxxxxxx REMAPS xxxxxxxx

map <F4> :tabnew<cr>
map <F5> :WinResizerStartResize<cr>
map <F2> :NERDTreeToggle<cr>
map <C-w> :bd<cr>
map <C-p> :Telescope find_files<cr>
nnoremap <Leader>gs :Git<cr>
nmap  -  <Plug>(choosewin)
noremap <Leader>r :WinResizerStartResize<cr>
noremap <Leader>tb :Telescope buffers<cr>
noremap <Leader>tt :Telescope current_buffer_tags<cr>
noremap <Leader>tc :Telescope git_branches<cr>
noremap <Leader>nt :NERDTreeToggle<cr>
noremap <Leader>af :AgitFile<cr>

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

" White space to trigger on save
    let g:better_whitespace_enabled=1
    let g:strip_whitespace_on_save=1
" Gist
    let g:gist_post_private = 1

" Coc
    " Adding needed language servers
    let g:coc_global_extensions = ['coc-solargraph', 'coc-go', 'coc-json', 'coc-html', 'coc-snippets', 'coc-tsserver', 'coc-xml']

    " Use <c-space> to trigger completion.
    if has('nvim')
      inoremap <silent><expr> <c-space> coc#refresh()
    else
      inoremap <silent><expr> <c-@> coc#refresh()
    endif

    " Make <CR> auto-select the first completion item and notify coc.nvim to
    " format on enter, <cr> could be remapped by other vim plugin
    inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                                  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

    " Use `[g` and `]g` to navigate diagnostics
    " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)

    " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gt <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Use K to show documentation in preview window.
    nnoremap <silent> K :call <SID>show_documentation()<CR>

    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
      else
        execute '!' . &keywordprg . " " . expand('<cword>')
      endif
    endfunction

    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " Symbol renaming.
    nmap <leader>rn <Plug>(coc-rename)

    augroup mygroup
      autocmd!
      " Setup formatexpr specified filetype(s).
      autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
      " Update signature help on jump placeholder.
      autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end

    " Add `:Format` command to format current buffer.
    command! -nargs=0 Format :call CocAction('format')

" Prettier
    let g:prettier#exec_cmd_path = "/usr/local/bin/prettier"

" JsDoc
    let g:jsdoc_lehre_path = "/usr/local/bin/lehre"

" Vim-go
    let g:go_def_mode='gopls'
    let g:go_info_mode='gopls'
    let g:go_doc_popup_window = 1 " Checking docs on popup
