{ pkgs, ... }:

{
  environment.systemPackages = [ pkgs.pritunl-client ];

  systemd = {
    packages = [ pkgs.pritunl-client ];
    targets.multi-user.wants = [ "pritunl-client.service" ];
  };
}
