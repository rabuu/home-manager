{ pkgs, ... }:
let
  myEmacs = (pkgs.emacsPackagesFor pkgs.emacs).emacsWithPackages (epkgs: with epkgs; [
    vterm
  ]);
in
{
  home.packages = with pkgs; [
      myEmacs
  ];

  xdg.configFile."emacs" = {
    source = ../../other/emacs;
    recursive = true;
  };
}
