{
  description = "ballin flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
    nixvim.url = "github:Evgenchu/nixvim_flake";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nixpkgs-stable,
      nixvim,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      nixosConfigurations = {
        nixos-tablet = nixpkgs.lib.nixosSystem rec {
          inherit system;
          specialArgs = {
            pkgs-stable = import nixpkgs-stable {
              inherit system;
              config.allowUnfree = true;
            };
            inherit inputs;
          };
          modules = [
            ./lenovo-tablet/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useUserPackages = true;
                extraSpecialArgs = specialArgs;
                users.evgeni = {
                  imports = [ ./home.nix ];
                };
              };
            }
          ];
        };
        nixos = nixpkgs.lib.nixosSystem rec {
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
                useUserPackages = true;
                extraSpecialArgs = specialArgs;
                users.evgeni = {
                  imports = [ ./home.nix ];
                };
              };
            }
          ];
        };
      };
      devShells.${system} = {
        python = pkgs.callPackage ./shells/pythonShell.nix { inherit pkgs; };
        go = pkgs.callPackage ./shells/goShell.nix { inherit pkgs; };
      };
    };
}
