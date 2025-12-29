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
      sw = "switch";
      rs = "restore";
    };

    extraConfig = {
      init = {
        defaultBranch = "main";
      };
      push = {
        autoSetupRemote = true;
      };
    };
  };
}
