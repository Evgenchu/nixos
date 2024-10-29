# TODO: This module could get some improvements probably.... read more about "_module" in flake.nix
{ lib, ... }: {
  imports = [
    ./zsh.nix
    ./nvim.nix
    ./CTF.nix
    ./stable.nix
  ];

  zsh.enableModule = lib.mkDefault true;
  nvim.enableModule = lib.mkDefault true;
  CTF.enable = lib.mkDefault true;
  stable.enable = lib.mkDefault true;
}
