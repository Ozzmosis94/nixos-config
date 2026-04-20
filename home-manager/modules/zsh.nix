{
  programs.zsh = {
    enable = false;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh = {
      enable = true;
      # plugins = [
      #   "git"
      #   "sudo"
      # ];
      theme = "robbyrussell";
    };
  };
}
