{ pkgs, ... }:

{
  programs.mango = {
    enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
    wlr = {
      enable = true;
      settings.screencast = {
        chooser_type = "simple";
        chooser_cmd = "${pkgs.slurp}/bin/slurp -f 'Monitor: %o' -or";
      };
    };
  };

  services.xserver.enable = true;
  services.displayManager.gdm.enable = true;

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
