{ hostname, ... }:
{
  networking.hostName = hostname; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # Enable networking
  # networking.proxy.default = "127.0.0.1:1080";
  networking.networkmanager.enable = true;
  networking.extraHosts = ''
    192.168.202.10 server.app.ru
    192.168.202.4 gate.synerget.ru
  '';
}
