{ pkgs-unstable, inputs, profile, ... }:

{
  home-manager = {
    extraSpecialArgs = {
      inherit pkgs-unstable;
      inherit inputs;
      inherit profile;
    };
    users = if profile == "main" then {
      "sponge" = import ../../../${profile}/home.nix;
    } else if profile == "work" then {
      "jack" = import ../../../${profile}/home.nix;
    } else {
      "admin" = import ../../../${profile}/home.nix;
    };
  };
}
