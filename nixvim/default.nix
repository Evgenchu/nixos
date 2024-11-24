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
    ./core/todo-comments.nix
    ./core/navic.nix 
    ./settings.nix
    ./languages/python.nix
    ./languages/lsp.nix
  ];
  programs.nixvim = {
    enable = true;
  };
}
