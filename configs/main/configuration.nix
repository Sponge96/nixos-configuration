# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, pkgs-unstable, lib, inputs, profile, ... }:

{
  imports = [
    # Core
    ../modules/system/core/timezone.nix
    inputs.home-manager.nixosModules.default
    ../modules/system/core/home_manager.nix
    ../modules/system/core/experimental.nix
    ../modules/system/core/hyprland.nix
    ../modules/system/core/nvidia.nix
    ../modules/system/core/thunar.nix
    # Hardware
    ./hardware-configuration.nix
    ../modules/system/hardware/boot.nix
    ../modules/system/hardware/keymap.nix
    ../modules/system/hardware/home_network.nix
    ../modules/system/hardware/sound.nix
    ../modules/system/hardware/bluetooth.nix
    # Applications
    ../modules/system/applications/unfree.nix
    ../modules/system/applications/virtualbox.nix
    ../modules/system/applications/via.nix
    ../modules/system/applications/flatpak.nix
    # Security
    ../modules/system/security/1password.nix
    ../modules/system/security/firewall.nix
    # Utils
    ../modules/system/utils/garbage_collection.nix
    # Games
    ../modules/system/games/steam.nix
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.sponge = {
    isNormalUser = true;
    description = "sponge";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "vboxusers" ];
    packages = with pkgs; [ ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [ ntfs3g ];
  boot.supportedFilesystems = [ "ntfs" ];
  boot.kernelParams = [ "kvm.enable_virt_at_load=0" ];
  fileSystems."/mnt/speedyboy" = {
    device = "/dev/nvme0n1p1";
    fsType = "ntfs";
    options = [ "rw" "uid=1000" ];
  };
  # DOCKER TEMP
  virtualisation.docker.enable = true;
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
