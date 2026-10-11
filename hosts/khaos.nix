{ config, pkgs, ... }: {
  home.packages = with pkgs; [
    (config.lib.nixGL.wrap kdePackages.kdenlive)
  ];

  programs.konsole.profiles.main.font.size = 12;
}
