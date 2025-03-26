{
  lib,
  config,
  pkgs-stable,
  ...
}:
{
  options = {
    stable.enable = lib.mkEnableOption "download stable packages";
  };
  config = lib.mkIf config.stable.enable {
    home.packages = with pkgs-stable; [
      nerdfonts
    ];
  };
}
