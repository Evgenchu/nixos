{
  imports = [
    ./ui/neo-tree.nix
    ./ui/colorscheme.nix
    ./ui/lualine.nix
    ./keymaps/keymaps.nix
  ];
  programs.nixvim = {
    enable = true;
  };
}
