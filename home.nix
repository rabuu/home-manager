{ config, pkgs, ... }:

{
  home.username = "rabuu";
  home.homeDirectory = "/home/rabuu";

  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    neovim
    eza
    fd
    ripgrep
    wl-clipboard
    libreoffice
    discord
    signal-desktop
    telegram-desktop
    fastfetch
    jetbrains.idea-ultimate

    nerd-fonts.jetbrains-mono
  ];

  fonts.fontconfig.enable = true;

  xdg = {
    enable = true;

    systemDirs.data = [
      "$HOME/.local/share"
      "$HOME/.nix-profile/share"
      "/usr/local/share"
      "/usr/share"
    ];
  };

  home.sessionVariables = {
    CARGO_HOME = "$HOME/.local/share/cargo";

    EDITOR = "nvim";
    SUDO_EDITOR = "vi";
    PAGER = "bat";
    DIFFPROG = "nvim -d";
  };

  home.sessionPath = [
    "$HOME/.nix-profile/bin"
    "$XDG_DATA_HOME/cargo/bin"
  ];

  programs.bash = {
    enable = true;
    package = null;

    initExtra = ''
      if [[ $(ps --no-header --pid=$PPID --format=comm) != 'fish' && -z $BASH_EXECUTION_STRING && $SHLVL == 1 ]]
      then
        shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
	exec fish $LOGIN_OPTION
      fi
    '';
  };

  programs.fish = {
    enable = true;

    shellAliases = {
      cp = "cp --interactive --verbose";
      mv = "mv --interactive --verbose";
      rm = "rm --interactive=once --verbose";
      rmdir = "rmdir --verbose";
      mkdir = "mkdir --parents --verbose";

      eza = "eza --group-directories-first";
      ls = "eza";

      abandon = "disown; exit";
    };

    shellAbbrs = {
      hm = "home-manager";

      sys = "systemctl";
      reboot = "systemctl reboot";
      poweroff = "systemctl poweroff";
      sleep = "systemctl suspend";
      hibernate = "systemctl hibernate";

      l = "ls -1a";
      ll = "ls -la";
      lt = "eza -T --git-ignore";

      ab = "abandon";
      ok = "okular";

      nixdev = "nix develop --command fish";
    };

    interactiveShellInit = ''
      set fish_greeting
      set fish_autosuggestion_enabled 0
    '';
  };

  xdg.configFile = {
    "fish/fish_variables".source = ./fish/fish_variables;

    # HACK(2025-08-03): Fish completion not working OOTB for pass
    "fish/completions/pass.fish" = {
      source = "${pkgs.pass}/share/fish/vendor_completions.d/pass.fish";
    };
  };

  programs.starship = {
    enable = true;

    settings = {
      format = "$username$hostname$directory$character";
      right_format = "$git_branch$git_commit$git_state$git_metrics$git_status$nix_shell";

      cmd_duration.disabled = true;
      line_break.disabled = true;

      git_metrics.disabled = false;

      directory = {
        style = "bold blue";
        format = ''\[[$path]($style)\][$read_only]($read_only_style)'';
        read_only = "[ro]";
        repo_root_style = "bold cyan";
        repo_root_format = ''\[[$before_root_path]($style)[$repo_root]($style)[$path]($style)\][$read_only]($read_only_style)'';
      };

      character = {
        success_symbol = ''[\$](bold green)'';
        error_symbol = ''[\$](bold red)'';
      };

      nix_shell = {
        format = ''\[[$symbol:$name \($state\)]($style)\]'';
        symbol = "nix";
      };
    };
  };

  programs.git = {
    enable = true;

    userName = "Rasmus Buurman";
    userEmail = "rasmus@rbuurman.de";

    aliases = {
      co = "checkout";
      st = "status";
      br = "branch";
      cm = "commit";
      df = "diff";
      dfc = "diff --cached";
    };

    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
  };

  programs.gpg = {
    enable = true;

    homedir = "${config.xdg.dataHome}/gnupg";
  };

  services.gpg-agent = {
    enable = true;

    enableSshSupport = true;

    pinentry = {
      package = pkgs.pinentry-qt;
      program = "pinentry-qt";
    };
  };

  programs.tmux = {
    enable = true;

    prefix = "M-Space";
    shell = "${pkgs.fish}/bin/fish";
    baseIndex = 1;
    escapeTime = 10;
    clock24 = true;
    mouse = true;

    extraConfig = ''
      set-option -ga terminal-overrides ",xterm-256color:Tc"

      set-option -g status-right ""
      set-option -g status-style bg='#343434'

      bind-key | split-window -h -c "#{pane_current_path}"
      bind-key - split-window -v -c "#{pane_current_path}"

      bind -n M-l select-pane -L
      bind -n M-l select-pane -R
      bind -n M-k select-pane -U
      bind -n M-j select-pane -D

      bind -n M-1 select-window -t :=1
      bind -n M-2 select-window -t :=2
      bind -n M-3 select-window -t :=3
      bind -n M-4 select-window -t :=4
      bind -n M-5 select-window -t :=5
      bind -n M-6 select-window -t :=6
    '';
  };

  programs.password-store = {
    enable = true;
    package = pkgs.pass.withExtensions (exts: [ exts.pass-otp ]);
  };

  programs.browserpass = {
    enable = true;
    browsers = [ "firefox" "chromium" ];
  };

  programs.bat = {
    enable = true;

    config = {
      style = "plain,header,grid";
    };
  };

  xdg.configFile."nvim" = {
    source = ./nvim;
    recursive = true;
  };

  #
  # KDE Plasma
  #

  programs.plasma = {
    enable = true;

    workspace = {
      lookAndFeel = "org.kde.breezetwilight.desktop";
    };

    hotkeys.commands = { };

    kwin = {
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

    shortcuts = {
      "services/org.kde.konsole.desktop" = {
        _launch = "Meta+Shift+Return";
      };
      "services/firefox-esr.desktop" = {
        _launch = "Meta+Shift+B";
      };
      "services/org.kde.krunner.desktop" = {
        _launch = [ "Meta+Alt+Space" "Search" ];
      };

      kwin = {
        "Activate Window Demanding Attention" = "none";
        "Cycle Overview" = "none";
        "Cycle Overview Opposite" = "none";
        "Decrease Opacity" = "none";
        "Edit Tiles" = "none";
        "Expose" = "none";
        "ExposeAll" = "none";
        "ExposeClass" = "none";
        "ExposeClassCurrentDesktop" = "none";
        "Grid View" = "Meta+G";
        "Increase Opacity" = "none";
        "Kill Window" = "Meta+Ctrl+Esc";
        "Move Tablet to Next Output" = "none";
        "MoveMouseToCenter" = "none";
        "MoveMouseToFocus" = "none";
        "MoveZoomDown" = "none";
        "MoveZoomLeft" = "none";
        "MoveZoomRight" = "none";
        "MoveZoomUp" = "none";
        "Overview" = "none";
        "PoloniumCycleEngine" = "none";
        "PoloniumFocusAbove" = "Meta+K";
        "PoloniumFocusBelow" = "Meta+J";
        "PoloniumFocusLeft" = "Meta+H";
        "PoloniumFocusRight" = "Meta+L";
        "PoloniumInsertAbove" = "Meta+Shift+K";
        "PoloniumInsertBelow" = "Meta+Shift+J";
        "PoloniumInsertLeft" = "Meta+Shift+H";
        "PoloniumInsertRight" = "Meta+Shift+L";
        "PoloniumOpenSettings" = "none";
        "PoloniumResizeAbove" = "Meta+Ctrl+K";
        "PoloniumResizeBelow" = "Meta+Ctrl+J";
        "PoloniumResizeLeft" = "Meta+Ctrl+H";
        "PoloniumResizeRight" = "Meta+Ctrl+L";
        "PoloniumRetileWindow" = "Meta+Space";
        "PoloniumSwitchBTree" = "Meta+Ctrl+B";
        "PoloniumSwitchHalf" = "none";
        "PoloniumSwitchKwin" = "Meta+Ctrl+F";
        "PoloniumSwitchMonocle" = "Meta+Ctrl+M";
        "PoloniumSwitchThreeColumn" = "Meta+Ctrl+T";
        "Setup Window Shortcut" = "none";
        "Show Desktop" = "none";
        "Switch One Desktop Down" = "none";
        "Switch One Desktop Up" = "none";
        "Switch One Desktop to the Left" = "none";
        "Switch One Desktop to the Right" = "none";
        "Switch Window Down" = "none";
        "Switch Window Left" = "none";
        "Switch Window Right" = "none";
        "Switch Window Up" = "none";
        "Switch to Desktop 1" = "Meta+1";
        "Switch to Desktop 10" = "none";
        "Switch to Desktop 11" = "none";
        "Switch to Desktop 12" = "none";
        "Switch to Desktop 13" = "none";
        "Switch to Desktop 14" = "none";
        "Switch to Desktop 15" = "none";
        "Switch to Desktop 16" = "none";
        "Switch to Desktop 17" = "none";
        "Switch to Desktop 18" = "none";
        "Switch to Desktop 19" = "none";
        "Switch to Desktop 2" = "Meta+2";
        "Switch to Desktop 20" = "none";
        "Switch to Desktop 3" = "Meta+3";
        "Switch to Desktop 4" = "Meta+4";
        "Switch to Desktop 5" = "Meta+5";
        "Switch to Desktop 6" = "Meta+6";
        "Switch to Desktop 7" = "none";
        "Switch to Desktop 8" = "none";
        "Switch to Desktop 9" = "none";
        "Switch to Next Desktop" = "none";
        "Switch to Next Screen" = "none";
        "Switch to Previous Desktop" = "none";
        "Switch to Previous Screen" = "none";
        "Switch to Screen 0" = "none";
        "Switch to Screen 1" = "none";
        "Switch to Screen 2" = "none";
        "Switch to Screen 3" = "none";
        "Switch to Screen 4" = "none";
        "Switch to Screen 5" = "none";
        "Switch to Screen 6" = "none";
        "Switch to Screen 7" = "none";
        "Switch to Screen Above" = "none";
        "Switch to Screen Below" = "none";
        "Switch to Screen to the Left" = "none";
        "Switch to Screen to the Right" = "none";
        "Toggle Night Color" = "none";
        "Toggle Window Raise/Lower" = "none";
        "Walk Through Windows" = "Alt+Tab";
        "Walk Through Windows (Reverse)" = "Alt+Shift+Tab";
        "Walk Through Windows Alternative" = "none";
        "Walk Through Windows Alternative (Reverse)" = "none";
        "Walk Through Windows of Current Application" = "none";
        "Walk Through Windows of Current Application (Reverse)" = "none";
        "Walk Through Windows of Current Application Alternative" = "none";
        "Walk Through Windows of Current Application Alternative (Reverse)" = "none";
        "Window Above Other Windows" = "none";
        "Window Below Other Windows" = "none";
        "Window Close" = [ "Meta+Shift+C" "Alt+F4" ];
        "Window Custom Quick Tile Bottom" = "none";
        "Window Custom Quick Tile Left" = "none";
        "Window Custom Quick Tile Right" = "none";
        "Window Custom Quick Tile Top" = "none";
        "Window Fullscreen" = "Meta+F";
        "Window Grow Horizontal" = "none";
        "Window Grow Vertical" = "none";
        "Window Lower" = "none";
        "Window Maximize" = "none";
        "Window Maximize Horizontal" = "none";
        "Window Maximize Vertical" = "none";
        "Window Minimize" = "none";
        "Window Move" = "none";
        "Window Move Center" = "none";
        "Window No Border" = "none";
        "Window On All Desktops" = "none";
        "Window One Desktop Down" = "none";
        "Window One Desktop Up" = "none";
        "Window One Desktop to the Left" = "none";
        "Window One Desktop to the Right" = "none";
        "Window One Screen Down" = "none";
        "Window One Screen Up" = "none";
        "Window One Screen to the Left" = "none";
        "Window One Screen to the Right" = "none";
        "Window Operations Menu" = "none";
        "Window Pack Down" = "none";
        "Window Pack Left" = "none";
        "Window Pack Right" = "none";
        "Window Pack Up" = "none";
        "Window Quick Tile Bottom" = "none";
        "Window Quick Tile Bottom Left" = "none";
        "Window Quick Tile Bottom Right" = "none";
        "Window Quick Tile Left" = "none";
        "Window Quick Tile Right" = "none";
        "Window Quick Tile Top" = "none";
        "Window Quick Tile Top Left" = "none";
        "Window Quick Tile Top Right" = "none";
        "Window Raise" = "none";
        "Window Resize" = "none";
        "Window Shade" = "none";
        "Window Shrink Horizontal" = "none";
        "Window Shrink Vertical" = "none";
        "Window to Desktop 1" = "Meta+Shift+1";
        "Window to Desktop 10" = "none";
        "Window to Desktop 11" = "none";
        "Window to Desktop 12" = "none";
        "Window to Desktop 13" = "none";
        "Window to Desktop 14" = "none";
        "Window to Desktop 15" = "none";
        "Window to Desktop 16" = "none";
        "Window to Desktop 17" = "none";
        "Window to Desktop 18" = "none";
        "Window to Desktop 19" = "none";
        "Window to Desktop 2" = "Meta+Shift+2";
        "Window to Desktop 20" = "none";
        "Window to Desktop 3" = "Meta+Shift+3";
        "Window to Desktop 4" = "Meta+Shift+4";
        "Window to Desktop 5" = "Meta+Shift+5";
        "Window to Desktop 6" = "Meta+Shift+6";
        "Window to Desktop 7" = "none";
        "Window to Desktop 8" = "none";
        "Window to Desktop 9" = "none";
        "Window to Next Desktop" = "none";
        "Window to Next Screen" = "none";
        "Window to Previous Desktop" = "none";
        "Window to Previous Screen" = "none";
        "Window to Screen 0" = "none";
        "Window to Screen 1" = "none";
        "Window to Screen 2" = "none";
        "Window to Screen 3" = "none";
        "Window to Screen 4" = "none";
        "Window to Screen 5" = "none";
        "Window to Screen 6" = "none";
        "Window to Screen 7" = "none";
        "disableInputCapture" = "none";
        "view_actual_size" = "Meta+0";
        "view_zoom_in" = [ "Meta++" "Meta+=" ];
        "view_zoom_out" = "Meta+-";
      };

      plasmashell = {
        "activate task manager entry 1" = "none";
        "activate task manager entry 2" = "none";
        "activate task manager entry 3" = "none";
        "activate task manager entry 4" = "none";
        "activate task manager entry 5" = "none";
        "activate task manager entry 6" = "none";
        "activate task manager entry 7" = "none";
        "activate task manager entry 8" = "none";
        "activate task manager entry 9" = "none";
      };

      ksmserver = {
        "Lock Session" = "Screensaver";
      };
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

  programs.konsole = {
    enable = true;
    defaultProfile = "main";

    profiles = {
      main = {
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
      GruvboxBlack = ./konsole/GruvboxBlack.colorscheme;
    };
  };

  programs.home-manager.enable = true;
}
