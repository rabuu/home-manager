{ ... }:
{
  xdg = {
    enable = true;

    systemDirs.data = [
      "$HOME/.local/share"
      "$HOME/.nix-profile/share"
      "/usr/local/share"
      "/usr/share"
    ];

    mimeApps = {
      enable = true;
      defaultApplications = {
        "default-web-browser" = [ "firefox-esr.desktop" ];
        "text/html" = [ "firefox-esr.desktop" ];
        "x-scheme-handler/http" = [ "firefox-esr.desktop" ];
        "x-scheme-handler/https" = [ "firefox-esr.desktop" ];
        "x-scheme-handler/about" = [ "firefox-esr.desktop" ];
        "x-scheme-handler/unknown" = [ "firefox-esr.desktop" ];
      };
    };
  };

  home.sessionVariables = {
    CARGO_HOME = "$HOME/.local/share/cargo";

    EDITOR = "nvim";
    SUDO_EDITOR = "vi";
    PAGER = "bat";
    DIFFPROG = "nvim -d";
  };

  home.sessionPath = [
    "$HOME/.local/bin"
    "$HOME/.nix-profile/bin"
    "$XDG_DATA_HOME/cargo/bin"
  ];
}
