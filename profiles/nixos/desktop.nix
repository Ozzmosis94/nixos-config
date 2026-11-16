{
  imports = [
    ../../nixos/modules/desktop.nix
    ../../nixos/modules/audio.nix
    ../../nixos/modules/packages.nix
  ];

  networking.networkmanager.enable = true;
}
