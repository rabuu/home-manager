{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    wl-clipboard
    eza
    fd
    ripgrep
    tree-sitter
    nodejs
    rustup
    cmake
    fastfetch
    onefetch
    tokei
    libreoffice
    gimp
    thunderbird
    discord
    signal-desktop
    telegram-desktop
    slack
    chromium
    tor-browser
    vscode
    spotify
    poppler-utils
    hyperfine
    ausweisapp
    (config.lib.nixGL.wrap foliate)
  ];

  programs.bat = {
    enable = true;
    config = {
      style = "plain,header,grid";
    };
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options = {
      line-numbers = true;
    };
  };

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    config = {
      global = {
        hide_env_diff = true;
        log_filter = "^$";
        warn_timeout = 0;
      };
    };
  };

  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "Rasmus Buurman";
        email = "rasmus@rbuurman.de";
      };

      alias = {
        co = "checkout";
        st = "status";
        br = "branch";
        cm = "commit";
        df = "diff";
        dfc = "diff --cached";
        sw = "switch";
        rs = "restore";
      };

      init = {
        defaultBranch = "main";
      };

      push = {
        autoSetupRemote = true;
      };

      merge = {
        conflictStyle = "zdiff3";
      };
    };
  };

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
      GruvboxBlack = ../other/konsole/GruvboxBlack.colorscheme;
    };
  };

  programs.qalculate.enable = true;

  # latexmk
  xdg.configFile."latexmk/latexmkrc".text = ''
$pdflatex = 'lualatex -shell-escape %O %S';
$pdf_mode = 1;
$postscript_mode = $dvi_mode = 0;
  '';
}
