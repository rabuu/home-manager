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
