{ pkgs, ... }:
{
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
}
