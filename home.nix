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
  ];

  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;
  };

  home.sessionVariables = {
    XDG_CONFIG_HOME = "$HOME/.config";
    EDITOR = "nvim";
  };

  home.sessionPath = [
    "$HOME/.nix-profile/bin"
  ];

  programs.bash = {
    enable = true;
    package = null;
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

  programs.home-manager.enable = true;
}
