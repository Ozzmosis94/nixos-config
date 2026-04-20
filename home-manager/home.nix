{
  inputs,
  pkgs,
  username,
  stateVersion,
  ...
}:
{
  imports = [
    ./modules
    #inputs.noctalia.homeModules.default
    inputs.dms.homeModules.dank-material-shell
    inputs.dms.homeModules.niri
    #inputs.niri.homeModules.niri
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
      fastfetch
      nodejs

      nautilus
      alacritty
    ];
  };
}
