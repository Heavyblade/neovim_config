local config_lsp = vim.lsp.config
local navic = require("nvim-navic")
local M = {}

local function on_attach(client, bufnr)
  -- Enable completion triggered by <C-X><C-O>
  -- See `:help omnifunc` and `:help ins-completion` for more information.
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  if client.server_capabilities.documentSymbolProvider and client.name ~= 'sorbet' then
    navic.attach(client, bufnr)
  end
  -- Use LSP as the handler for formatexpr.
  -- See `:help formatexpr` for more information.
  vim.api.nvim_buf_set_option(0, "formatexpr", "v:lua.vim.lsp.formatexpr()")

  -- Configure key mappings
  require("config.lsp.keymaps").setup(bufnr)

  vim.diagnostic.config({
    virtual_text = false,
  })

  if client.name ~= 'pylsp' then
    print("LSP Server Ready [" .. client.name .. "]")
  end
end

local function getOptions(server_name)
  local border = {
    { "╭", "FloatBorder" },
    { "─", "FloatBorder" },
    { "╮", "FloatBorder" },
    { "│", "FloatBorder" },
    { "╯", "FloatBorder" },
    { "─", "FloatBorder" },
    { "╰", "FloatBorder" },
    { "│", "FloatBorder" },
  }

  local handlers = {
    ["textDocument/publishDiagnostics"] = vim.lsp.with(
      vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = false,
        underline = true,
        signs = true,
        update_in_insert = false
      }
    ),
    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
    ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
  }
  local capabilities = vim.lsp.protocol.make_client_capabilities()

  if server_name == 'pylsp' then
   capabilities.textDocument.formatting = nil
  end

  local opts = {
    on_attach = on_attach,
    handlers = handlers,
    flags = {
      debounce_text_changes = 150,
    },
    capabilities = capabilities,
  }

  return opts
end

function M.setup(servers)
  for server_name, _ in pairs(servers) do
    local options = getOptions(server_name)
    local opts = vim.tbl_deep_extend("force", options, servers[server_name] or {})
    config_lsp(server_name, opts)
  end
end

return M
