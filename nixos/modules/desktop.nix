{ inputs, pkgs, ... }:
{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  environment.systemPackages = with pkgs; [
    gnomeExtensions.dash-to-dock
    gnomeExtensions.blur-my-shell
    gnomeExtensions.tiling-shell
  ];

  # programs.dank-material-shell.greeter = {
  #   enable = true;
  #   compositor.name = "niri";
  # };

  # nixpkgs.overlays = [ inputs.niri.overlays.niri ];
  # programs.niri.package = pkgs.niri-unstable;
  # programs.niri.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us,ru";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
}
