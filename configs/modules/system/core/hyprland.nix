{ pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };
  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };
  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
