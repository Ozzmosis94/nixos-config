{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }:
  let
    system = "x86_64-linux";

    common = {
      inherit system;
      username = "ozzmosis";
      hostname = "nixos";
      stateVersion = "25.11";
    };
  in {
    nixosConfigurations.${common.hostname} =
      nixpkgs.lib.nixosSystem {
        inherit system;

        specialArgs = common;

        modules = [
          ./nixos/configuration.nix

          home-manager.nixosModules.home-manager

          {
            home-manager.useGlobalPkgs = false;
            home-manager.useUserPackages = false;

            home-manager.extraSpecialArgs = common;

            home-manager.users.${common.username} =
              import ./home-manager/home.nix;
          }
        ];
      };
  };
}
