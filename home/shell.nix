{ ... }:
{
  programs.bash = {
    enable = true;
    package = null;
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

      u = "unicd";
    };

    functions = {
      kde_reload_application_cache.body = "kbuildsycoca5\nkbuildsycoca6";
    };

    interactiveShellInit = ''
      set fish_greeting
      set fish_autosuggestion_enabled 0
    '';
  };

  xdg.configFile."fish/fish_variables".source = ../resources/fish/fish_variables;

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
}
