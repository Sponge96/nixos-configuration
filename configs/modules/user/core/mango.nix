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
      tag_rule = [
        "id:1,layout_name:center_tile"
      ];

      # ─────────────────────────────────────────────────────────────
      # GAPS / BORDERS
      # ─────────────────────────────────────────────────────────────

      # Hyprland border_size = 4

      # Hyprland:
      # col.active_border = rgb(44475a) rgb(bd93f9) 90deg
      #
      # Mango uses a single focus color rather than Hyprland's
      # gradient border syntax.

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

      # Animations - use underscores for multi-part keys
      animations = 1;
      animation_type_open = "slide";
      animation_type_close = "slide";
      animation_duration_open = 400;
      animation_duration_close = 800;

      # Or use nested attrs (will be flattened with underscores)
      animation_curve = {
        open = "0.46,1.0,0.29,1";
        close = "0.08,0.92,0,1";
      };

      # ─────────────────────────────────────────────────────────────
      # MISC
      # ─────────────────────────────────────────────────────────────

      # Hyprland's force_default_wallpaper / disable_hyprland_logo
      # have no Mango equivalent. Mango doesn't display the Hyprland
      # wallpaper/logo, so these are simply unnecessary.

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
      ];

      # ─────────────────────────────────────────────────────────────
      # MOUSE
      # ─────────────────────────────────────────────────────────────

      # SUPER + left mouse = move floating window
      # SUPER + right mouse = resize floating window
      mousebind = [
        "SUPER,btn_left,moveresize,curmove"
        "SUPER,btn_right,moveresize,curresize"
      ];

      # SUPER + mouse wheel = previous/next tag
      axisbind = [
        "SUPER,UP,viewtoleft_have_client"
        "SUPER,DOWN,viewtoright_have_client"
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
