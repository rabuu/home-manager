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

    chromium
    tor-browser

    jetbrains.idea-ultimate

    testdisk

    (config.lib.nixGL.wrap kdePackages.kdenlive)
  ];

  imports = [
    ./bat.nix
    ./git.nix
    ./konsole.nix
    ./neovim.nix
    ./pass.nix
    ./tmux.nix
  ];
}
