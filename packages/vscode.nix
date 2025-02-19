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
        ms-vscode-remote.remote-containers
        github.vscode-github-actions
        ms-python.python
      ];
    };
  };
}
