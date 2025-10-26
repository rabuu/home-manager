{ config, pkgs, ... }: {
  nixGL.defaultWrapper = "nvidia";
  nixGL.installScripts = [ "nvidia" "mesa" ];
}
