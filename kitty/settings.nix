{ pkgs, ... }: {
  enable = true;
  settings = {
    window_padding_width = "10 10 10 10";
    background_opacity = "0.9";
  };
  font = {
    name = "FiraCode Nerd Font";
    size = 12;
  };
  theme = "Dracula";
}
