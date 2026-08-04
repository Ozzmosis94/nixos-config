{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # inputs.codex-desktop-nixos.url = "github:mwmdev/codex-desktop-nixos";
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

          # codex-desktop-nixos.nixosModules.default
          # {
          #   programs.codex-desktop = {
          #     enable = true;
          #     bundlePath = ./codex-desktop-nixos
          #   };
          # }

          home-manager.nixosModules.home-manager

          {
            home-manager.useGlobalPkgs = false;
            home-manager.useUserPackages = false;

            home-manager.extraSpecialArgs = common;

            home-manager.users.${common.username} = import ./home-manager/home.nix;
          }
        ];
      };
    };
}
