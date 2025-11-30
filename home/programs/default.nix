{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    wl-clipboard
    eza
    fd
    ripgrep
    tree-sitter
    nodejs
    fastfetch
    onefetch
    tokei
    libreoffice
    thunderbird
    discord
    signal-desktop
    telegram-desktop
    slack
    chromium
    tor-browser
    vscode
    spotify
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
