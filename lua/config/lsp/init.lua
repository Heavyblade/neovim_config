local M = {}

local servers = {
  gopls = {},
  html = {},
  jsonls = {},
  lua_ls = {},
  tsserver = {},
  vimls = {},
  solargraph = {},
  marksman = {},
}

function M.setup()
  require("mason").setup({})
  require("mason-lspconfig").setup {
    ensure_installed = vim.tbl_keys(servers),
    automatic_installation = false,
  }
  require("config.lsp.installer").setup(servers)
end

return M
