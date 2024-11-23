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
    ./core/toggleterm.nix
    ./core/treesitter.nix
    ./core/copilot.nix
    ./core/luasnip.nix
    ./core/cmp.nix
    ./settings.nix
    ./languages/python.nix
    ./lanuages/lsp.nix
  ];
  programs.nixvim = {
    enable = true;
  };
}
