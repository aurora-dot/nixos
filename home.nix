{ config, pkgs, ... }:
let
  nvimCustom = import ./nvim/settings.nix;
  fishCustom = import ./fish/settings.nix;
  kittyCustom = import ./kitty/settings.nix;
  rofiCustom = import ./rofi/settings.nix;
  i3Custom = import ./i3/settings.nix;
  polybarCustom = import ./i3/polybar.nix;
  picomCustom = import ./i3/picom.nix;
  dunstCustom = import ./dunst/settings.nix;

in {
  # to install: https://rycee.gitlab.io/home-manager/index.html#sec-install-nixos-module

  home-manager.users.blankie = {
    programs.kitty = kittyCustom pkgs;
    programs.neovim = nvimCustom pkgs;
    programs.fish = fishCustom pkgs;
    programs.rofi = rofiCustom pkgs;
    services.polybar = polybarCustom pkgs;
    services.picom = picomCustom pkgs;
    services.dunst = dunstCustom pkgs;
    xsession.windowManager.i3 = i3Custom pkgs;

    home.file.".icons/default".source =
      "${pkgs.bibata-cursors}/share/icons/Bibata-Modern-Classic";

    home.pointerCursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata";
      size = 16;
      gtk.enable = true;
      x11.enable = true;
    };

    gtk = {
      enable = true;
      theme = {
        name = "Dracula";
        package = pkgs.dracula-theme;
      };
    };

    programs.git = {
      enable = true;
      userName = "e";
      userEmail = "e@pastel.codes";
    };
  };
}
