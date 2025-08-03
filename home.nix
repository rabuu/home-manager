{ config, pkgs, ... }:

{
  home.username = "rabuu";
  home.homeDirectory = "/home/rabuu";

  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    neovim
    bat
    fd
    ripgrep
    wl-clipboard
  ];

  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;
  };

  home.sessionVariables = {
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";

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
    terminal = "screen-256color";
    baseIndex = 1;
    escapeTime = 10;
    clock24 = true;
    mouse = true;

    extraConfig = ''
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

  # HACK(2025-08-03): Fish completion not working for pass
  xdg.configFile."fish/completions/pass.fish" = {
    source = "${pkgs.pass}/share/fish/vendor_completions.d/pass.fish";
  };

  programs.browserpass = {
    enable = true;
    browsers = [ "firefox" "chromium" ];
  };

  #
  # KDE Plasma
  #

  programs.plasma = {
    enable = true;
  };

  programs.konsole = {
    enable = true;
    defaultProfile = "main";

    profiles = {
      main = { };
    };
  };

  programs.home-manager.enable = true;
}
