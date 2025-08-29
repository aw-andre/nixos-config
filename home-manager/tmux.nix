{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    prefix = "Delete";
    mouse = true;
    plugins = with pkgs.tmuxPlugins; [ yank ];
  };
}
