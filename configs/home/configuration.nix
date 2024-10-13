# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, pkgs-unstable, lib, inputs, ... }:

{
  imports = [ # Include the results of the hardware scan.
    # Core
    inputs.home-manager.nixosModules.default
    ../modules/system/core/hyprland.nix
    ../modules/system/core/thunar.nix
    # Applicaitons
    ../modules/system/applications/virtualbox.nix
    ../modules/system/applications/via.nix
    ../modules/system/applications/flatpak.nix
    # Games
    ../modules/system/games/steam.nix
    # Hardware
    ./hardware-configuration.nix
    ../modules/system/hardware/home_network.nix
    ../modules/system/hardware/sound.nix
    # Security
    ../modules/system/security/firewall.nix
    # Utils
    ../modules/system/utils/garbage_collection.nix
  ];

  # flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Set your time zone.
  time.timeZone = "Europe/London";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.sponge = {
    isNormalUser = true;
    description = "sponge";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "vboxusers" ];
    packages = with pkgs;
      [
        # flatpak
        # gnome.gnome-software
      ];
  };
  home-manager = {
    extraSpecialArgs = {
      inherit pkgs-unstable;
      inherit inputs;
    };
    users = { "sponge" = import ./home.nix; };
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [ ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
