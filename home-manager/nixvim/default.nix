{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    colorschemes.vscode.enable = true;
    globals = {
      mapleader = " ";
      maplocalleader = " ";
      have_nerd_font = true;
    };
    imports = [
      #./keymaps.nix
      ./options.nix
      #./plugins.nix
    ];
  };
}
