# NOTE: try to do something "juicy" here cmon
{ lib, ... }:
{
  imports = [
    ./zsh.nix
    ./stable.nix
  ];

  zsh.enableModule = lib.mkDefault true;
  stable.enable = lib.mkDefault true;
}
