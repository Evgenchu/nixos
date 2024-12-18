{lib, config, ...}: {
    options = {
      nvim.enableModule = lib.mkEnableOption "enableNeovim"; 
    };
  config = lib.mkIf config.nvim.enableModule {
    programs.neovim = {
      enable = false;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;
    };
  };
}
