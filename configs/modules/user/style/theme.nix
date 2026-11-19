{ pkgs, ... }:

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
    gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
  };
  dconf.settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style.name = "Dracula";
    style.package = pkgs.dracula-theme;
  };
}
