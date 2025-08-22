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

    discord
    signal-desktop
    telegram-desktop

    jetbrains.idea-ultimate
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
