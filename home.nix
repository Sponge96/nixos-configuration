{ config, pkgs, inputs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "sponge";
  home.homeDirectory = "/home/sponge";

  imports = [
    ./home-manager/spotify.nix
    # Core
    ./home-manager/hyprland.nix # OS frontend
    ./home-manager/kitty.nix # term
    ./home-manager/rofi-wayland.nix # app launcher
    ./home-manager/swww.nix # background
    ./home-manager/dunst.nix # notifications
    ./home-manager/waybar.nix # toolbar
    ./home-manager/fonts.nix # system fonts
    ./home-manager/hyprpicker.nix # color picker
    ./home-manager/hyprshot.nix # screenshots
    ./home-manager/theme.nix # system themes
    ./home-manager/pavucontrol.nix # audio controller
    ./home-manager/nvitop.nix # process manager/stat
    ./home-manager/unzip.nix # zipping
    # Programs
    ./home-manager/firefox.nix
    ./home-manager/discord.nix
    ./home-manager/1password.nix
    ./home-manager/qbittorrent.nix
    ./home-manager/via.nix
    # Work
    ./home-manager/teams.nix
    ./home-manager/obsidian.nix
    ./home-manager/python.nix
    # Terminal Utils
    ./home-manager/helix.nix
    ./home-manager/zoxide.nix
    ./home-manager/git.nix
    ./home-manager/typetest.nix
    # Games
    ./home-manager/proton.nix
    ./home-manager/r2modman.nix
  ];

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

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
