{ ... }:
{
  imports = [
    ./kwin.nix
    ./shortcuts.nix
  ];

  programs.plasma = {
    enable = true;

    workspace = {
      lookAndFeel = "org.kde.breezetwilight.desktop";
    };

    input.keyboard.layouts = [
      {
        layout = "us";
        variant = "altgr-intl";
      }
      {
        layout = "de";
      }
    ];
  };
}
