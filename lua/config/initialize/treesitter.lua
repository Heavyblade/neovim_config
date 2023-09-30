local parser_configs = require "nvim-treesitter.parsers".get_parser_configs()
parser_configs.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

require('nvim-treesitter.configs').setup {
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
    "tsx",
    "lua",
    "markdown",
    "http", 
    "json",
  },
}
