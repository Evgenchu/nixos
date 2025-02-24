# NOTE: try to do something "juicy" here cmon
{ lib, ... }:
{
  imports = [
    ./zsh.nix
    ./stable.nix
    ./vscode.nix
  ];

  zsh.enableModule = lib.mkDefault true;
  stable.enable = lib.mkDefault true;
  vscode.enable = lib.mkDefault true;
}
