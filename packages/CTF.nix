{ lib, config,pkgs, ... }: {                                  
  options = {                                            
    CTF.enable = lib.mkEnableOption "enbable CTF packages"; 
  };                                                     
  config = lib.mkIf config.CTF.enable { 
    home.packages = with pkgs; [
      nmap
      binwalk
      hashcat
      john
      aircrack-ng
      audacity
      thc-hydra
      file
      exiftool
      steghide
    ];
  };
}
