{ pkgs, ... }:
{
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    #  wget
    firefox
    curl
    lm_sensors
    element-desktop
    docker-compose
    zed-editor
  ];

  # Support npm-distributed Electron and other prebuilt Linux binaries.
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      stdenv.cc.cc.lib
      glib
      gtk3
      nss
      nspr
      dbus
      atk
      at-spi2-core
      cups
      libdrm
      libgbm
      mesa
      expat
      libxkbcommon
      alsa-lib
      pango
      cairo
      libGL
      libx11
      libxcomposite
      libxdamage
      libxext
      libxfixes
      libxrandr
      libxcb
    ];
  };
}
