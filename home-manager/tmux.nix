{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    prefix = "Delete";
    mouse = true;
    terminal = "tmux-256color";
    plugins = with pkgs.tmuxPlugins; [ yank ];
    extraConfig = ''
      set -ga terminal-overrides ',xterm-256color:Tc'
    '';
  };
}
