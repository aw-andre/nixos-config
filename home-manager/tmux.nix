{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    prefix = "Delete";
    mouse = true;
    escapeTime = 0;
    terminal = "tmux-256color";
    plugins = with pkgs.tmuxPlugins; [ yank ];
    extraConfig = ''
      set -ga terminal-overrides ',xterm-256color:Tc'
      set -as terminal-overrides ',*:Smulx=\E[4::%p1%dm'
      set -as terminal-overrides ',*:Setulc=\E[58::2::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m'
      set -g focus-events on
      set -g status-style bg=default
      set -g status-position top
      set -g status-left ""
      set -g status-right ""
      set -g status-justify centre
    '';
  };
}
