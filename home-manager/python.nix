{ config, pkgs, ... }:

let unstablePkgs = import <nixos-unstable> { };
in {
  home.packages = with pkgs; [
    python312
    python312Packages.python-lsp-server
    unstablePkgs.uv
  ];
}
