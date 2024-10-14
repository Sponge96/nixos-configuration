{ config, pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    languagePacks = [ "en-GB" ];
  };
}
