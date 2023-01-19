vim.b['did_ftplugin'] = 1

require('config.vim_options')
require('plugin_flags')
require('plugins')
require('config.initialize.kanagawa')
require('config.lsp')

vim.cmd('colorscheme kanagawa')

vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

require('keymaps')
