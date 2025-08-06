{ config, pkgs, ... }:

{
  home.username = "rabuu";
  home.homeDirectory = "/home/rabuu";

  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    neovim
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

    kdePackages.krohnkite
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

    shellAbbrs = {
      hm = "home-manager";

      sys = "systemctl";
      reboot = "systemctl reboot";
      poweroff = "systemctl poweroff";
      sleep = "systemctl suspend";
      hibernate = "systemctl hibernate";
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

    shortcuts = {
      "services/org.kde.konsole.desktop" = {
        _launch = "Meta+Shift+Return";
      };
      "services/firefox-esr.desktop" = {
        _launch = "Meta+Shift+B";
      };
      "services/org.kde.krunner.desktop" = {
        _launch = "Search";
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
