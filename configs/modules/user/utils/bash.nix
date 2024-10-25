{ ... }:

{
  programs.bash.shellAliases = {
    rebuild =
      "sudo nixos-rebuild switch --flake ~/nixos-configuration/#default";
    ns = "nix-shell";
  };
}
