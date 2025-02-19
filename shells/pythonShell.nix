{
  pkgs ? import <nixpkgs> { },
}:
pkgs.mkShell {
  packages = [
    (pkgs.python3.withPackages (python-pkgs: [
      python-pkgs.tkinter
      python-pkgs.pandas
      python-pkgs.scipy
      python-pkgs.requests
    ]))
  ];
  shellHook = ''
    exec zsh
  '';
}
