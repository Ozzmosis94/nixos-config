{ hostname, ... }:
{
  networking.hostName = hostname; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # Enable networking
  networking.networkmanager.enable = true;

  networking.extraHosts = ''
    192.168.202.10 server.app.ru
    192.168.202.30 gate.synerget.ru
  '';
}
