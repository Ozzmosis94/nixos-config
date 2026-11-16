{ pkgs, ... }:
{
  imports = [ ../../home-manager/modules/direnv.nix ];
  home.packages = with pkgs; [
    nodejs
    yarn
  ];
}
