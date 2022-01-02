## install nixos

follow the general install instructions

- nixos parted, format, mount
- clone stow repo to installer
- copy nixos configuration over
- nixos-install

- boot
- git clone stow repo
- stow all
- install oh-my-zsh, rm generated zsh, stow zsh
- reload i3 config i3-msg reload

## install conda

```console
conda-shell
conda-install
conda create -n py39 python==3.9
```

create a link in home to remain compatible with the ubuntu conda: `ln -s .conda anaconda3`

### install python lsp

```console
cd language-servers
pip install -r requirements.txt
```

## more language-servers and nvim stuff

```console
cargo install stylua
```

start nvim
:PlugInstall
let treesitter do its thing

run download_solmeko.lua from within vim -- takes a while, continue with copying it into its Linux directory:

```console
cd ~/.cache/nvim/nlua/sumneko_lua/lua-language-server/bin
mkdir Linux
cp * Linux/
```

## ssh

scp the secrets to the new machine
then git-uncrypt the stow (and zk) repos
stow ssh
chmod all ./ssh/* to 600

## firenvim

Run firenvim install if necessary:

```console
nvim --headless "+call firenvim#install(0) | q"
```

## nixos

Make sure we keep tracking changes

```console
cd /etc/nixos
rm configuration.nix
ln /home/rs/renerocksai.stow/nixos/configuration.nix # hard link!!!!
```

## open

dap stuff in vim. not important, I hardly ever debug. will look into when more time

# issues

- [x] no helpfiles in nvim!!! --> `:helptags ALL` fixes it!
- [x] paths in i3config : flameshot
