# TODO: CTF packages
# TODO: Sandbox
# TODO: cyber sys conf
{ lib, config,pkgs, ... }: {                                  
  options = {                                            
    CTF.enable = lib.mkEnableOption "enbable CTF packages"; 
  };                                                     
  config = lib.mkIf config.CTF.enable { 
    home.packages = with pkgs; [
      nmap
      hashcat
      john
      aircrack-ng
      audacity
      hydra
    ];
  };
}
