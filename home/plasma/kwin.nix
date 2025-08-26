{ ... }:
{
  programs.plasma.kwin = {
    virtualDesktops = {
      number = 6;
      rows = 2;
    };

    scripts.polonium = {
      enable = true;
      settings = {
        borderVisibility = "noBorderAll";
        resizeAmount = 80;
        layout.insertionPoint = "right";
        filter.processes = [
          "pinentry-qt"
        ];
      };
    };
  };
}
