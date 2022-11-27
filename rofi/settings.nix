{ pkgs, ... }:
{
  enable = true;
  plugins = with pkgs; [
    rofi-calc
    rofi-power-menu
  ];
  theme = "/etc/nixos/rofi/config.rasi";
  font = "FiraCode Nerd Font 12";
  extraConfig = {
    modi = "drun,ssh,calc,window";
  };
}
