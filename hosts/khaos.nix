{ config, pkgs, ... }: {
  targets.genericLinux.nixGL = {
    defaultWrapper = "nvidia";
    installScripts = [ "nvidia" "mesa" ];
  };

  home.packages = with pkgs; [
    # ...
  ];
}
