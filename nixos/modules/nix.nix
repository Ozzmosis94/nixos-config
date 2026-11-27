{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Signed binary cache for llm-agents packages.
  nix.settings.extra-substituters = [ "https://cache.numtide.com" ];
  nix.settings.extra-trusted-public-keys = [
    "niks3.numtide.com-1:DTx8wZduET09hRmMtKdQDxNNthLQETkc/yaX7M4qK0g="
  ];
}
