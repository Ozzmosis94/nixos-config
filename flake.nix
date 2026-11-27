{
  description = "My NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    llm-agents.url = "github:numtide/llm-agents.nix";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    disko = {
      url = "github:nix-community/disko";
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
      mkHost = hostModules: nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = common // { inherit inputs; };
        modules = [
          ./nixos/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = false;
            home-manager.useUserPackages = false;
            home-manager.backupFileExtension = "hm-backup";
            home-manager.extraSpecialArgs = common;
            home-manager.users.${common.username} = import ./home-manager/home.nix;
          }
        ] ++ hostModules;
      };
    in {
      nixosConfigurations = {
        ${common.hostname} = mkHost [
          inputs.disko.nixosModules.disko
          ./hosts/nixos
        ];
      };
    };
}
