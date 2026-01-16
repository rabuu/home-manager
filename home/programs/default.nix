{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    wl-clipboard
    eza
    fd
    ripgrep
    tree-sitter
    nodejs
    rustup
    cmake
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
    poppler-utils
    (config.lib.nixGL.wrap kdePackages.kdenlive)
  ];

  imports = [
    ./bat.nix
    ./direnv.nix
    ./emacs.nix
    ./git.nix
    ./konsole.nix
    ./latexmk.nix
    ./neovim.nix
    ./pass.nix
    ./zellij.nix
  ];
}
