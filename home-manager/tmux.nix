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
      set -g focus-events on
      set -g status-style bg=default
      set -g status-position top
      set -g status-left ""
      set -g status-right ""
      set -g status-justify centre
    '';
  };
}
