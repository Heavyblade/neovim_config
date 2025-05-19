local whichkey = require "which-key"
local map = vim.api.nvim_set_keymap
local vscode = require("vscode")

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

-- Telescope
local keymap_t = {
  { "<leader>t",  group = "Telescope",                                           remap = false },
  { "<leader>tt", function() vscode.call("workbench.action.gotoSymbol") end,     desc = "Telescope Tags",    remap = false },
  { "<leader>tb", function() vscode.call("workbench.action.showAllEditors") end, desc = "Telescope Buffers", remap = false },
}
whichkey.add(keymap_t)

-- Harpoon
local keymap_h = {
  { "<leader>h",  group = "Harpoon",                                                      remap = false },
  { "<leader>hg", function() vscode.call("vscode-harpoon.editorQuickPick") end,           desc = "Harpoon menu", remap = false },
  { "<leader>hm", function() vscode.call("vscode-harpoon.addEditor") end,                 desc = "Harpoon mark", remap = false },
  { "<leader>hp", function() vscode.call("vscode-harpoon.gotoPreviousHarpoonEditor") end, desc = "Harpoon Prev", remap = false },
}
whichkey.add(keymap_h)

-- NerdTree
local keymap_n = {
  { "<leader>n",  group = "NerdTree",                                                            remap = false },
  { "<leader>nf", function() vscode.call("workbench.files.action.showActiveFileInExplorer") end, desc = "Find file in explorer", remap = false },
}
whichkey.add(keymap_n)

vim.keymap.set("n", "<c-n>", function() vscode.call("vscode-harpoon.gotoPreviousHarpoonEditor") end, { silent = true })
