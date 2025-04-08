local whichkey = require "which-key"
local map = vim.api.nvim_set_keymap

local opts = { noremap = true, silent = true }
local noremap = { noremap = true }

-- General
map("n", "<SPACE>", "", {})
map("n", "q", "", {})
map("n", "s", ":HopWord<cr>", {})
map("n", "[q", ":cprevious<cr>", opts)
map("n", "]q", ":cnext<cr>", opts)
map("n", "<Leader>bp", "orequire 'pry'; binding.pry<Esc>", noremap)
map("n", "<Leader><Space>", ":nohlsearch<CR>", opts)
map("t", "<Esc>", "<C-\\><C-n>", opts)
map("n", "<Leader>p", '"0p', noremap)
map("v", "<Leader>p", '"0p', noremap)

-- Use ctrl-[hjkl] to select the active split!
map("n", "<c-k>", ":wincmd k<CR>", { silent = true })
map("n", "<c-j>", ":wincmd j<CR>", { silent = true })
map("n", "<c-h>", ":wincmd h<CR>", { silent = true })
map("n", "<c-l>", ":wincmd l<CR>", { silent = true })

-- Github
local keymap_g = {
  { "<leader>g",  group = "Github",               remap = false },
  { "<leader>ga", "<cmd>:GitGutterStageHunk<CR>", desc = "Git Add chunk",        remap = false },
  { "<leader>gb", "<cmd>:Git blame<CR>",          desc = "Git blame",            remap = false },
  { "<leader>gl", "<cmd>:Git log -- %<CR>",       desc = "Git log current file", remap = false },
}
whichkey.add(keymap_g)
