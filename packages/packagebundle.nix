# NOTE: try to do something "juicy" here cmon
{ lib, ... }: {
  imports = [
    ./zsh.nix
    ./CTF.nix
    ./stable.nix
  ];
  
  zsh.enableModule = lib.mkDefault true;
  CTF.enable = lib.mkDefault true;
  stable.enable = lib.mkDefault true;
}
