## Installation
1) To install Neovim check the [official docs](https://github.com/neovim/neovim/wiki/Installing-Neovim)
2) Clone this repository on your ```~/.config/nvim``` folder.

## Dependencies

Some plugins had dependencies on system tools:

- languages needd => go, ruby, lua, nodejs
- fzf
- ripgrep
- tree-sitter
- gcc (gcc-12 in particular installed with homebrew)
- nodejs >= 20 (so Mason can properly install lsp servers)

Some LSP servers are defined (they are going to be auto installed by Mason lsp manager):

- gopls
- solargraph
- tsserver
- sumneko_lua
- vimls

## Font

Some plugins like NerdTree and Trouble display icons on the screen and Need a nerd font compatible, ensure to install one on your terminal.

check [Nerd Fonts website](https://www.nerdfonts.com/)


## Solargraph

To solargraph work properly with Rubocop is important to set a `.solargraph.yml` file on your home like:

```yaml
  include:
  - "**/*.rb"
  exclude:
  - spec/**/*
  - test/**/*
  - vendor/**/*
  - ".bundle/**/*"
  require: []
  domains: []
  reporters:
  - rubocop
  - require_not_found
  max_files: 5000
```

### Rest nvim

First we need to install lua:

```bash
asdf plugin-add lua https://github.com/Stratus3D/asdf-lua.git
asdf install lua 5.1
echo "lua 5.1" > ~/.tool-version
asdf global lua 5.1

brew install luarocks
```
then we need to install some specific rocks

```bash
luarocks install lua-curl
luarocks install nvim-nio
luarocks install mimetypes
luarocks install xml2lua
```
## Proper terminar setup

First we need to install zsh our shell, if we are working with iterm zsh is the shell by default

1) install zsh shell
2) install a couple of needed plugins with homebrew:
    a) brew install zsh-syntax-highlighting
    b) brew install zsh-autosuggestions
    c) brew install zsh-autocompletions
3) install starship for a pretty prompt and set one of their presets
4) install tmux and also install [tmux-themepack](https://github.com/jimeh/tmux-themepack) to center and colorize the tmux status bar.
5) install complementary cli tools:
- bat
- exa
- zoxide
- htop
- jq
- pgcli
- tmuxinator
- git-delta
