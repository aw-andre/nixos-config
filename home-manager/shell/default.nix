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
    (writeShellScriptBin "flb" ''fork -w 3 lldb "$@"'')
    (writeShellScriptBin "fgm" ''fork -w 4 gemini "$@"'')
    (writeShellScriptBin "fqb" ''fork -w 5 qutebrowser "$@"'')
    (writeShellScriptBin "ftd" ''
      fork -w 6 google-chrome-stable --new-window "https://docs.google.com/document/d/1O2rcDO70BamTERrKhJRLODarNCQOHQWUweNdSfLw-So/edit?usp=sharing&resourcekey=0-gWJkSd-tlpCmk2lok1UcPg"'')
    (writeShellScriptBin "fdc"
      ''fork -w 7 google-chrome-stable --new-window "discord.com/app"'')
    (writeShellScriptBin "fwa"
      ''fork -w 8 google-chrome-stable --new-window "web.whatsapp.com"'')
    (writeShellScriptBin "fut"
      ''fork -w 9 google-chrome-stable --new-window "utoronto.ca"'')
    (writeShellScriptBin "fyt"
      ''fork -w 10 google-chrome-stable --new-window "youtube.com"'')

    (writeShellScriptBin "btm" ''bfork -w 1 kitty "$@"'')
    (writeShellScriptBin "bvm" ''bfork -w 2 vim "$@"'')
    (writeShellScriptBin "bvd" ''bfork -w 2 neovide "$@"'')
    (writeShellScriptBin "blb" ''bfork -w 3 lldb "$@"'')
    (writeShellScriptBin "bgm" ''bfork -w 4 gemini "$@"'')
    (writeShellScriptBin "bqb" ''bfork -w 5 qutebrowser "$@"'')
    (writeShellScriptBin "btd" ''
      bfork -w 6 google-chrome-stable --new-window "https://docs.google.com/document/d/1O2rcDO70BamTERrKhJRLODarNCQOHQWUweNdSfLw-So/edit?usp=sharing&resourcekey=0-gWJkSd-tlpCmk2lok1UcPg"'')
    (writeShellScriptBin "bdc"
      ''bfork -w 7 google-chrome-stable --new-window "discord.com/app"'')
    (writeShellScriptBin "bwa"
      ''bfork -w 8 google-chrome-stable --new-window "web.whatsapp.com"'')
    (writeShellScriptBin "but"
      ''bfork -w 9 google-chrome-stable --new-window "utoronto.ca"'')
    (writeShellScriptBin "byt"
      ''bfork -w 10 google-chrome-stable --new-window "youtube.com"'')

    (writeShellScriptBin "vid" ''fork -w 2 neovide "$@"'')
    (writeShellScriptBin "kit" ''fork -w 3 kitty "$@"'')
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
      cdr = "cd ~/files/projects/carbon/carbon-lang/";
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
