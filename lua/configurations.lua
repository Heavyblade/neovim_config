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
    vim.cmd 'cnoreabbrev Ack Ack!'

    local map = vim.api.nvim_set_keymap
    map("n", "<Leader>/", ":Ack!<Space>", {noremap = true, silent = true})
    map("n", "[q", ":cprevious<cr>", {noremap = true, silent = true})
    map("n", "]q", ":cnext<cr>", {noremap = true, silent = true})

-- NERDTreee
   vim.g['NERDTreeShowHidden'] = 1

-- White space to trigger on save
   vim.g['better_whitespace_enabled'] = 1
   vim.g['strip_whitespace_on_save'] = 1
   vim.g['strip_whitespace_confirm'] = 0 -- avoid unnecessary confirmation

-- Gist
   vim.g['gist_post_private'] = 1

-- Prettier
   vim.g['prettier#exec_cmd_path'] = "/usr/local/bin/prettier"

-- JsDoc
   vim.g['jsdoc_lehre_path'] = "/usr/local/bin/lehre"

-- Vim-go
   vim.g['go_def_mode'] = "gopls"
   vim.g['go_info_mode'] = "gopls"
   vim.g['go_doc_popup_window'] = 1 -- Checking docs on popup

-- Vim-test
   vim.g['test#strategy'] = 'floaterm'

-- Vim startify
   -- Ensure that opening a file sets the repo root as the vim
   -- vim root, so Telescope and other plugins work properly
   vim.g['startify_change_to_vcs_root'] = 1
