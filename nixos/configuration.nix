# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, lib, ... }:
#let unstable = import<nixos-unstable> {};
#in
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # this is on by default:
  hardware.opengl.driSupport = true;  
  # For 32 bit applications like steam
  hardware.opengl.driSupport32Bit = true;

  networking.networkmanager.enable = true;

  # extra /etc/hosts entries: 
  networking.extraHosts = 
    ''
      127.0.0.1 cr.nim.org
    '';
  programs.nm-applet.enable = true;


  # Set your time zone.
  time.timeZone = "Europe/Berlin";


  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # Enable the X11 windowing system.
  environment.pathsToLink = [ "/libexec" ]; # links /libexec from derivations to /run/current-system/sw 

  services.xserver.enable = true;

  # Enable the Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;  
  services.xserver.windowManager.i3.enable = true;
  services.xserver.windowManager.i3.package = pkgs.i3-gaps;
  services.xserver.windowManager.i3.extraPackages = with pkgs; [
    dmenu
    i3status
    i3lock
    i3blocks
    # unstable.rofi unstable.rofi-calc unstable.rofi-file-browser unstable.rofi-power-menu
    rofi rofi-calc rofi-file-browser rofi-power-menu
  ];

  services.xserver.desktopManager.wallpaper.combineScreens = false;
  services.xserver.desktopManager.wallpaper.mode = "fill";

  

  # Configure keymap in X11
  services.xserver.layout = "us";
  services.xserver.extraLayouts.real-prog-qwerty = {
    description = "Real Programmer's QWERTY";
    languages = [ "eng" ];
    symbolsFile = /etc/nixos/xkb/symbols/real-prog-qwerty;
  };

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.rs = {
    initialPassword = "rs";
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" "dialout" "networkmanager" "cdrom" ]; # Enable ‘sudo’ for the user, docker, dialout for arduino
    shell = pkgs.zsh;
  };

  nixpkgs.config.allowUnfree = true;

  # # palo alto global protect 
  # services.globalprotect = {
  #   enable = true;
  #   # host integrity protection report:
  #   csdWrapper = "${pkgs.openconnect}/libexec/openconnect/hipreport.sh";
  # };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    firefox
    kitty
    neovim
    git
    git-crypt
    stow
    tmux
    file
    
    htop ncdu 
    xclip
    ripgrep

    binutils gnutar gzip gnumake gcc binutils coreutils gawk gnused patchelf findutils
    elfutils colordiff diff-so-fancy
    cmake pkgconfig 
    unixtools.killall 
    ghdl gtkwave gnome3.adwaita-icon-theme breeze-icons
    ninja
    starship
    conda   # run conda-shell, then within: conda-install
    neofetch

    cargo 

    stylua
    (lua.withPackages(ps: with ps; [ busted luafilesystem luacheck ]))
    sumneko-lua-language-server

    mediainfo
    zip unzip p7zip rar xz unrar
    
    ffmpeg cloc flameshot gimp imagemagick jq 

    nodejs nodePackages.yarn
    nodePackages.markdownlint-cli    # this
 
    SDL2
    xorg.libX11 
    xorg.libX11.dev
    xorg.libXcursor
    xorg.libXinerama
    xorg.xinput
    xorg.libXrandr
    glew
    pkgs.gtk3
    libGL
    pkgs.gtk3

    # broken. we solve it with nix-shells and poetry
    # (python3.withPackages(ps: [
    #   ps.python-lsp-server
    #   ps.pyls-mypy ps.pyls-isort ps.pyls-black ps.pyls-flake8
    # ]))

    google-chrome

    obs-studio kdenlive
    krita
    cloc

    texlive.combined.scheme-full
    # NixOS 22.05: smbclient -> samba
    samba
    audacity
    
    kicad
    freecad

    zig zls 
    gnome.zenity # for slides to launch outside of nix-shell

    pavucontrol pasystray

    xorg.xhost ueberzug  # for telekasten img preview, xhost +

    youtube-dl vlc mpv haruna mplayer
    ghostscript
    
    okular feh 

    # file manager(s)
    # dolphin : can't get thumbnails to work
    dolphin
    xfce.thunar xfce.tumbler ffmpegthumbnailer
    gnome.nautilus gnome.sushi
    
    neomutt openssl 

    # furhat SDK
    appimage-run 

    # NAO SDK and RobotSettings
    steam-run

    # eventually, we need some office crap
    libreoffice-qt

    signal-desktop

    aerc w3m dante
    cmus

    
    # palo alto globalprotect
    # globalprotect-openconnect

    # maybe later
    # libreoffice
    # steam
    # mongodb
    # insomnia
  ];

  # rene nvim nightly
  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    }))
  ];
  
  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  # furhat SDK needs jdk 
  programs.java = {
    enable = true;                # this also sets JAVA_HOME system-wide!!!
    package = pkgs.jdk8;
  };

  # the Furhat GestureCapture tool needs gtk schemas
  # not sure this is needed anymore since we have our nix shell
  programs.dconf.enable = true;

 # programs.zsh.enable = true;
 # programs.zsh = {
 #   oh-my-zsh = {
 #     enable = true;
 #   };
 # };
      
  

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    passwordAuthentication = true;   # for now
    permitRootLogin = "no";
    #challengeResponseAuthentication = false; # or "yes" or "no"??
  };

  # rene mongodb with defaults -- is SOOOOO old, it's "unusable" with pymongo
  # even older than the one on our 2-3 years old aws instance
  # services.mongodb.enable = true;

  virtualisation.docker.enable = true;

  users.users.root.initialHashedPassword = "";


  # from https://discourse.nixos.org/t/making-lib64-ld-linux-x86-64-so-2-available/19679
  # removing the need to patchelf-ing executables 
  # this is not how NixOS should be used, but makes things easier
  system.activationScripts.ldso = lib.stringAfter [ "usrbinenv" ] ''
    mkdir -m 0755 -p /lib64
    ln -sfn ${pkgs.glibc.out}/lib64/ld-linux-x86-64.so.2 /lib64/ld-linux-x86-64.so.2.tmp
    mv -f /lib64/ld-linux-x86-64.so.2.tmp /lib64/ld-linux-x86-64.so.2 # atomically replace
  '';

  system.stateVersion = "21.11"; # Did you read the comment?
}

