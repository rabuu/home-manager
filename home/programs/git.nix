{ ... }:
{
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
    };
  };
}
