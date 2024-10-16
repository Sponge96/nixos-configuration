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
      profile = "main";
      system = "x86_64-linux";
    in {
      nixosConfigurations.default = nixpkgs.lib.nixosSystem rec {
        specialArgs = {
          inherit inputs;
          inherit profile;
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
