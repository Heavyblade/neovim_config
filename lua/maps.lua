local whichkey = require "which-key"
local map = vim.api.nvim_set_keymap

vim.g.mapleader = " "

-- General
map("n", "<SPACE>", "", {})
map("n", "q", "", {})
map("n", "<C-w>", ":bd<cr>", {})
map("n", "<C-p>", ":Telescope find_files<cr>", {})
map("n", "<Leader>gs", ":Git<cr>", {noremap = true})
map("n", "<Leader>rr", ":WinResizerStartResize<cr>", {noremap = true})
map("n", "<Leader>nt", ":NERDTreeToggle<cr>", {noremap = true})
map("n", "<leader>nf", ":NERDTreeFind<cr>", {noremap = true})
map("n", "<Leader>af", ":AgitFile<cr>", {noremap = true})
map("n", "<Leader>rt", ":FloatermNew bundle exec ruby -Itest % -n <cword><cr>", {noremap = true})

-- HopLine
local keymap_g = {
  g = {
    name = "HopLine",
    l = { "<cmd>:HopLine<CR>", "HopLine Line" },
    w = { "<cmd>:HopWord<CR>", "HopLine Word" },
  }
}
whichkey.register(keymap_g, { noremap = true, silent = true })

-- Telescope
local keymap_t = {
  t = {
    name = "Telescope",
    b = { "<cmd>:Telescope buffers<CR>", "Telescope Buffers" },
    t = { "<cmd>:Telescope current_buffer_tags<CR>", "Telescope Tags" },
    g = { "<cmd>:Telescope live_grep<CR>", "Telescope Grep" },
    c = { "<cmd>:Telescope git_bcommits<CR>", "Telescope Commits" },
    s = { "<cmd>:Telescope git_status<CR>", "Telescope Status" },
  }
}
whichkey.register(keymap_t, { prefix = "<leader>", noremap = true })

-- Harpoon
local harpoon_ui = require("harpoon.ui")
local keymap_h = {
  h = {
    name = "Harpoon",
    g = { harpoon_ui.toggle_quick_menu, "Harpoon menu" },
    m = { harpoon_ui.add_file, "Harpoon mark" },
    n = { harpoon_ui.nav_next, "Harpoon Next" },
    p = { harpoon_ui.nav_prev, "Harpoon Prev" },
  }
}
whichkey.register(keymap_h, { prefix = "<leader>", noremap = true })

-- Use ctrl-[hjkl] to select the active split!
map("n", "<c-k>", ":wincmd k<CR>", {silent = true})
map("n", "<c-j>", ":wincmd j<CR>", {silent = true})
map("n", "<c-h>", ":wincmd h<CR>", {silent = true})
map("n", "<c-l>", ":wincmd l<CR>", {silent = true})
