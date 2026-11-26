# nixos-config

## Profiles

- `nixos`: existing ext4 installation, unchanged filesystem UUIDs.
- `nixos-btrfs`: clean installation using Disko, GPT, systemd-boot, Btrfs and btrbk.

The Btrfs profile is based on the current AMD machine's hardware configuration.
For another machine, regenerate hardware settings with
`nixos-generate-config --no-filesystems` and review the result.

## Clean Btrfs installation

**WARNING: formatting erases the entire selected disk. Back up all data first.
Never use these commands to update an existing installation.**

Boot a NixOS live ISO in UEFI mode, connect to the internet, then:

```sh
git clone -b feature/disko-btrfs https://github.com/Ozzmosis94/nixos-config.git
cd nixos-config
lsblk -o NAME,SIZE,MODEL,SERIAL,FSTYPE,MOUNTPOINTS
ls -l /dev/disk/by-id/
```

Edit `hosts/nixos-btrfs/disko.nix`: replace REPLACE-ME with the exact
whole-disk by-id path (not a partition). Keep this setting in your local
configuration for future rebuilds. Review hardware-configuration.nix and
user settings before installation. The disk swap defaults to 8 GiB, with
higher-priority zram; hibernation is not configured. No encryption is enabled.

```sh
nix --extra-experimental-features 'nix-command flakes' flake lock
git add flake.lock hosts/nixos-btrfs/disko.nix
nix --extra-experimental-features 'nix-command flakes' flake check --no-build
```

Only after verifying the selected disk, run the destructive install using the Disko CLI:

```sh
sudo nix --extra-experimental-features 'nix-command flakes' run github:nix-community/disko -- --mode destroy,format,mount --flake .#nixos-btrfs
sudo nixos-install --flake .#nixos-btrfs
```

After installation set the user password (e.g. via nixos-enter before reboot),
and save a copy of the local configuration including the updated lock file.

## Maintenance

Btrfs: EFI 2 GiB, root/home/nix/var/log/snapshots/swap subvolumes,
zstd:3, monthly scrub, weekly TRIM. Btrbk makes hourly read-only snapshots
of home and retains hourly/daily/weekly/monthly history. Local snapshots
are not a backup against SSD failure; configure an external target separately.

Use NixOS generations for system rollback. Do not roll back root and
/nix independently. Inspect snapshots with `sudo btrbk -c /etc/btrbk/home.conf list`.

Rebuild an existing ext4 system with `sudo nixos-rebuild switch --flake .#nixos`.
Rebuild a clean Btrfs installation with `sudo nixos-rebuild switch --flake .#nixos-btrfs`.
