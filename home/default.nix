{ config, pkgs, ... }:

let
  username = "rabuu";
  hostname = builtins.getEnv "HOSTNAME";
in {
  home.username = username;
  home.homeDirectory = "/home/${username}";

  imports = [
    ./plasma
    ./browser.nix
    ./emacs.nix
    ./fonts.nix
    ./gpg.nix
    ./neovim.nix
    ./nextcloud-client.nix
    ./nixgl.nix
    ./pass.nix
    ./programs.nix
    ./session.nix
    ./shell.nix
    ./zellij.nix
  ];

  programs.home-manager.enable = true;
  home.stateVersion = "25.05";
}
