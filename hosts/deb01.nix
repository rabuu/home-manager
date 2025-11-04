{ pkgs, ... }:
{
  nixGL.defaultWrapper = "mesa";
  nixGL.installScripts = [ "mesa" ];
}
