{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    qjackctl
    bintools
    pkg-config
    openssl
    gnome.gnome-keyring
    xclip
    pavucontrol
    neovim
    kitty
    fish
    vscode
    gitkraken
    gnome3.gnome-tweaks
    firefox
    spotify
    starship
    wget
    python
    rustup
    rust-analyzer
    brightnessctl
    rofi
    dunst
    lxsession
    networkmanagerapplet
    git
    pulseaudio
    scrot
    lagrange
    gnupg
    cmake
    gcc
    bintools-unwrapped
    picom
    # blueman-applet
    nitrogen
    pamixer

    # internet
    ungoogled-chromium
    curl
    git
    networkmanagerapplet
    tor-browser-bundle-bin
    mullvad-vpn
    tdesktop
    syncthing
    slack

    # files and partitions
    gnome.gnome-disk-utility
    xfce.thunar
    p7zip
    xarchiver

    # music / sound
    cmus
    pavucontrol
    playerctl
    paprefs

    # video
    mpv
    yt-dlp

    # images
    feh
    viewnior
    gimp
    krita
    gnome.cheese

    # pdf
    evince

    # x11
    arandr
    lxappearance

    # window manager
    rofi
    rofimoji
    dmenu

    # dev
    ## js
    nodejs
    nodePackages.prettier
    ## python
    python311
    black
    # 3d
    blender
    # db
    postgresql
    dbeaver

    # help
    tldr

    # nix tools
    ## formatter for .nix files
    nixpkgs-fmt
    ## find nix packages containing certain files
    nix-index

    # system tools
    htop
    gnome.gnome-clocks
    blueberry

  ];

  programs.neovim.defaultEditor = true;
  programs.neovim.viAlias = true;

  programs.nm-applet.enable = true;
  programs.seahorse.enable = true;
  programs.dconf.enable = true;

  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.opengl.enable = true;

  systemd.user.services.pipewire-pulse.path = [ pkgs.pulseaudio ];
}
