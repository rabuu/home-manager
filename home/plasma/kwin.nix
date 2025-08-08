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
        borderVisibility = "borderAll";
        layout.insertionPoint = "right";
      };
    };
  };
}
