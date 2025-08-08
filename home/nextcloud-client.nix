{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    (config.lib.nixGL.wrap nextcloud-client)
  ];

  services.nextcloud-client = {
    enable = true;
    package = (config.lib.nixGL.wrap pkgs.nextcloud-client);
    startInBackground = true;
  };
}
