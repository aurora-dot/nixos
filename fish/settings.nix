{ pkgs, ... }: {
  enable = true;
  shellInit = ''
    starship init fish | source
  '';
  plugins = [{
    name = "starship";
    src = pkgs.starship;
  }];
}
