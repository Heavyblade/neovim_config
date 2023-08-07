local M = {}
local nvim_lsp = require('lspconfig')

local servers = {
  gopls = {},
  html = {},
  jsonls = {},
  lua_ls = {},
  tsserver = {},
  vimls = {},
  solargraph = {
    cmd = { os.getenv( "HOME" ) .. "/.rbenv/shims/solargraph", 'stdio' },
    root_dir = nvim_lsp.util.root_pattern(".git"),
    settings = {
      solargraph = {
        autoformat = true,
        completion = true,
        diagnostic = true,
        folding = true,
        references = true,
        rename = true,
        symbols = true
      }
    }
  },
  marksman = {},
}

function M.setup()
  require("mason").setup({})
  require("mason-lspconfig").setup {
    ensure_installed = vim.tbl_keys(servers),
    automatic_installation = false,
  }
  require("config.lsp.configurer").setup(servers)
end

return M
