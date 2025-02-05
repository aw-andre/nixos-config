{ pkgs, lib, ... }:
{
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; }
        { name = "romkatv/powerlevel10k"; }
      ];
    };
  };
}
