{ ... }:

{
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 4w";
    persistent = true;
  };
  nix.settings.auto-optimise-store = true;
}
