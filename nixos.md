## install nixos

follow the general install instructions

- nixos parted, format, mount
- clone stow repo to installer
- copy nixos configuration over
  - don't forget the `xkb` dir!
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

## nvim stuff

start nvim

```vim
:PlugInstall
:helptags ALL
```

let treesitter do its thing

run download_solmeko.lua from within vim -- takes a while, continue with copying it into its Linux directory:

```console
cd ~/.cache/nvim/nlua/sumneko_lua/lua-language-server/bin
mkdir Linux
cp * Linux/
```

### firenvim

Run firenvim install (repeat if necessary): `bin/install_firenvim.sh`

### markdown preview

Run install (repeat if necessary): `bin/install_markdownpreviewstuff.sh`

## ssh

- scp the secrets to the new machine
- then git-uncrypt the stow (and zk) repos
- `stow ssh`
- `chmod ~/.ssh/* 600`

## nixos (optional)

Make sure we keep tracking changes - optional

```console
cd /etc/nixos
rm configuration.nix
ln /home/rs/renerocksai.stow/nixos/configuration.nix # hard link!!!!
```

## open

dap stuff in vim. not important, I hardly ever debug. will look into when more time. will probably do it in a nix-shell
similar to the one used for pylsp

# stuff for later

stuff to try out I found on the internets

- uget -- download manager
- blueman -- bluetooth
- wirelesstools

- android-studio
- genymotion -- android emulator
- openjdk
- watchman

- steam

## insptirations from areina

```nix
  virtualisation.virtualbox.host.enable = true;

  # battery management
  services.tlp.enable = true;

  environment.pathsToLink = [
    "/share/xfce4"
    "/share/themes"
    "/share/mime"
    "/share/desktop-directories"
    "/share/gtksourceview-2.0"
  ];

  services.xserver.displayManager.sessionCommands = ''
    # Set GTK_PATH so that GTK+ can find the theme engines.
    export GTK_PATH="${config.system.path}/lib/gtk-2.0:${config.system.path}/lib/gtk-3.0"
    # Set GTK_DATA_PREFIX so that GTK+ can find the Xfce themes.
    export GTK_DATA_PREFIX=${config.system.path}
    # SVG loader for pixbuf
    export GDK_PIXBUF_MODULE_FILE=$(echo ${pkgs.librsvg.out}/lib/gdk-pixbuf-2.0/*/loaders.cache)
    # Set XDG menu prefix
    export XDG_MENU_PREFIX="lxde-"
  '';

  users.extraUsers.xxx = {
    # ...
    extraGroups = ["wheel" "networkmanager" "vboxusers" "docker" ];
    shell = "/run/current-system/sw/bin/zsh";
  }
```

## hardware

<https://github.com/NixOS/nixos-hardware>
from
<https://nixos.wiki/wiki/Configuration_Collection>
