{ pkgs, ... }:
{
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
}
