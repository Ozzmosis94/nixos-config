{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    firefox
    curl
    lm_sensors
    element-desktop
  ];
}
