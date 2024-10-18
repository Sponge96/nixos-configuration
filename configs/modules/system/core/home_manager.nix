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
    } else {
      "jack" = import ../../../${profile}/home.nix;
    };
  };
}
