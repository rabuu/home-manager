{
  description = "Home Manager configuration of rabuu";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixgl = {
      url = "github:nix-community/nixGL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };
  };

  outputs =
    inputs@{ nixpkgs, nixgl, home-manager, plasma-manager, ... }:
    let
      system = "x86_64-linux";
    in
      {
      homeConfigurations."rabuu@proteus" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };

        modules = [
          inputs.plasma-manager.homeModules.plasma-manager
          ./home
          ./hosts/proteus.nix
        ];

        extraSpecialArgs.nixgl = nixgl;
      };
      homeConfigurations."rabuu@khaos" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };

        modules = [
          inputs.plasma-manager.homeModules.plasma-manager
          ./home
          ./hosts/khaos.nix
        ];

        extraSpecialArgs.nixgl = nixgl;
      };
    };
}
