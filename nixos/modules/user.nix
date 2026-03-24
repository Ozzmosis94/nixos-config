{ pkgs, username, ... }: {
  programs.fish.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users = {
    defaultUserShell = pkgs.fish;
    users.${username} = {
      isNormalUser = true;
      description = username;
      extraGroups = [ "networkmanager" "wheel" ];
      shell = pkgs.fish;
      #packages = with pkgs; [];
    };
  };

  systemd = {
      packages = [ pkgs.pritunl-client ];
      targets = {
          multi-user = {
              wants = [ "pritunl-client.service" ];
          };
      };
  };
}
