{
  # Only for the current corporate network.
  networking.extraHosts = ''
    192.168.202.10 server.app.ru
    192.168.202.4 gate.synerget.ru
  '';

  # Remove after the registry is served via trusted HTTPS.
  virtualisation.docker.daemon.settings.insecure-registries = [
    "192.168.202.252:5012"
  ];
}
