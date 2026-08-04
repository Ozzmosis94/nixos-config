{
  virtualisation.docker = {
    enable = true;
    daemon.settings = {
      insecure-registries = [ "192.168.202.252:5012" ];
    };
  };
  virtualisation.podman.enable = true;
}
