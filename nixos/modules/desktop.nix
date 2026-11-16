{
  # KDE Plasma + SDDM in place of GNOME/GDM.
  services.xserver.enable = true;
  services.xserver.xkb.layout = "us,ru";
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.printing.enable = true;
}
