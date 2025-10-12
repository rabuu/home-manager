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
    typst
    tinymist
    typship

    discord
    signal-desktop
    telegram-desktop
    slack

    chromium
    tor-browser

    vscode
    jetbrains.idea-ultimate

    testdisk

    (config.lib.nixGL.wrap kdePackages.kdenlive)
  ];

  imports = [
    ./bat.nix
    ./direnv.nix
    ./git.nix
    ./konsole.nix
    ./neovim.nix
    ./pass.nix
    ./zellij.nix
  ];
}
