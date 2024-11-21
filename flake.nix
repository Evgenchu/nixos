{
  description = "ballin flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim.url = "github:nix-community/nixvim";
  };

  outputs = { self, nixpkgs, home-manager, nixpkgs-stable, nixvim, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        nixos = nixpkgs.lib.nixosSystem rec{
          inherit system;
          specialArgs = {
            pkgs-stable = import nixpkgs-stable {
              inherit system;
              config.allowUnfree = true;
            };
            inherit inputs;
          };
          modules = [
            ./configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                sharedModules = [ nixvim.homeManagerModules.nixvim ];
                extraSpecialArgs = specialArgs;
                users.evgeni = {
                  imports =  [./home.nix];
                  programs.nixvim = {
                    enable = true;
                  };
                };
              };
            }
          ];
        };
      };
      devShells.${system} = {
        python = pkgs.callPackage ./shells/pythonShell.nix {inherit pkgs;};
      };
    };
}
