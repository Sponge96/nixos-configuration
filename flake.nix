{
  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, ... }@inputs: {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem rec {
      system = "x86_64-linux";
      specialArgs = {
        pkgs-unstable = import nixpkgs-unstable { inherit system; };
        inherit inputs;
      };
      modules =
        [ ./configuration.nix inputs.home-manager.nixosModules.default ];
    };
  };
}
