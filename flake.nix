{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-darwin.url = "github:lnl7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, nix-darwin, home-manager, ... }: {
    darwinConfigurations = {
      Thubies-MacBook-Pro = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        modules = [
          ./systems/darwin/configuration.nix
          home-manager.darwinModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.thubie = import ./home.nix;
          }
        ];
      };
    };
  };
}