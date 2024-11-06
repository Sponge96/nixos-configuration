{ pkgs-unstable, ... }:

{
  home.packages = with pkgs-unstable; [ qbittorrent ];
}
