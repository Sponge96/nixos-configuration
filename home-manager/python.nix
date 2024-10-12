{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    python312
    python312Packages.python-lsp-server
    uv
  ];
}
