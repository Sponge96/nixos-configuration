{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ dracula-theme ];
  home.pointerCursor = {
    name = "Dracula-cursors";
    package = pkgs.dracula-theme;
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };
  gtk = {
    enable = true;
    theme.name = "Dracula";
    theme.package = pkgs.dracula-theme;
    iconTheme.name = "Dracula";
    iconTheme.package = pkgs.dracula-theme;
  };
  qt = {
    enable = true;
    platformTheme = "gtk";
    style.name = "Dracula";
    style.package = pkgs.dracula-theme;
  };
}
