local M = {}

local servers = {
  gopls = {},
  html = {},
  jsonls = {},
  sumneko_lua = {},
  tsserver = {},
  vimls = {},
  solargraph = {},
}

local function on_attach(client, bufnr)
  -- Enable completion triggered by <C-X><C-O>
  -- See `:help omnifunc` and `:help ins-completion` for more information.
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Use LSP as the handler for formatexpr.
  -- See `:help formatexpr` for more information.
  vim.api.nvim_buf_set_option(0, "formatexpr", "v:lua.vim.lsp.formatexpr()")

  -- Configure key mappings
  require("config.lsp.keymaps").setup(client, bufnr)
end

local opts = {
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  },
}

function M.setup()
  require("config.lsp.installer").setup(servers, opts)
  local nvim_lsp = require('lspconfig')
  local handlers = {
    ["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = true
      }
    )
  }
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  nvim_lsp.solargraph.setup {
    cmd = {
      "solargraph",
      "stdio"
    },
    filetypes = {
      "ruby"
    },
    flags = {
      debounce_text_changes = 150
    },
    on_attach = on_attach,
    root_dir = nvim_lsp.util.root_pattern("Gemfile", ".git", "."),
    capabilities = capabilities,
    handlers = handlers,
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
  }
end

return M
