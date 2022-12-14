require('config.vim_options')
require('plugin_flags')
require('plugins')
require('config.initialize.kanagawa')
require('config.lsp')

vim.cmd("syntax on")
vim.cmd('colorscheme kanagawa')

vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

require('keymaps')
