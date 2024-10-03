{ lib, ... }: {
  imports = [
    ./zsh.nix
    ./nvim.nix
    ./CTF.nix
  ];

  zsh.enableModule = lib.mkDefault true;
  nvim.enableModule = lib.mkDefault true;
  CTF.enable = lib.mkDefault true;
}
