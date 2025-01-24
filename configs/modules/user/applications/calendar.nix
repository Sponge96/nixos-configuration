{ pkgs, ... }:

{
  home.packages = with pkgs; [ khal ];
}
