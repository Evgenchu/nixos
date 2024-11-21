{
  imports = [
    ./ui/neo-tree.nix
    ./ui/colorscheme.nix
    ./ui/lualine.nix
    ./keymaps/keymaps.nix
    ./core/telescope.nix
    ./core/lazygit.nix
  ];
  programs.nixvim = {
    enable = true;
  };
}
