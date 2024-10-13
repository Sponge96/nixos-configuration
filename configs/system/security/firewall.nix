{ ... }:

{
  # ports for myanonamouse
  networking.firewall.enable = true;
  networking.firewall.allowedUDPPorts = [ 52525 ];
  networking.firewall.allowedTCPPorts = [ 52525 ];
}
