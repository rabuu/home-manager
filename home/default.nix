{ config, pkgs, ... }:

let
  username = "rabuu";
  hostname = builtins.getEnv "HOSTNAME";
in {
  home.username = username;
  home.homeDirectory = "/home/${username}";

  imports = [
    ./apps
    ./plasma
    ./session.nix
    ./shell.nix
    ./gpg.nix
    ./browser.nix
    ./fonts.nix
    ./nextcloud-client.nix
  ]
  ++ (if hostname == "khaos" then [ ./hosts/khaos.nix ] else [])
  ++ (if hostname == "proteus" then [ ./hosts/proteus.nix ] else []);

  programs.home-manager.enable = true;
  home.stateVersion = "25.05";
}
