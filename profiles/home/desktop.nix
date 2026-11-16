{ pkgs, ... }:
{
  imports = [ ../../home-manager/modules/fonts.nix ];
  home.packages = with pkgs; [
    telegram-desktop
    libreoffice
    hunspell
    hunspellDicts.ru_RU
  ];
}
