{ pkgs, ... }: {
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.blankie = {
    shell = pkgs.fish;
    isNormalUser = true;
    description = "esther";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs;
      [
        #
      ];
  };
}
