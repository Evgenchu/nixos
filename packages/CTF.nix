# TODO: CTF packages, sandbox, sec shell configuration 
{ lib, config,pkgs, ... }: {                                  
  options = {                                            
    CTF.enable = lib.mkEnableOption "enbable CTF packages"; 
  };                                                     
  config = lib.mkIf config.CTF.enable { 
    environment.systemPackages = with pkgs; [
      nmap
    ];
  };
}
