{ pkgs, ... }:
{
  programs.bat = {
    enable = true;

    config = {
      style = "plain,header,grid";
    };
  };
}
