{ pkgs, ... }:
{
  targets.genericLinux.nixGL = {
    defaultWrapper = "mesa";
    installScripts = [ "mesa" ];
  };
}
