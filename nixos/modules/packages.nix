{ pkgs, inputs, ... }:
{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages =
    with pkgs;
    [
      #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
      #  wget
      firefox
      curl
      pritunl-client
      papirus-icon-theme

    ]
    ++ (with pkgs.gnomeExtensions; [
      dash-to-dock
      blur-my-shell
      tiling-shell
      auto-move-windows
    ]);

  # programs.nix-ld.enable = true;
}
