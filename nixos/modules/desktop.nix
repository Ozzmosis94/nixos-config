{ pkgs, ... }:
{
  # Enable the X11 windowing system.
  services.xserver.enable = true;

  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  environment.systemPackages = with pkgs; [
    gnomeExtensions.dash-to-dock
    gnomeExtensions.blur-my-shell
    gnomeExtensions.tiling-shell
    gnomeExtensions.auto-move-windows
  ];

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
