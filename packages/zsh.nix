{ lib, config, ... }:
{
  options = {
    zsh.enableModule = lib.mkEnableOption "enbable zsh";
  };
  config = lib.mkIf config.zsh.enableModule {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      autosuggestion.enable = true;
      dotDir = ".config/zsh";
      shellAliases = {
        v = "nvim";
        ls = "lsd";
      };
      initExtra = ''
        [[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh      
        (cat ~/.cache/wal/sequences &)                                            
        cat ~/.cache/wal/sequences                                                
        bindkey '^R' history-incremental-search-backward 
        fastfetch
      '';
      zplug = {
        enable = true;
        plugins = [
          {
            name = "romkatv/powerlevel10k";
            tags = [
              "as:theme"
              "depth:1"
            ];
          }
        ];
      };
    };
  };
}
