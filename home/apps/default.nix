{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    eza
    fd
    ripgrep
    wl-clipboard
    libreoffice
    discord
    signal-desktop
    telegram-desktop
    fastfetch
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
