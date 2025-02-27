{ pkgs, ... }:
{
  programs.zathura = {
    enable = true;
    package = pkgs.zathura;
    options = {
      selection-clipboard = "clipboard";
    };
  };
}
