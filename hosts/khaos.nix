{ config, pkgs, ... }: {
  nixGL.defaultWrapper = "nvidia";
  nixGL.installScripts = [ "nvidia" "mesa" ];

  home.packages = with pkgs; [
    (config.lib.nixGL.wrap freecad)
  ];
}
