{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    stylix.url = "github:danth/stylix";
    niri.url = "github:sodiboo/niri-flake";
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
        # overlays = [inputs.niri.overlays.niri];
      };
    in 
    {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem {
          #specialArgs = { inherit system; }; 
          

          modules = [
            ./nixos/configuration.nix
            inputs.stylix.nixosModules.stylix
            inputs.niri.nixosModules.niri

            home-manager.nixosModules.home-manager {
              home-manager.backupFileExtension = "hm-backup";
              home-manager.useGlobalPkgs = true;
              home-manager.users.churst = import ./home.nix;
            }
          ];
        };
        # live = nixpkgs.lib.nixosSystem {
        #   system = "x86_64-linux";
        #   modules = [
        #     ./isoimage.nix
        #     ./nixos/configuration.nix
        #     inputs.stylix.nixosModules.stylix

        #     home-manager.nixosModules.home-manager {
        #       home-manager.backupFileExtension = "hm-backup";
        #       home-manager.useGlobalPkgs = true;
        #       home-manager.users.churst = import ./home.nix;
        #     }
        #   ];
        # };
      };
    };
}
