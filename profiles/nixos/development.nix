{ pkgs, username, ... }:
{
  imports = [ ../../nixos/modules/virtualization.nix ];

  users.users.${username}.extraGroups = [ "docker" ];

  environment.systemPackages = with pkgs; [
    docker-compose
    zed-editor-fhs
  ];
}
