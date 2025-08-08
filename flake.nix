{
  description = "Home Manager configuration of rabuu";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs =
    inputs@{ nixpkgs, home-manager, plasma-manager, ... }:
    let
      system = "x86_64-linux";
    in
      {
      homeConfigurations."rabuu" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };

        modules = [
          inputs.plasma-manager.homeManagerModules.plasma-manager
          ./home
        ];
      };
    };
}
