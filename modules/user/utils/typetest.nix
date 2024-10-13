{ config, pkgs, ... }:

{
  home.packages = with pkgs; [ tt ];
  programs.bash.shellAliases = { tt = "tt -notheme -t 30"; };
}

