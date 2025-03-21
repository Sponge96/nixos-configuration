{ config, pkgs, pkgs-unstable, inputs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "sponge";
  home.homeDirectory = "/home/sponge";

  imports = [
    # Core
    ../modules/user/core/kitty.nix
    ../modules/user/core/helix.nix
    ../modules/user/core/hyprland.nix
    ../modules/user/core/hyprlock.nix
    ../modules/user/core/rofi-wayland.nix
    ../modules/user/core/swww.nix
    ../modules/user/core/dunst.nix
    ../modules/user/core/waybar.nix
    ../modules/user/core/hyprpicker.nix
    ../modules/user/core/hyprshot.nix
    ../modules/user/core/pavucontrol.nix
    ../modules/user/core/nvitop.nix
    # Style
    ../modules/user/style/theme.nix
    ../modules/user/style/fonts.nix
    # Applications
    ../modules/user/applications/discord.nix
    ../modules/user/applications/qbittorrent.nix
    ../modules/user/applications/via.nix
    ../modules/user/applications/obsidian.nix
    ../modules/user/applications/calendar.nix
    ../modules/user/applications/floorp.nix
    ../modules/user/applications/vlc.nix
    # Work
    ../modules/user/work/teams.nix
    # Development
    ../modules/user/development/python.nix
    ../modules/user/development/go.nix
    # Utils
    ../modules/user/utils/unzip.nix
    ../modules/user/utils/zoxide.nix
    ../modules/user/utils/git.nix
    ../modules/user/utils/typetest.nix
    ../modules/user/utils/bash.nix
    ../modules/user/utils/image_viewer.nix
    # Games
    ../modules/user/games/proton.nix
  ];

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs;
    [
      # # Adds the 'hello' command to your environment. It prints a friendly
      # # "Hello, world!" when run.
      # pkgs.hello

      # # It is sometimes useful to fine-tune packages, for example, by applying
      # # overrides. You can do that directly here, just don't forget the
      # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
      # # fonts?
      # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

      # # You can also create simple shell scripts directly inside your
      # # configuration. For example, this adds a command 'my-hello' to your
      # # environment:
      # (pkgs.writeShellScriptBin "my-hello" ''
      #   echo "Hello, ${config.home.username}!"
      # '')
    ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/sponge/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = { EDITOR = "helix"; };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  nixpkgs.config.allowUnfree = true;
}
