{ pkgs, ... }:
{
  home.packages = with pkgs; [
    neovim
  ];

  xdg.configFile."nvim" = {
    source = ../../resources/nvim;
    recursive = true;
  };
}
