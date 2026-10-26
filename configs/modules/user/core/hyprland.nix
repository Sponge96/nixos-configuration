{ profile, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    configType = "hyprlang";
    settings = {
      "$mod" = "SUPER";
      "$terminal" = "kitty";
      "$fileManager" = "thunar";
      "$menu" = "rofi -show drun";
      # AUTOSTART
      exec-once = [
        "awww-deamon &"
        "awww img ~/.config/swww/Wallpaper.jpeg &"
        "hyprctl setcursor Dracula-cursors 24 &"
        "dunst &"
      ];

      windowrule = [
        # Make kitty tile (not float) so dwindle handles its placement
        "tile on, match:class ^(kitty)$"

        # Ignore kitty asking to be maximized/fullscreened on open
        "suppress_event maximize fullscreen, match:class ^(kitty)$"

        # Force it out of fullscreen/maximized state if it still starts that way
        "fullscreen off, match:class ^(kitty)$"
        "maximize off, match:class ^(kitty)$"
      ];

      input = {
        kb_layout = "us";
        follow_mouse = 1;
        sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
        touchpad.natural_scroll = false;
      };

      general = {
        layout = "dwindle";
        resize_on_border = false;
        allow_tearing = true;
        "col.active_border" = "rgb(44475a) rgb(bd93f9) 90deg";
        "col.inactive_border" = "rgba(44475aaa)";
        "col.nogroup_border" = "rgba(282a36dd)";
        "col.nogroup_border_active" = "rgb(bd93f9) rgb(44475a) 90deg";
        border_size = 4;
        gaps_in = 4;
        gaps_out = 8;
      };

      misc = {
        force_default_wallpaper = 0; # Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo = true; # If true disables the random hyprland logo / anime girl background. :(
      };

      dwindle = {
        smart_split = true;
        preserve_split = true;
        smart_resizing = true;
      };

      decoration = {
        rounding = 10;

        # Change transparency of focused and unfocused windows
        active_opacity = 1.0;
        inactive_opacity = 1.0;
        # https://wiki.hyprland.org/Configuring/Variables/#blur
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          vibrancy = 0.1696;
        };
      };

      bind = [
        # # See https://wiki.hyprland.org/Configuring/Keywords/
        # "$mainMod = SUPER" # Sets "Windows" key as main modifier

        # Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
        "$mod, Q, exec, $terminal"
        "$mod, C, killactive"
        "$mod, M, exit"
        "$mod, F, exec, $fileManager"
        "$mod, V, togglefloating"
        "$mod, S, exec, $menu"
        "$mod, P, pseudo, # dwindle"

        # Move focus with mod + arrow keys
        # "Shift_L, left, layoutmsg, focus l"
        # "Shift_L, right, layoutmsg, focus r"
        # "Shift_L, up, layoutmsg, focus u"
        # "Shift_L, down, layoutmsg, focus d"

        # Scroll through existing workspaces with mainMod + scroll
        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"

        # CUSTOM
        "$mod, Control_L, exec, hyprshot -m region"
        "$mod, L, exec, hyprlock"
      ];

      bindm = [
        # Move/resize windows with mainMod + LMB/RMB and dragging
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      env = [
        "XCURSOR_SIZE,24"
        "XCURSOR_THEME,Dracula"
        "HYPRCURSOR_SIZE,24"
        (
          if profile == "main" then
            "HYPRSHOT_DIR,/home/sponge/Screenshots"
          else
            "HYPRSHOT_DIR,/home/jack/Screenshots"
        )
        "QT_QPA_PLATFORM,wayland"
        "QT_QPA_PLATFORMTHEME,qt5ct"
        "MOZ_ENABLE_WAYLAND,1"
      ];
    };

    extraConfig =
      if profile == "main" then
        "\n      monitor=DP-1,2560x1440@144,0x0,1\n      monitor=DP-3,1920x1080@122,360x-1080,1\n      monitor=Unknown-1,disable\n\n      xwayland {\n        force_zero_scaling = true\n      }\n    "
      else
        "\n    monitor=DP-2,2560x1440@60,0x0,1\n    monitor=DP-3,2560x1440@60,auto-right,1\n    ";
  };
}
