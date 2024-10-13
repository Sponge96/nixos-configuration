{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, ... }@inputs:
    let
      profile = "work";
      system = "x86_64-linux";
    in {
      nixosConfigurations.default = nixpkgs.lib.nixosSystem rec {
        inherit system; # Using the variable instead of repeating the string

        specialArgs = {
          inherit inputs;
          pkgs-unstable = import nixpkgs-unstable { inherit system; };
        };

        modules = [
          # Using string interpolation to construct the path with profile variable
          ./configs/${profile}/configuration.nix

          # Including the home-manager module from inputs
          inputs.home-manager.nixosModules.default
        ];
      };
    };
}
