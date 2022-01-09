# install nixos

follow the [general install instructions](https://nixos.org/manual/nixos/stable/index.html#sec-installation)

- boot the installer system (from iso, usb)
- partition, format, and mount harddisk on `/mnt`
- git clone `renerocksai.stow` repo to `/` (root of installer system)
- copy nixos configuration from `/renerocksai.stow/nixos/` over to `/etc/nixos`
  - don't forget the `xkb` dir!
- replace or extend `/etc/nixos/hardware-configuration.nix`
  - e.g. replace by `/renerocksai.stow/nixos/ryzenamdgpu-hardware.nix`
    - which you probably copied over to `/etc/nixos/ryzenamdgpu-hardware.nix`
  - this is **required** since my `configuration.nix` leaves it to you what bootloader you want and how you name your
    partitions
- `nixos-install`

# post-install

Since ...

- we use `gnu stow` for dotfile management (to have dotfiles for Ubuntu or other machines we SSH into)
- we want to use a plugin manager (for plugin hacking) in nvim and not nix-provided plugins
- our SSH keys are encrypted

... we cannot fully automate everything. Yet. So there are a few post-install steps:

- reboot, log in as `rs`
- git clone `renerocksai.stow` repo right into the `$HOME`
- stow all:
  - `stow bash bin git i3 kitty login nvim ssh starship tmux`
  - **exclude** `alacritty desktop-shortcuts fonts language-servers nixos zsh`
    - we don't use alacritty, zsh will come next, rest is not stowable
- install and configure oh-my-zsh:
  - `bin/install_oh-my-zsh.sh`
  - `rm ~/.zshrc`
  - `stow zsh`
- reload i3 config with `i3-msg reload`

## nvim stuff

start nvim

```vim
:PlugInstall
:helptags ALL
```

let treesitter do its thing

### kotlin language server

If you need it, go to [kotlin-language-server.nixos](https://github.com/renerocksai/kotlin-language-server.nixos). It is
already configured in `init.vim`, but you need to take the executable wrapper from there.

### firenvim

Run firenvim install (repeat if necessary): `bin/install_firenvim.sh`

### markdown preview

Run install (repeat if necessary): `bin/install_markdownpreviewstuff.sh`

## ssh

- scp the secret to the new machine
- then git-uncrypt the stow repo
  - `git-crypt ../stow-repo-git-crypt-key unlock`
  - `stow ssh`
- `chmod ~/.ssh/* 600`

## install conda (optional)

```console
conda-shell
conda-install
conda create -n py39 python==3.9
```

create a link in home to remain compatible with the ubuntu conda:

- `cd ; ln -s .conda anaconda3`

To use:

```console
conda-shell
conda activate py39
```

## nixos (optional)

Make sure we keep tracking changes - optional

```console
cd /etc/nixos
rm configuration.nix
ln -s /home/rs/renerocksai.stow/nixos/configuration.nix
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
{
  # ...

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

  # ...
}
```

## hardware

<https://github.com/NixOS/nixos-hardware>
from
<https://nixos.wiki/wiki/Configuration_Collection>
