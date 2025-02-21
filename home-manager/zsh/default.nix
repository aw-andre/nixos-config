{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    sessionVariables = {
      PAGER = "nvim +Man!";
      MANPAGER = "nvim +Man!";
    };
    shellAliases = {
      cf = "cd ~/files/";
      cb = "cd ~/files/books/";
      cc = "cd ~/files/nixos-config/";
      cp = "cd ~/files/projects/";
      cs = "cd ~/files/school/";
      ct = "cd ~/files/temp/";
    };
    initExtra = builtins.readFile ./zshrc.zsh;
    plugins = [
      {
        name = "nix-shell";
        src = "${pkgs.zsh-nix-shell}/share/zsh-nix-shell";
      }
      {
        name = "you-should-use";
        src = "${pkgs.zsh-you-should-use}/share/zsh/plugins/you-should-use";
      }
      {
        name = "zsh-vi-mode";
        src = "${pkgs.zsh-vi-mode}/share/zsh-vi-mode";
      }
      {
        name = "powerlevel10k-config";
        src = ./.;
        file = "p10k.zsh";
      }
      {
        name = "zsh-powerlevel10k";
        src = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/";
        file = "powerlevel10k.zsh-theme";
      }
    ];
  };
}
