{ pkgs, ... }:
{
  boot.loader.systemd-boot.configurationLimit = 10;
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 50;
    priority = 100;
  };

  services.btrfs.autoScrub = {
    enable = true;
    interval = "monthly";
    fileSystems = [ "/" ];
  };
  services.fstrim.enable = true;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
  nix.settings.auto-optimise-store = true;

  environment.systemPackages = [ pkgs.btrfs-progs pkgs.btrbk ];
  services.btrbk.instances.home = {
    onCalendar = "hourly";
    snapshotOnly = true;
    settings = {
      timestamp_format = "long";
      snapshot_preserve_min = "24h";
      snapshot_preserve = "48h 14d 8w 6m";
      volume."/mnt/btrfs" = {
        snapshot_dir = "@snapshots";
        subvolume."@home" = {};
      };
    };
  };

  # Snapshots can contain private home data.
  systemd.tmpfiles.rules = [
    "d /.snapshots 0700 root root -"
    "d /mnt/btrfs 0700 root root -"
  ];
}
