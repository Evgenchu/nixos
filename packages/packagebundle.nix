# NOTE: try to do something "juicy" here cmon
{ lib, ... }: {
  imports = [
    ./zsh.nix
    ./CTF.nix
    ./nvim.nix
    ./stable.nix
  ];
  
  nvim.enableModule = lib.mkDefault true;
  zsh.enableModule = lib.mkDefault true;
  CTF.enable = lib.mkDefault true;
  stable.enable = lib.mkDefault true;
}
