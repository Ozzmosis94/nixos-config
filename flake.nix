{
  description = "Multi-host NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      mkHost =
        {
          hostname,
          stateVersion,
          system ? "x86_64-linux",
          username ? "ozzmosis",
          modules,
          homeModules ? [ ],
        }:
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit hostname username stateVersion; };
          modules = [
            ./nixos/modules
            home-manager.nixosModules.home-manager
            {
              nixpkgs.config.allowUnfree = true;
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = { inherit username stateVersion; };
                users.${username} = {
                  imports = [ ./home-manager/home.nix ] ++ homeModules;
                };
              };
            }
          ] ++ modules;
        };
    in
    {
      nixosConfigurations.nixos = mkHost {
        hostname = "nixos";
        stateVersion = "25.11";
        modules = [ ./hosts/nixos ];
        homeModules = [
          ./profiles/home/desktop.nix
          ./profiles/home/development.nix
        ];
      };
    };
}
