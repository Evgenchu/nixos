{
  lib,
  config,
  pkgs,
  ...
}:
{
  options = {
    vscode.enable = lib.mkEnableOption "enable vscode";
  };
  config = lib.mkIf config.vscode.enable {
    programs.vscode = {
      enable = true;
      extensions = with pkgs.vscode-extensions; [
        dracula-theme.theme-dracula
        ms-vscode-remote.remote-containers
      ];
    };
  };
}
