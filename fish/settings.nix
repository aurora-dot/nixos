{ pkgs, ... }: {
  enable = true;
  shellInit = ''
    any-nix-shell fish --info-right | source
    starship init fish | source
  '';
  plugins = [
    {
      name = "starship";
      src = pkgs.starship;
    }
    {
      name = "nix-env.fish";
      src = pkgs.fetchFromGitHub {
        owner = "lilyball";
        repo = "nix-env.fish";
        rev = "7b65bd228429e852c8fdfa07601159130a818cfa";
        sha256 = "sha256-RG/0rfhgq6aEKNZ0XwIqOaZ6K5S4+/Y5EEMnIdtfPhk=";
      };
    }
  ];
}
