{ ... }:
{
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
}
