{ pkgs, ... }: {
  home.packages = with pkgs; [
    (writeShellScriptBin "rebuild" (builtins.readFile ./rebuild.bash))
    (writeShellScriptBin "fork" (builtins.readFile ./fork.bash))
    (writeShellScriptBin "bfork" (builtins.readFile ./bfork.bash))
    (writeShellScriptBin "gui" (builtins.readFile ./gui.bash))
    (writeShellScriptBin "vimp" ''
      nvim -c "silent! w! /tmp/vimp | exec 'te cat /tmp/vimp -' | bn | bd!"
    '')
    (writeShellScriptBin "vimt" ''
      nvim -c "silent! w! /tmp/vimt | set nowrap"
    '')

    (writeShellScriptBin "ftm" ''fork -w 1 kitty "$@"'')
    (writeShellScriptBin "fvm" ''fork -w 2 vim "$@"'')
    (writeShellScriptBin "fvd" ''fork -w 2 neovide "$@"'')
    (writeShellScriptBin "fgm" ''fork -w 3 gemini "$@"'')
    (writeShellScriptBin "fqb" ''fork -w 4 qutebrowser "$@"'')
    (writeShellScriptBin "fgc" ''fork -w 7 google-chrome-stable "$@"'')

    (writeShellScriptBin "btm" ''bfork -w 1 kitty "$@"'')
    (writeShellScriptBin "bvm" ''bfork -w 2 vim "$@"'')
    (writeShellScriptBin "bvd" ''bfork -w 2 neovide "$@"'')
    (writeShellScriptBin "bgm" ''bfork -w 3 gemini "$@"'')
    (writeShellScriptBin "bqb" ''bfork -w 4 qutebrowser "$@"'')
    (writeShellScriptBin "bgc" ''bfork -w 7 google-chrome-stable "$@"'')

    (writeShellScriptBin "vid" ''fork -w 2 neovide "$@"'')
  ];

  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      cdf = "cd ~/files/";
      cdb = "cd ~/files/books/";
      cdc = "cd ~/files/configs/laptop-config/";
      cdp = "cd ~/files/projects/";
      cds = "cd ~/files/school/";
      cdt = "cd ~/files/temp/";
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
