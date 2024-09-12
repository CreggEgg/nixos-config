{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    stylix.url = "github:danth/stylix";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ...}@inputs: 
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;

        config = {
          allowUnfree = true;
        };
      };
    in 
    {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          #specialArgs = { inherit system; }; 

          modules = [
            ./nixos/configuration.nix
            inputs.stylix.nixosModules.stylix

            home-manager.nixosModules.home-manager {
              home-manager.backupFileExtension = "hm-backup";
              home-manager.useGlobalPkgs = true;
              home-manager.users.churst = import ./home.nix;
            }
          ];
        };
      };
    };
}
