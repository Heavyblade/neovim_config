require('config.vim_options')

require('plugins')
require('initialize')
require('config.lsp')

vim.cmd("syntax on")
vim.cmd('colorscheme tokyonight')

require('keymaps')
require('configurations')

