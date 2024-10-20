{ pkgs, pkgs-unstable, ... }:

{
  home.packages = (with pkgs; [ python312 ])

    ++

    (with pkgs-unstable; [ uv ]);
}
