{ username, ... }:
{
  services.xray = {
    enable = false;
    settingsFile = "/home/${username}/nixos-config/configs/xray.json";
  };
}
