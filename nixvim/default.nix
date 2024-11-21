{
  imports = [
    ./colorscheme.nix
    ./lualine.nix
  ];
  programs.nixvim = {
    enable = true;
  };
}
