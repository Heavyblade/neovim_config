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
- html
- jsonls
- ts_ls
- bash_ls
- vim_ls
- ruby_lsp
- marksman
- sumneko_lua
- pylsp

### Python LSP Server (pylsp)
To make it work properly and load the depencies first install the server on the project environment:

```bash
# install lsp server with basic Dependencies
pip install "python-lsp-server[all]"

# Install extra plugins
pip install pylsp-mypy                                                                                                                                   │
pip install -U mypy                                                                                                                                      │
pip install python-lsp-isort
```

## Font

Some plugins like NerdTree and Trouble display icons on the screen and Need a nerd font compatible, ensure to install one on your terminal.

check [Nerd Fonts website](https://www.nerdfonts.com/) and install [FireCode](https://www.programmingfonts.org/#firacode)

## Proper terminar setup

First we need to install zsh our shell, if we are working with iterm zsh is the shell by default

1) install zsh shell
2) install a couple of needed plugins with homebrew:
    a) brew install zsh-syntax-highlighting
    b) brew install zsh-autosuggestions
    c) brew install zsh-completions
3) install starship for a pretty prompt and set one of their presets
4) install tmux and also to center and colorize the tmux status bar install [tmux-themepack](https://github.com/jimeh/tmux-themepack) use the manual way just with git.
5) install complementary cli tools:
    - bat
    - eza
    - zoxide
    - htop
    - jq
    - pgcli
    - tmuxinator
    - git-delta
    - gh
    - atuin
    - lynx => text browser (for CopilotChat)

## Direnv

To make dir env working

1. install with homebrew

```bash
brew install direnv
```

2. Activate on shell

on .zshrc
```bash
eval "$(direnv hook zsh)"
```
