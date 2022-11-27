{ pkgs, ... }:

let
  background = "#df282a36";
  background-alt = "#44475a";
  foreground = "#f8f8f2";
  foreground-alt = "#ff79c6";
  primary = "#bd93f9";
  secondary = "#ffb86c";
  alert = "#ff5555";
in {
  package = pkgs.polybar.override {
    i3GapsSupport = true;
    pulseSupport = true;
    mpdSupport = true;
    alsaSupport = true;
    iwSupport = true;
    githubSupport = true;
  };

  enable = true;

  script = ''
  killall -q polybar
  while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done
  polybar top &
  '';

  config = {
    "bar/top" = {
      width = "100%";
      height = "27";

      enable-ipc = "true";

      background = "${background}";
      foreground = "${foreground}";

      line-size = 3;
      line-color = "#f00";

      padding-left = 0;
      padding-right = 2;

      module-margin-left = 1;
      module-margin-right = 2;

      font-0 = "fixed:pixelsize=10;1";
      font-1 = "Unifont:size=8:antialias=false;0";
      font-2 = "siji:pixelsize=10;1";
      font-3 = "Twitter Color Emoji:scale=12:antialias=false;0";
      font-4 = "Font Awesome 5 Free:style=Solid:pixelsize=8;2";
      font-5 = "Font Awesome 5 Brands:style=Regular:pixelsize=8;2";
      font-6 = "Font Awesome 5 Free:style=Regular:size=8;2";

      fixed-center = true;
      modules-left = "i3";
      modules-center = "xwindow";
      modules-right = "pulseaudio temperature date";
      tray-position = "right";
      cursor-click = "pointer";
      cursor-scroll = "ns-resize";
    };

    "module/filesystem" = {
      type = "internal/fs";
      interval = "25";

      mount-0 = "/";
      mount-1 = "/home";

      label-mounted = "%{F#0a81f5}%mountpoint%%{F-}: %percentage_used%%";
      label-unmounted = "%mountpoint% not mounted";
      label-mounted-foreground = "${foreground}";
      label-unmounted-foreground = "${foreground}";
      label-mounted-underline = "${primary}";
    };

    "module/spacer" = {
      type = "custom/text";
      content = "|";
    };

    "module/xwindow" = {
      type = "internal/xwindow";
      label = "%title%";
      label-maxlen = "50";
      label-foreground = "${foreground}";
      label-background = "${background}";
      format-underline = "#bd93f9";
      label-padding = 2;
      label-empty = "NixOS";
    };

    "module/i3" = {
      type = "internal/i3";
      format = "<label-state> <label-mode>";
      index-sort = true;
      wrapping-scroll = false;

      ws-icon-0 = "1;🕸";
      ws-icon-1 = "2;🐧";
      ws-icon-2 = "3;🦑";
      ws-icon-3 = "4;🐈";
      ws-icon-4 = "5;🐇";
      ws-icon-5 = "6;🐑";
      ws-icon-6 = "7;🐝";
      ws-icon-7 = "8;🐸";
      ws-icon-8 = "9;🐬";
      ws-icon-9 = "10;🐄";

      label-mode-padding = 1;
      label-mode-foreground = "#000";
      label-mode-background = "${primary}";

      label-focused = "%icon%";
      label-focused-background = "${background}";
      label-focused-underline = "#ff79c6";
      label-focused-padding = 1;

      label-unfocused = "%icon%";
      label-unfocused-padding = 1;

      label-visible = "%icon%";
      label-visible-background = "\${self.label-focused-background}";
      label-visible-underline = "\${self.label-focused-underline}";
      label-visible-padding = "\${self.label-focused-padding}";

      label-urgent = "%icon%";
      label-urgent-background = "${alert}";
      label-urgent-padding = 2;
    };

    "module/date" = {
      type = "internal/date";
      interval = 10;

      time = "\"%H:%M\"";
      date = "\"%d %b\"";

      label = "%date% %time%";
      label-background = "${background}";

      label-underline = "#bd93f9";
    };

    "module/pulseaudio" = {
      type = "internal/pulseaudio";

      format-volume = "<ramp-volume> <label-volume>";
      label-volume = "%percentage%%";
      format-volume-background = "${background}";
      use-ui-max = false;
      interval = 5;
      click-right = "pavucontrol";
      ramp-font = 4;

      # ramp-volume-0 = "🔈";
      # ramp-volume-1 = "🔉";
      # ramp-volume-2 = "🔊";
      
      ramp-volume-0 = "▁";
      ramp-volume-1 = "▂";
      ramp-volume-2 = "▃";
      ramp-volume-3 = "▄";
      ramp-volume-4 = "▅";
      ramp-volume-5 = "▆";
      ramp-volume-6 = "▇";
      ramp-volume-7 = "█";

      label-muted = "🔇";
      label-muted-background = "${background}";

      format-volume-underline = "#ffb86c";
    };

    "module/temperature" = {
      type = "internal/temperature";
      thermal-zone = 0;
      warn-temperature = 60;

      format = "<ramp> <label>";
      format-underline = "#ff79c6";
      format-warn = "<ramp> <label-warn>";
      format-warn-underline = "\${self.format-underline}";

      label = "%temperature-c%";
      label-warn = "%temperature-c%";
      label-warn-foreground = "${secondary}";

      ramp-0 = "";
      ramp-1 = "";
      ramp-2 = "";
    };

    "settings" = { screenchange-reload = true; };

    "global/wm" = {
      margin-top = 5;
      margin-bottom = 5;
    };
  };
}
