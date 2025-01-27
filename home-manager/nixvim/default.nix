{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
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
