{ ... }:
{
  programs.konsole = {
    enable = true;
    defaultProfile = "main";

    profiles = {
      main = {
        command = "zellij";

        colorScheme = "GruvboxBlack";

        font = {
          name = "JetBrainsMono Nerd Font";
          size = 10;
        };

        extraConfig = {
          General = {
            DimWhenInactive = true;
            ShowTerminalSizeHint = false;
            TerminalMargin = 3;
          };
          Appearance = {
            DimmValue = 50;
          };
          Scrolling = {
            HighlightScrolledLines = false;
            ScrollBarPosition = 2; # 2 -> hidden
          };
        };
      };
    };

    customColorSchemes = {
      GruvboxBlack = ../../resources/konsole/GruvboxBlack.colorscheme;
    };
  };
}
