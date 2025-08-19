{ config, pkgs, ... }:

let
  username = "rabuu";
  hostname = builtins.getEnv "HOSTNAME";
in {
  home.username = username;
  home.homeDirectory = "/home/${username}";

  imports = [
    ./programs
    ./plasma
    ./nixgl.nix
    ./session.nix
    ./shell.nix
    ./gpg.nix
    ./browser.nix
    ./fonts.nix
    ./nextcloud-client.nix
  ];

  programs.home-manager.enable = true;
  home.stateVersion = "25.05";
}
