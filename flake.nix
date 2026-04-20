{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    # nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dms = {
      url = "github:AvengeMedia/DankMaterialShell/stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zapret-discord-youtube.url = "github:kartavkun/zapret-discord-youtube";

  };

  outputs =
    inputs@{
      self,
      nixpkgs,
      home-manager,
      ...
    }:
    let
      system = "x86_64-linux";
      common = {
        inherit system;
        inherit inputs;
        username = "ozzmosis";
        hostname = "nixos";
        stateVersion = "25.11";
      };
    in
    {
      nixosConfigurations.${common.hostname} = nixpkgs.lib.nixosSystem {

        inherit system;
        specialArgs = common;
        modules = [
          ./nixos/configuration.nix

          home-manager.nixosModules.home-manager

          inputs.dms.nixosModules.greeter
          inputs.niri.nixosModules.niri
          inputs.zapret-discord-youtube.nixosModules.default

          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;

            home-manager.extraSpecialArgs = common;
            home-manager.users.${common.username} = import ./home-manager/home.nix;
          }
        ];
      };
    };
}
