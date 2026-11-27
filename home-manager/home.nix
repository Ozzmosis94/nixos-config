{
  config,
  pkgs,
  lib,
  username,
  stateVersion,
  ...
}:
{
  imports = [
    ./modules
  ];

  nixpkgs.config.allowUnfree = true;

  home = {
    username = username;
    homeDirectory = "/home/${username}";
    stateVersion = stateVersion;
    packages = with pkgs; [
      telegram-desktop
      microfetch
      unzip
      zip

      libreoffice
      hunspell
      hunspellDicts.ru_RU

      nodejs
      # Prefer standalone Corepack and its package-manager shims over Node's bundled Corepack.
      (lib.hiPrio corepack)
    ];
  };
}
