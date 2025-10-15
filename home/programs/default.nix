{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    wl-clipboard
    eza
    fd
    ripgrep
    fastfetch
    onefetch
    tokei
    libreoffice
    discord
    signal-desktop
    telegram-desktop
    slack
    chromium
    tor-browser
    vscode
    (config.lib.nixGL.wrap kdePackages.kdenlive)
  ];

  imports = [
    ./bat.nix
    ./direnv.nix
    ./git.nix
    ./konsole.nix
    ./latexmk.nix
    ./neovim.nix
    ./pass.nix
    ./zellij.nix
  ];
}
