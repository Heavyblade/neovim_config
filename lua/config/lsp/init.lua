local M = {}

function canUseSorbet()
  local currentDirectory = vim.fn.getcwd()
  return string.find(currentDirectory, "ruby%-lsp") ~= nil
end

function get_node_modules_folder()
  local cwd = vim.fn.getcwd()
  local paths = {
    cwd .. "/application/node_modules",
    cwd .. "/node_modules"
  }
  for _, path in ipairs(paths) do
    if vim.fn.isdirectory(path) == 1 then
      return path
    end
  end
  return ""
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
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
      },
    },
  },
  ts_ls = {},
  bashls = {},
  vimls = {},
  ruby_lsp = {
    -- cmd = { os.getenv("HOME") .. "/.rbenv/shims/ruby-lsp", '--debug', 'stdio' },
    cmd = { os.getenv("HOME") .. "/.rbenv/shims/ruby-lsp", 'stdio' },
    root_markers = { 'Gemfile', '.git' },
    settings = {
      addonSettings = {
        ["Ruby LSP Rails"] = { enablePendingMigrationsPrompt = false }
      }
    }
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
  svelte = {
    cmd = { get_node_modules_folder() .. "/svelte-language-server/bin/server.js", '--stdio' },
  },
  emmet_ls = {
    filetypes = { 'html', 'erb' },
  },
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
