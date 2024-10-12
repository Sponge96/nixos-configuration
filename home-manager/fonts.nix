{ config, pkgs, ... }:

{
  home.packages = with pkgs;
    [
      (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" "IosevkaTerm" ]; })
    ];
  # fonts.fontconfig.enable = true;
}
