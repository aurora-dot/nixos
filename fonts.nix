{ pkgs, ... }: {
  fonts.fonts = with pkgs; [
      (nerdfonts.override { fonts = [ "FiraCode" "FiraMono" ]; })
      twemoji-color-font
      unifont
      siji
      font-awesome_5
    ];
}

