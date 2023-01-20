-- Disable some builtin vim plugins
local disabled_built_ins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "matchit",
  "matchparen",
  "tar",
  "tarPlugin",
  "rrhelper",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
}

for _, plugin in pairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 1
end

vim.b['did_ftplugin'] = 1

require('config.vim_options')
require('plugin_flags')
require('plugins')
require('config.initialize.kanagawa')
require('config.lsp')

vim.cmd('colorscheme kanagawa')

vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

require('keymaps')
