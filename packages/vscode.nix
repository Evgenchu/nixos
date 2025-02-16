{
  lib,
  config,
  pkgs,
  ...
}:
{
  options = {
    vscode.enableModule = lib.mkEnableOption "enable vscode";
  };
  config = lib.mkIf config.vscode.enableModule {
    programs.vscode = {
      enable = true;
      extensions = with pkgs.vscode-extensions; [
        dracula-theme.theme-dracula
      ];
    };
  };
}
