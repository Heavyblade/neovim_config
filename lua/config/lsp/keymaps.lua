local M = {}

local whichkey = require "which-key"

local keymap = vim.api.nvim_set_keymap
local buf_keymap = vim.api.nvim_buf_set_keymap

local function keymappings(bufnr)
  local opts = { noremap = true, silent = true }

  -- Key mappings
  buf_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
  keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
  keymap("n", "[e", "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>", opts)
  keymap("n", "]e", "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>", opts)

  -- Whichkey
  local keymap_l = {
    { "<leader>l",  buffer = 11,                                                           group = "Code" },
    { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>",                              buffer = bufnr, desc = "Code Action" },
    { "<leader>ld", "<cmd>lua vim.diagnostic.open_float()<CR>",                            buffer = bufnr, desc = "Line Diagnostics" },
    { "<leader>lf", "<cmd>lua vim.lsp.buf.format({async = false, timeout_ms = 6000})<CR>", buffer = bufnr, desc = "Format Document" },
    { "<leader>li", "<cmd>LspInfo<CR>",                                                    buffer = bufnr, desc = "Lsp Info" },
    { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>",                                   buffer = bufnr, desc = "Rename" },
  }
  whichkey.add(keymap_l)

  local keymap_g = {
    { "g",  group = "LSP Goto",                           remap = false },
    { "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>",     desc = "Declaration",          remap = false },
    { "gd", "<cmd>lua vim.lsp.buf.definition()<CR>",      desc = "Definition",           remap = false },
    { "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>",  desc = "Goto Implementation",  remap = false },
    { "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>",  desc = "Signature Help",       remap = false },
    { "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", desc = "Goto Type Definition", remap = false },
    { "gr", "<cmd>lua vim.lsp.buf.references()<CR>",      desc = "Goto references",      remap = false },
  }

  whichkey.add(keymap_g)
end

function M.setup(bufnr)
  keymappings(bufnr)
end

return M
