{
  imports = [
    ./ui/neo-tree.nix
    ./ui/colorscheme.nix
    ./ui/lualine.nix
    ./ui/bufferline.nix
    ./keymaps/keymaps.nix
    ./core/telescope.nix
    ./core/lazygit.nix
    ./core/indentline.nix
    ./core/autopairs.nix
    ./settings.nix
  ];
  programs.nixvim = {
    enable = true;
  };
}
