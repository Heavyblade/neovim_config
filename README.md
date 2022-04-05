## Installation

1) To install Neovim check the [official docs](https://github.com/neovim/neovim/wiki/Installing-Neovim)

2) To properly handle dependencies ensure to install [Packer](https://github.com/wbthomason/packer.nvim#quickstart) after neovim has been installed.

3) Clone this repository on your ```~/.config/nvim``` folder.

## Dependencies

Some plugins had dependencies on system tools:

- ctags
- fzf
- ripgrep
- tree-sitter

Some LSP servers are defined (they are going to be auto installed by Lsp client):

- gopls
- solargraph
- tsserver
- sumneko_lua
- vimls

## Font

Some plugins like NerdTree and Trouble display icons on the screen and Need a nerd font compatible, ensure to install one on your terminal.

check [Nerd Fonts website](https://www.nerdfonts.com/)
