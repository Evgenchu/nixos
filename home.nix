{ pkgs, ... }:

{
  imports = [
    ./packages/packagebundle.nix
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "evgeni";
  home.homeDirectory = "/home/evgeni";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.
  nixpkgs.config.allowUnfree = true;
  home.enableNixpkgsReleaseCheck = false;
  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    fd
    ripgrep
    gcc
    fastfetch
    discord
    btop
    pywal
    killall
    unzip
    p7zip
    nodejs
    wireshark
    gnumake
    usbutils
    gdb
    fzf
    openvpn
    openssl
    freerdp
    cargo
    lazygit
    gh
    cmatrix
    zip
    awscli2
    obs-studio
    pciutils
    ffmpeg
    lsd
    luarocks
    lua
    wl-clipboard
    nixpkgs-fmt
    vesktop
    (lutris.override {
      extraPkgs = pkgs: [
        wineWowPackages.stable
        winetricks
      ];
    })
  ]; # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };
  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. If you don't want to manage your shell through Home
  # Manager then you have to manually source 'hm-session-vars.sh' located at
  # either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/evgeni/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = { };
  programs.home-manager.enable = true;
}
