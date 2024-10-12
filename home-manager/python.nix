{ config, pkgs, pkgs-unstable, inputs, ... }:

{
  home.packages = (with pkgs; [ python312 python312Packages.python-lsp-server ])

    ++

    (with pkgs-unstable; [ uv ]);
}
