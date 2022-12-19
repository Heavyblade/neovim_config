local parser_configs = require "nvim-treesitter.parsers".get_parser_configs()
parser_configs.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

-- Add neorg parsers
parser_configs.norg = {
  install_info = {
    url = 'https://github.com/nvim-neorg/tree-sitter-norg',
    files = { 'src/parser.c', 'src/scanner.cc' },
    branch = 'main',
  },
  maintainers = { '@nvim-neorg' },
}
parser_configs.norg_meta = {
  install_info = {
    url = 'https://github.com/nvim-neorg/tree-sitter-norg-meta',
    files = { 'src/parser.c' },
    branch = 'main',
  },
  maintainers = { '@nvim-neorg' },
}
parser_configs.norg_table = {
  install_info = {
    url = 'https://github.com/nvim-neorg/tree-sitter-norg-table',
    files = { 'src/parser.c' },
    branch = 'main',
  },
  maintainers = { '@nvim-neorg' },
}

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
    "norg",
    "lua",
    "markdown",
  },
}
