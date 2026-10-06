{ pkgs, ... }:
{
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono

    noto-fonts
    noto-fonts-color-emoji

    libertinus

    # CV (typst template brilliant-cv:2.0.8 and modern-cv:0.10.0)
    roboto
    source-sans
    source-sans-pro
    font-awesome_6
    font-awesome_7
  ];
}
