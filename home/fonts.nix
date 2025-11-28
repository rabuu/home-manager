{ pkgs, ... }:
{
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono

    # CV (typst template brilliant-cv:2.0.8)
    roboto
    source-sans
    source-sans-pro
    font-awesome_6
  ];
}
