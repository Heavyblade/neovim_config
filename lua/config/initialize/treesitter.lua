local parser_configs = require "nvim-treesitter.parsers"
parser_configs.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

vim.cmd.syntax("off")
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    vim.treesitter.start()
  end,
  once = true,
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
  ensure_installed = {
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
  },
})
