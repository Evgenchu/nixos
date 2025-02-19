{
  pkgs ? import <nixpkgs> { },
}:
pkgs.mkShell {
  packages = with pkgs; [
    go
    gotools
    go-tools
  ];
  shellHook = ''
    exec zsh
  '';
}
