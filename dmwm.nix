{ pkgs, ... }: 
  {
    # Configure keymap in X11
    services.xserver = {
      layout = "us";
      xkbVariant = "";
    };

    # Enable the X11 windowing system.
    services.xserver.enable = true;

    # Enable the LXQT Desktop Environment.
    services.xserver.displayManager.lightdm.enable = true;
    services.xserver.desktopManager.lxqt.enable = true;

    # Enable the GNOME Desktop Environment.
    # services.xserver.displayManager.gdm.enable = true;
    services.xserver.displayManager.lightdm.greeters.mini = {
      enable = true;
      user = "blankie";
      extraConfig = ''
        [greeter]
        show-password-label = true
        [greeter-theme]
        background-image = ""
	font = "FiraCode Nerd Font"
	text-color = "#f8f8f2"
	error-color = "#ff5555"
	background-color = "#282a36"
	window-color = "#44475a"
	border-color = "#bd93f9"
	password-background-color = "#282a36"
	password-color = "#f8f8f2"
	password-border-color = "#bd93f9"
       '';
    };
    

    services.xserver.desktopManager = { xterm.enable = false; };

    services.xserver.displayManager = { defaultSession = "none+i3"; };

    services.xserver.windowManager = {
      i3 = {
        package = pkgs.i3-gaps;
        enable = true;
        extraPackages = with pkgs; [
          dmenu
          autotiling
          brightnessctl
          xorg.xev
          dunst
          libnotify
          python311
          find-cursor
        ];
      };
    };
    services.xserver.desktopManager.gnome.enable = true;
  }
