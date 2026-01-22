local parser_configs = require "nvim-treesitter.parsers"
parser_configs.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

local ensure_installed = {
  "ruby",
  "go",
  "javascript",
  "html",
  "slim",
  "tsx",
  "lua",
  "markdown",
  "markdown_inline",
  "http",
  "json",
  "diff",
  "python",
  "sql",
  "svelte"
}

vim.api.nvim_create_autocmd('FileType', {
  pattern = ensure_installed,
  callback = function(args)
    vim.treesitter.start(args.buf, args.match)
  end
})

require('nvim-treesitter.config').setup({
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = ensure_installed,
})

require('nvim-treesitter').install(ensure_installed)
