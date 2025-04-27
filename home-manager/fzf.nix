{
  programs = {
    fzf = {
      enable = true;
      enableZshIntegration = true;
      defaultCommand = "fd --type f --hidden --exclude .git";
      defaultOptions = [
        "--preview 'bat --style=numbers --color=always --line-range=:500 {}'"
      ];
    };
    zsh.initExtra = "FZF_CTRL_T_COMMAND='fd --type f --hidden --exclude .git'";
  };
}
