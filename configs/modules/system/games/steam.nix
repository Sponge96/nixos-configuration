{ ... }: {
  programs.steam = {
    enable = true;
    remotePlay.openFirewall =
      true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall =
      true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall =
      true; # Open ports in the firewall for Steam Local Network Game Transfers
    gamescopeSession.enable = true;
  };
  hardware.opengl = { enable = true; };
  # mounts steamlib drive
  fileSystems."/mnt/speedyboy" = {
    device = "/dev/nvme0n1";
    fsType = "ext4";
    options = [ "nofail" ];
  };
}
