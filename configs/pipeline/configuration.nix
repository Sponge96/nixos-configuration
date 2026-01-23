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
    # Hardware
    ./hardware-configuration.nix
    ../modules/system/hardware/keymap.nix
    ../modules/system/hardware/boot.nix
    # Applications
    ../modules/system/applications/unfree.nix
    # Security
  ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.admin = {
    isNormalUser = true;
    description = "admin";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "vboxusers" ];
    packages = with pkgs; [ ];
    linger = true;
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [ python312 uv ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # FOR LAUNCHER TO BE MODULES LATER
  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = true;
  };
  networking.firewall.allowedTCPPorts = [ 22 2222 ];

  systemd.user.timers = {
    "r42_clickup_holiday_sync" = {
      wantedBy = [ "timers.target" ];
      timerConfig = {
        OnCalendar = "*-*-* 01:00:00";
        Persistent = true;
        Unit = "r42_clickup_holiday_sync.service";
      };
    };
    "r42_clickup_science_sync" = {
      wantedBy = [ "timers.target" ];
      timerConfig = {
        OnCalendar = [ "*-*-* 02:00:00" "Tue,Wed *-*-* 13:00:00" ];
        Persistent = true;
        Unit = "r42_clickup_science_sync.service";
      };
    };
    "r42_hello" = {
      wantedBy = [ "timers.target" ];
      timerConfig = {
        OnCalendar = [ "*-*-* 02:00:00" "Tue,Wed *-*-* 13:00:00" ];
        Persistent = true;
        Unit = "r42_hello.service";
      };
    };
  };

  systemd.user.services = {
    "r42_clickup_holiday_sync" = {
      path = [ "/run/current-system/sw" ];
      script =
        "uv run --directory /home/admin/r42/clickup/r42_clickup_holiday_sync r42_holiday_sync.py";
      serviceConfig = { Type = "oneshot"; };
    };
    "r42_clickup_science_sync" = {
      path = [ "/run/current-system/sw" ];
      script =
        "uv run --directory /home/admin/r42/clickup/r42_clickup_science_sync gsheet_write.py";
      serviceConfig = { Type = "oneshot"; };
    };
    "r42_hello" = {
      path = [ "/run/current-system/sw" ];
      script =
        "uv run --directory /home/admin/projects/launcher/scripts/ hello.py";
      serviceConfig = { Type = "oneshot"; };
    };
    "r42_launcher" = {
      script = "/home/admin/projects/launcher/launcher";
      serviceConfig = { Type = "oneshot"; };
    };
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?
}
