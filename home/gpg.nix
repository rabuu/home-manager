{ config, pkgs, ... }:
{
  programs.gpg = {
    enable = true;

    homedir = "${config.xdg.dataHome}/gnupg";
  };

  services.gpg-agent = {
    enable = true;

    enableSshSupport = true;

    pinentry = {
      package = pkgs.pinentry-qt;
      program = "pinentry-qt";
    };
  };
}
