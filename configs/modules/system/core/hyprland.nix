{ pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    withUWSM = true;
  };
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
