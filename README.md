# What to install

## I have put all this in a nixos config. See [NixOS](nixos.md) for how I install my system

Eventually, we might go down the ansible route.

## Essentials

While this is a good starting point, it is not really maintained since my switch to NixOS - see my nixos config for what I use to install.

- binutils
- build-essential, cmake
- neovim, [see below](#neovim)
- git
- git-crypt
- stow
- i3
- zsh
  - oh-my-zsh
  - [starship](#starship-prompt)
- tmux
- htop
- ncdu
- xclip
- ripgrep
- zig
- python
  - anaconda python 3.9 (version checks of some shitty tools fail with 3.10)
- lua5.1
  - stylua
    - via [github](https://github.com/JohnnyMorganz/StyLua) releases or cargo (install first)
    - on nixos: done automatically
  - luacheck
    - via apt or luarocks (install first)
    - on nixos: done automatically
- flutter
- libasound2-dev
- mediainfo
- zip, unzip
- p7zip
- rar
- xz-utils
- real-prog-qwerty

### more stuff

- obs-studio
- texlive
- sdl2-dev
- steam-installer
- flameshot
- discord
- samba client / utils
- (audacity)
- krita
- cloc
- docker-ce
- ffmpeg
- firefox
- gcc, g++
- gimp
- ghdl, gtkwave
- kicad, freecad
- imagemagick
- jq
- insomnia
- mongodb-org
- ninja-tools
- nodejs

## neovim

See [here](https://github.com/neovim/neovim/wiki/Installing-Neovim#install-from-source) for more info.

```console
git clone
make CMAKE_BUILD_TYPE=Release
sudo make install
```

```console
pip install neovim
```

## firenvim

- browser plugin
- then:
  - bro tip from theprimeagen: use a truthy number instead of 0 below for all non-chrome or firefox:  chromium browsers like chromium, brave, etc
  - see [theprimeagen's video](https://www.youtube.com/watch?v=ID_kNcj9cMo) for install issues with brave

```console
nvim --headless "+call firenvim#install(0) | q"
```

## Language Servers

### Python

```console
$ cd language-servers

# to get all the python lsp stuff
$ pip install -r requirements.txt
```

on nixos, do this in a conda env and use the conda env when editing python files. if entering a conda env is too much
work, then use `bin/pylsp.sh` as language server (rename it to pylsp).

Update: on nixos, `bin/pylsp` does this without conda in a clean, transparent nix-shell.

#### Debugging Python

```console
./bin/installers/install_debugpy.sh
```

The rest is in the nvim config.

**Note**: anaconda comes with `debugpy` already! So you might want to change the nvim
dap configuration to use the default (anaconda) debugpy.

**Note**: Check the `dap.configurations.python`: there you can see how venvs are loaded, etc.

### lua

- Execute `~/.config/nvim/bundle/nlua.nvim/scripts/download_sumneko.lua via`
  - `:luafile %` after loading it in nvim.
- then copy the executable and supporting files like shown below:

```console
cd ~/.cache/nvim/nlua/sumneko_lua/lua-language-server/bin
mkdir Linux
cp * Linux/
```

### zig

Download the zig language server from github and unpack it in ~/bin/

On NixOS, this is done automatically.

### markdownlint (for null-ls)

```console
sudo npm install -g markdownlint-cli
```

on nixos, this is done automatically

## Debugging

There is some really good stuff in the [Neovim DAP Enhanced](https://alpha2phi.medium.com/neovim-dap-enhanced-ebc730ff498b) article, which I used for pimping my DAP stuff.

Check it out, it recommends using DAPInstall for additional languages.

## starship prompt

```console
sh -c "$(curl -fsSL https://starship.rs/install.sh)"
```

on nixos, this is done automatically
