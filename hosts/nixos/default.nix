{ stateVersion, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../nixos/modules/bootloader.nix
    ../../profiles/nixos/desktop.nix
    ../../profiles/nixos/development.nix
    ../../profiles/nixos/work.nix
  ];

  # Keep the state version from the first installation.
  system.stateVersion = stateVersion;
}
