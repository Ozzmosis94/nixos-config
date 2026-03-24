{ pkgs, ... }: {
  programs.zed-editor = {
    enable = true;
    extensions = ["nix" "vue" "scss"];
    extraPackages = [
      pkgs.nixd
      pkgs.package-version-server
    ];
    userSettings = {
      proxy = "socks5h://localhost:1080";

      languages = {
        Nix = {
          language_servers = [ "nixd" ];
        };
      };
    };
  };
}
