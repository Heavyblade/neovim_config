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

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

for _, plugin in pairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 1
end

vim.b['did_ftplugin'] = 1

require('config.vim_options')
require('plugin_flags')
require('vscode_custom.plugins')
require('vscode_custom.keymaps')

vim.filetype.add({
  extension = {
    ['http'] = 'http',
  },
})
