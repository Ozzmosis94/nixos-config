{ pkgs, ... }:
{
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    xdgOpenUsePortal = true;
    extraPortals = with pkgs; [
      #xdg-desktop-portal
      #xdg-desktop-portal-wlr
      xdg-desktop-portal-gnome
    ];
    config.common = {
      default = [
        "gnome"
        "gtk"
      ];
      # "org.freedesktop.impl.portal.ScreenCast" = "wlr";
      # "org.freedesktop.impl.portal.ScreenCast" = "gtk";
      # "org.freedesktop.impl.portal.FileChooser" = "gtk";
    };
  };
}
