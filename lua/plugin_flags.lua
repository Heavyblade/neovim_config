-- Ack.vim
    -- Use ripgrep for searching ⚡️
    -- Options include:
    -- --vimgrep -> Needed to parse the rg response properly for ack.vim
    -- --type-not sql -> Avoid huge sql file dumps as it slows down the search
    -- --smart-case -> Search case insensitive if all lowercase pattern, Search case sensitively otherwise
    vim.g['ackprg'] = 'rg --vimgrep --type-not sql --smart-case'

    -- Auto close the Quickfix list after pressing '<enter>' on a list item
    vim.g['ack_autoclose'] = 1

    -- Any empty ack search will search for the work the cursor is on
    vim.g['ack_use_cword_for_empty_search'] = 1

    -- Don't jump to first match
    vim.cmd 'cnoreabbrev Te Telescope'
    vim.cmd 'cnoreabbrev Ft FloatermNew'

-- Gist
   vim.g['gist_post_private'] = 1

-- Vim-go
   vim.g['go_def_mode'] = "gopls"
   vim.g['go_info_mode'] = "gopls"
   vim.g['go_doc_popup_window'] = 1 -- Checking docs on popup

-- Vim-test
   vim.g['test#strategy'] = 'neovim'

-- Tokyio Night
   vim.g.tokyonight_colors = {bg = "#16161e"}
   vim.g.tokyonight_transparent = true

-- Floatterm
   vim.g.floaterm_autoclose = 0
   vim.g.floaterm_autoinsert = false
   vim.g.floaterm_winblend = true
