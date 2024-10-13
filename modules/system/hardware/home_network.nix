{ ... }:

{
  networking.networkmanager.enable = true;
  networking.hostName = "nixos"; # Define your hostname.
  networking.wireless = {
    enable = true;
    networks."VM5849858".psk = "vtm4ynxkZrj6";
  };
}

