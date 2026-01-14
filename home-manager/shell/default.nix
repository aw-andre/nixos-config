{ pkgs, ... }: {
  home.packages = with pkgs; [
    (writeShellScriptBin "fork" (builtins.readFile ./fork))
    (writeShellScriptBin "bfork" (builtins.readFile ./bfork))
    (writeShellScriptBin "gui" (builtins.readFile ./gui))
    (writeShellScriptBin "rotate" (builtins.readFile ./rotate))
    (writeShellScriptBin "unrotate" (builtins.readFile ./unrotate))
    (writeShellScriptBin "vimp" (builtins.readFile ./vimp))
    (writeShellScriptBin "vimpage" (builtins.readFile ./vimpage))
    (writeShellScriptBin "vimt" (builtins.readFile ./vimt))
    (writeShellScriptBin "winreset" (builtins.readFile ./winreset))
    (writeShellScriptBin "close" (builtins.readFile ./close))

    (writeShellScriptBin "maintty" ''fork -w 1 kitty "$@"'')
    (writeShellScriptBin "alttty" ''fork -w 3 kitty "$@"'')
    (writeShellScriptBin "vid" ''fork -w 2 neovide --no-tabs "$@"'')
    (writeShellScriptBin "gem" ''fork -w 4 gemini "$@"'')
  ];

  programs.zsh = {
    enable = true;
    syntaxHighlighting = {
      enable = true;
      styles = {
        "single-hyphen-option" = "fg=cyan";
        "double-hyphen-option" = "fg=cyan";
      };
    };
    shellAliases = {
      cdf = "cd $fl";
      cdb = "cd $bk";
      cdc = "cd $cf";
      cdp = "cd $pj";
      cds = "cd $sl";
      cdt = "cd $tp";
      cdg = "cd $gm";
      cdd = "cd $ds";
      cdm = "cd $ms";
    };
    initContent = builtins.readFile ./zshrc.zsh;
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
        src = ./p10kconfig;
        file = "p10kconfig.zsh";
      }
      {
        name = "zsh-powerlevel10k";
        src = "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/";
        file = "powerlevel10k.zsh-theme";
      }
    ];
  };
}
