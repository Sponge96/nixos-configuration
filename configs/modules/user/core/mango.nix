{ profile, inputs, ... }:

{
  imports = [
    inputs.mango.hmModules.mango
  ];

  wayland.windowManager.mango = {
    enable = true;

    settings = {
      warp_cursor = 1;
      sloppy_focus = 1;
      focus_on_activate = 1;
      xkb_rules_layout = "us";

      # ─────────────────────────────────────────────────────────────
      # LAYOUT
      # ─────────────────────────────────────────────────────────────
      monitor_rule =
        if profile == "main" then
          [
            "name:^DP-1$,width:2560,height:1440,refresh:144,x:0,y:1080,scale:1"
            "name:^DP-3$,width:1920,height:1080,refresh:122,x:360,y:0,scale:1"
            "name:^Unknown-1$,disable:1"
          ]
        else
          [
            "name:^DP-2$,width:2560,height:1440,refresh:60,x:0,y:0,scale:1"
            "name:^DP-3$,width:2560,height:1440,refresh:60,x:2560,y:0,scale:1"
          ];

      default_master_factor = 0.45;
      center_master_overspread = 1;
      tag_num = 2;
      tag_rule = [
        "id:1,layout_name:center_tile"
        "id:2,layout_name:monocle"
      ];

      # ─────────────────────────────────────────────────────────────
      # WINDOW APPEARANCE
      # ─────────────────────────────────────────────────────────────
      blur = 1;
      blur_optimized = 1;
      blur_params = {
        radius = 5;
        num_passes = 2;
      };
      border_radius = 6;
      focused_opacity = 1.0;
      unfocused_opacity = 1.0;

      # Background color of the root window
      root_color = "0x282a36ff";

      # Inactive window border
      border_color = "0x44475aff";

      # Drop shadow when dragging windows
      drop_color = "0x00000088";

      # Active window border
      focus_color = "0xbd93f9ff";

      # Urgent window border (alerts)
      urgent_color = "0xff5555ff";

      # ─────────────────────────────────────────────────────────────
      # KEYBINDS
      # ─────────────────────────────────────────────────────────────

      bind = [
        # "SUPER,Q,spawn,kitty"
        "SUPER,Q,spawn,kitty"
        "SUPER,C,killclient,"
        "SUPER,M,quit"
        "SUPER,F,spawn,thunar"
        "SUPER,V,togglefloating,"
        "SUPER,S,spawn,rofi -show drun"
        "SUPER,O,toggleoverview"
        "SUPER,2,view,2"
      ];

      # ─────────────────────────────────────────────────────────────
      # MOUSE
      # ─────────────────────────────────────────────────────────────

      mousebind = [
        "SUPER,btn_left,moveresize,curmove"
        "SUPER,btn_right,moveresize,curresize"
      ];

      axisbind = [
        "SUPER,UP,viewtoleft"
        "SUPER,DOWN,viewtoright"
      ];

      # ─────────────────────────────────────────────────────────────
      # ENVIRONMENT
      # ─────────────────────────────────────────────────────────────

      # HYPRSHOT_DIR isn't useful to Mango itself, but keeping it as
      # an environment variable means external scripts can still use it.
      env = [
        "XCURSOR_SIZE,24"
        "XCURSOR_THEME,Dracula"

        "QT_QPA_PLATFORM,wayland"
        "QT_QPA_PLATFORMTHEME,qt5ct"
        "MOZ_ENABLE_WAYLAND,1"

        (
          if profile == "main" then
            "HYPRSHOT_DIR,/home/sponge/Screenshots"
          else
            "HYPRSHOT_DIR,/home/jack/Screenshots"
        )
      ];
    };
  };
}
