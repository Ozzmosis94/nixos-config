{ pkgs, username, stateVersion, ... }:
{
  imports = [ ./modules ];

  home = {
    inherit username stateVersion;
    homeDirectory = "/home/${username}";
    packages = with pkgs; [
      microfetch
      unzip
      zip
    ];
  };
}
