{ lib, ... }: {
  imports = [
    ./zsh.nix
    ./nvim.nix
  ];

  zsh.enableModule = lib.mkDefault true;
  nvim.enableModule = lib.mkDefault true;
}
