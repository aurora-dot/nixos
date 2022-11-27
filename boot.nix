{ pkgs, ... }: {
  # Bootloader.
  # boot.loader.systemd-boot.enable = true;
  # boot.loader.efi.canTouchEfiVariables = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";

  boot.supportedFilesystems = [ "ntfs" ];

  # Bootloader.
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi"; # ← use the same mo>
    };
    grub = {
      efiSupport = true;
      #efiInstallAsRemovable = true; # in case canTouchEf>
      device = "nodev";
      enable = true;
      version = 2;
      useOSProber = true;
      extraConfig = ''
        GRUB_DEFAULT=saved
        GRUB_SAVEDEFAULT=true
      '';
      default = "saved";
    };
  };
}
