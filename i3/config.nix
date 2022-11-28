{ pkgs, lib, ... }:
let
  mod = "Mod4";
  term = "kitty";
  bg-color = "#bd93f9";
  inactive-bg-color = "#3d2f52";
  text-color = "#1b1524";
  border-color = "#bd93f9";
  inactive-border-color = "#3d2f52";
  inactive-text-color = "#f8f8f2";
  urgent-bg-color = "#ff5555";
  indicator-color = "#bd93f9";
  inactive-indicator-color = "#3d2f52";
in {
  modifier = mod;
  terminal = term;
  fonts = {
    names = [ "FiraCode Nerd Font" ];
    size = 11.0;
  };

  colors = {
    background = bg-color;
    focused = {
      background = bg-color;
      border = border-color;
      indicator = indicator-color;
      text = text-color;
      childBorder = border-color;
    };
    focusedInactive = {
      background = inactive-bg-color;
      border = inactive-border-color;
      indicator = inactive-indicator-color;
      text = inactive-text-color;
      childBorder = inactive-border-color;
    };
    unfocused = {
      background = inactive-bg-color;
      border = inactive-border-color;
      indicator = inactive-indicator-color;
      text = inactive-text-color;
      childBorder = inactive-border-color;
    };
    urgent = {
      background = urgent-bg-color;
      border = urgent-bg-color;
      indicator = indicator-color;
      text = text-color;
      childBorder = border-color;
    };
  };

  keybindings = lib.mkOptionDefault {
    "${mod}+u" = "border none";
    "${mod}+y" = "border pixel 3";
    "${mod}+n" = "border normal";
    "${mod}+t" = "exec kitty";
    "${mod}+q" = "kill";

    # alternatively, you can use the cursor keys:
    "${mod}+Left" = "focus left";
    "${mod}+Down" = "focus down";
    "${mod}+Up" = "focus up";
    "${mod}+Right" = "focus right";

    # alternatively, you can use the cursor keys:
    "${mod}+Shift+Left" = "move left";
    "${mod}+Shift+Down" = "move down";
    "${mod}+Shift+Up" = "move up";
    "${mod}+Shift+Right" = "move right";

    # split in horizontal orientation
    "${mod}+b" = "split h";

    # split in vertical orientation
    "${mod}+v" = "split v";

    # enter fullscreen mode for the focused container
    "${mod}+Shift+f" = "fullscreen toggle";

    # change container layout (stacked, tabbed, toggle split)
    "${mod}+Shift+s" = "layout stacking";
    "${mod}+Shift+w" = "layout tabbed";
    "${mod}+Shift+t" = "layout toggle split";

    # toggle tiling / floating
    "${mod}+Shift+d" = "floating toggle";

    # change focus between tiling / floating windows
    "${mod}+Shift+a" = "focus mode_toggle";

    # switch to workspace
    "${mod}+1" = "workspace 1";
    "${mod}+2" = "workspace 2";
    "${mod}+3" = "workspace 3";
    "${mod}+4" = "workspace 4";
    "${mod}+5" = "workspace 5";
    "${mod}+6" = "workspace 6";
    "${mod}+7" = "workspace 7";
    "${mod}+8" = "workspace 8";
    "${mod}+9" = "workspace 9";
    "${mod}+0" = "workspace 10";

    # move focused container to workspace
    "${mod}+Shift+1" = "move container to workspace 1";
    "${mod}+Shift+2" = "move container to workspace 2";
    "${mod}+Shift+3" = "move container to workspace 3";
    "${mod}+Shift+4" = "move container to workspace 4";
    "${mod}+Shift+5" = "move container to workspace 5";
    "${mod}+Shift+6" = "move container to workspace 6";
    "${mod}+Shift+7" = "move container to workspace 7";
    "${mod}+Shift+8" = "move container to workspace 8";
    "${mod}+Shift+9" = "move container to workspace 9";
    "${mod}+Shift+0" = "move container to workspace 10";

    # reload the configuration file
    "${mod}+Shift+q" = "reload";

    # exit i3 (logs you out of your X session)
    "${mod}+Shift+X" =
      "exec i3-nagbar -t warning -m 'Do you want to exit i3?' -b 'Yes' 'i3-msg exit'";

    "${mod}+r" = "mode 'resize'";

    # set $refresh_i3status killall -SIGUSR1 i3status
    "${mod}+g" = "exec --no-startup-id pamixer -d 2";
    "${mod}+h" = "exec --no-startup-id pamixer -i 2";
    "${mod}+m" =
      "exec --no-startup-id pactl set-sink-mute @DEFAULT_SINK@ toggle";

    # mute
    "${mod}+Shift+m" =
      "exec --no-startup-id pactl set-source-mute @DEFAULT_SOURCE@ toggle";

    "${mod}+a" = "exec mocp --toggle-pause";
    "${mod}+s" = "exec mocp --stop";
    "${mod}+d" = "exec mocp --previous";
    "${mod}+f" = "exec mocp --next";

    # Switch workspaces
    "${mod}+bracketleft" = "workspace prev";
    "${mod}+bracketright" = "workspace next";

    # rofi bindings fancy menu
    "${mod}+space" =
      "exec rofi -modi drun -show drun -line-padding 4 -columns 1 -padding 50 -hide-scrollbar -show-icons -drun-icon-theme 'Dracula' -font 'FiraCode Nerd Font Regular 11'";
    "${mod}+Shift+space" =
      "exec rofi -show window -line-padding 4 -lines 6 -padding 50 -hide-scrollbar -show-icons -drun-icon-theme 'Dracula' -font 'FiraCode Nerd Font Regular 10'";
    "${mod}+Shift+p" =
      "--release scrot -s -e 'xclip -selection c -t image/png < $f && mv $f ~/Pictures/Screenshots'";
    "${mod}+p" =
      "--release exec scrot -e 'xclip -selection c -t image/png < $f && mv $f ~/Pictures/Screenshots' ";
  };

  modes = {
    resize = {
      Return = "mode default";
      Escape = "mode default";

      h = "resize shrink width 10 px or 10 ppt";
      j = "resize grow height 10 px or 10 ppt";
      k = "resize shrink height 10 px or 10 ppt";
      l = "resize grow width 10 px or 10 ppt";

      # same bindings, but for the arrow keys
      Left = "resize shrink width 10 px or 10 ppt";
      Down = "resize grow height 10 px or 10 ppt";
      Up = "resize shrink height 10 px or 10 ppt";
      Right = "resize grow width 10 px or 10 ppt";
    };
  };

  window = {
    titlebar = false;
    border = 4;
  };
  gaps = {
    inner = 10;
    outer = 0;
  };

  bars = [ ];

  startup = [
    # { command = "--no-startup-id lxsession &"; always = true; }
    {
      command = "--no-startup-id picom --experimental-backends";
      always = true;
    }
    {
      command = "--no-startup-id feh --bg-center /etc/nixos/wallpaper.png";
      always = true;
    }
    {
      command = "--no-startup-id polybar";
      always = true;
    }
    {
      command = "--no-startup-id nitrogen --restore";
      always = true;
    }
    {
      command = "--no-startup-id exec i3-msg workspace 1";
      always = true;
    }
  ];

  workspaceLayout = "default";
  floating.modifier = "${mod}";
  focus.followMouse = true;
}

