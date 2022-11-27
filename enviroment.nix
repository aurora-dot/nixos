{ pkgs, ... }: {
  environment.pathsToLink = [ "/libexec" ];
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.variables = {
    EDITOR = "nvim";
    SUDO_EDITOR = "nvim";
    MOZ_USE_XINPUT2 = "1";
  };
}
