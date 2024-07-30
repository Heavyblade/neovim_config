local M = {}
local nvim_lsp = require('lspconfig')

local servers = {
  gopls    = {},
  html     = {
    filetypes = { 'html', 'erb' },
  },
  jsonls   = {},
  lua_ls   = {},
  tsserver = {},
  bashls   = {},
  vimls    = {},
  pyright  = {},
  marksman = {},
  ruby_lsp = {
    cmd = { os.getenv("HOME") .. "/.rbenv/shims/ruby-lsp", 'stdio' },
    root_dir = nvim_lsp.util.root_pattern("Gemfile", ".git"),
    timeout_ms = 3200,
    formatting = {
      timeout_ms = 3200,
    }
  },
}

function M.setup()
  require("mason").setup({})
  require("mason-lspconfig").setup {
    ensure_installed = vim.tbl_keys(servers),
    automatic_installation = false,
  }
  require("config.lsp.configurer").setup(servers)
end

vim.diagnostic.config({ virtual_text = false })
return M
