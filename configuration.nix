# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }: {
  imports = [
    <home-manager/nixos>
    ./hardware-configuration.nix
    ./packages.nix
    ./audio.nix
    ./boot.nix
    ./dmwm.nix
    ./enviroment.nix
    ./fonts.nix
    ./packages.nix
    ./services.nix
    ./user.nix
    ./networking.nix
    ./home.nix
    ./systemd.nix
  ];

  xdg.portal.wlr.enable = true;

  hardware.bluetooth.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/London";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.utf8";

  # Configure console keymap
  console.keyMap = "us";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "22.05"; # Did you read the comment?

}
