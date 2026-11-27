{ lib, ... }:
let
  mountOptions = [ "compress=zstd:3" "noatime" "discard=async" ];
  subvolume = mountpoint: { inherit mountpoint mountOptions; };
in {
  disko.devices.disk.main = {
    type = "disk";
    # Replace with the actual whole-disk by-id path before installation.
    device = lib.mkDefault "/dev/disk/by-id/nvme-KINGSTON_SNV2S1000G_50026B7383446B24_1";
    content = {
      type = "gpt";
      partitions = {
        ESP = {
          priority = 1;
          size = "2G";
          type = "EF00";
          content = {
            type = "filesystem";
            format = "vfat";
            extraArgs = [ "-F" "32" "-n" "BOOT" ];
            mountpoint = "/boot";
            mountOptions = [ "umask=0077" ];
          };
        };
        root = {
          size = "100%";
          content = {
            type = "btrfs";
            extraArgs = [ "-f" ];
            mountpoint = "/mnt/btrfs";
            inherit mountOptions;
            subvolumes = {
              "/@root" = subvolume "/";
              "/@home" = subvolume "/home";
              "/@nix" = subvolume "/nix";
              "/@var" = subvolume "/var";
              "/@log" = subvolume "/var/log";
              "/@snapshots" = subvolume "/.snapshots";
              "/@swap" = (subvolume "/swap") // {
                swap.swapfile.size = "8G";
              };
            };
          };
        };
      };
    };
  };
}
