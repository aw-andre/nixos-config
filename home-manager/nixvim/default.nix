{
  programs.nixvim = {
    enable = true;
    vimAlias = true;
    colorschemes.vscode.enable = true;
    globals.mapleader = " ";
    imports = [
      #./keymaps.nix
      ./options.nix
      #./plugins.nix
    ];
  };
}
