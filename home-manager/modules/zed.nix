{ pkgs, ... }:
{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "vue"
      "scss"
      "oxc"
    ];
    extraPackages = with pkgs; [
      nixd
      nixfmt
      package-version-server
    ];
    userSettings = {
      proxy = "socks5h://localhost:1080";
      lsp = {
        eslint = {
          settings = {
            experimental = {
              useFlatConfig = false;
            };
          };
        };
      };

      languages = {
        Nix = {
          language_servers = [ "nixd" ];
          formatter = {
            external = {
              command = "nixfmt";
            };
          };
        };
      };
    };
  };
}
