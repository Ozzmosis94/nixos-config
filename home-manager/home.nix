{ config, pkgs, username, stateVersion, ... }: {
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

      nodejs
    ];
  };
}
