{ pkgs, ... }:

{
  home.packages = with pkgs;
    [
      (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" "IosevkaTerm" ]; })
    ];
}
