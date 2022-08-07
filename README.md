# dotfiles
My public dotfiles and env setup

### Table of contents
- Basic tools: git, brew, wget, etc (Pending)
- Neovim (Pending)
- Node (Pending)
- [Kitty 🐈](#kitty)
- [Tmux](#tmux)

## Kitty
As a terminal I use [Kitty](https://sw.kovidgoyal.net/kitty/). The changes in the configurations are mainly aesthetic. 
```
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
```

## Tmux
```
brew install tmux
```
After the installation it is necessary to add the plugin manager
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
Inside tmux then press `Prefix-i` to install the plugins and `Prefix-r` to reload them (Prefix is Ctrl-b).
