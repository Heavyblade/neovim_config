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
