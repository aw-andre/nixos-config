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
    zsh.initContent = ''
      FZF_CTRL_T_COMMAND='fd --type f --hidden --exclude .git .'
      FZF_ALT_C_COMMAND='fd --type d --hidden --exclude .git .'

      _fzf_compgen_path() {
        fd --type f --hidden --exclude .git . "$1"
      }
      _fzf_compgen_dir() {
        fd --type d --hidden --exclude .git . "$1"
      }
    '';
  };
}
