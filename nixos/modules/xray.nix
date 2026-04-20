{ username, ... }:
{
  services.xray = {
    enable = true;
    settingsFile = "/home/${username}/nixos-config/configs/xray.json";
  };
}
