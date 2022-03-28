local map = vim.api.nvim_set_keymap

vim.g.mapleader = " "

map("n", "<SPACE>", "", {})
map("n", "q", "", {})
map("n", "<C-w>", ":bd<cr>", {})
map("n", "<C-p>", ":Telescope find_files<cr>", {})
map("n", "<Leader>gs", ":Git<cr>", {noremap = true})
map("n", "<Leader>rr", ":WinResizerStartResize<cr>", {noremap = true})
map("n", "<Leader>nt", ":NERDTreeToggle<cr>", {noremap = true})
map("n", "<leader>nf", ":NERDTreeFind<cr>", {noremap = true})
map("n", "<Leader>af", ":AgitFile<cr>", {noremap = true})
map("n", "<Leader>tb", ":Telescope buffers<cr>", {noremap = true})
map("n", "<Leader>tt", ":Telescope current_buffer_tags<cr>", {noremap = true})
map("n", "<Leader>tg", ":Telescope live_grep<cr>", {noremap = true})
map("n", "<Leader>tc", ":Telescope git_bcommits<cr>", {noremap = true})
map("n", "<Leader>ts", ":Telescope git_status<cr>", {noremap = true})
map("n", "gl", ":HopLine<cr>", {noremap = true, silent = true})
map("n", "gw", ":HopWord<cr>", {noremap = true, silent = true})
map("n", "<Leader>rt", ":FloatermNew bundle exec ruby -Itest % -n <cword><cr>", {noremap = true})
map("n", "<Leader>hm", ":lua require(\"harpoon.mark\").add_file()<cr>", {noremap = true})
map("n", "<Leader>hg", ":lua require(\"harpoon.ui\").toggle_quick_menu()<cr>", {noremap = true})
map("n", "<Leader>hn", ":lua require(\"harpoon.ui\").nav_next()<cr>", {noremap = true})
map("n", "<Leader>hp", ":lua require(\"harpoon.ui\").nav_prev()<cr>", {noremap = true})

-- Use ctrl-[hjkl] to select the active split!
map("n", "<c-k>", ":wincmd k<CR>", {silent = true})
map("n", "<c-j>", ":wincmd j<CR>", {silent = true})
map("n", "<c-h>", ":wincmd h<CR>", {silent = true})
map("n", "<c-l>", ":wincmd l<CR>", {silent = true})
