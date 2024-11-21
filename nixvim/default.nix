{
  imports = [
    ./ui/colorscheme.nix
    ./ui/lualine.nix
  ];
  programs.nixvim = {
    enable = true;
  };
}
