local M = {}

function canUseSorbet()
  local currentDirectory = vim.fn.getcwd()
  return string.find(currentDirectory, "ruby%-lsp") ~= nil
end

local servers = {
  gopls = {
    settings = {
      gopls = {
        completeUnimported = true,
        usePlaceholders = true,
        analyses = {
          unusedparams = true,
          shadow = true,
        },
      },
    }
  },
  html = {
    filetypes = { 'html', 'erb' },
  },
  jsonls = {},
  lua_ls = {},
  ts_ls = {},
  bashls = {},
  vimls = {},
  ruby_lsp = {
    -- cmd = { os.getenv("HOME") .. "/.rbenv/shims/ruby-lsp", '--debug', 'stdio' },
    cmd = { os.getenv("HOME") .. "/.rbenv/shims/ruby-lsp", 'stdio' },
    root_markers = { 'Gemfile', '.git' },
  },
  marksman = {},
  pylsp = {
    settings = {
      pylsp = {
        disableOrganizeImports = true,
      },
      python = {
        analysis = {
          -- Ignore all files for analysis to exclusively use Ruff for linting
          ignore = { '*' },
        },
      },
    },
  },
  ruff = {},
  postgres_lsp = {},
  svelte = {},
}

if canUseSorbet() then
  servers.sorbet = {
    root_markers = { 'sorbet' },
  }
end

function M.setup()
  require("mason").setup({})
  require("mason-lspconfig").setup {
    ensure_installed = vim.tbl_keys(servers),
    automatic_installation = false,
  }
  require("config.lsp.configurer").setup(servers)
end

return M
