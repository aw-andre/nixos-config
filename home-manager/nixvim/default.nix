{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    performance = {
      byteCompileLua = {
        enable = true;
        configs = true;
        initLua = true;
        nvimRuntime = true;
        plugins = true;
      };
      combinePlugins = {
        enable = true;
        standalonePlugins = [
          "copilot.lua"
        ];
      };
    };
    colorschemes.vscode.enable = true;
    highlightOverride.Folded = {
      fg = "#D4D4D4";
      bg = "#1F1F1F";
    };
    globals = {
      mapleader = " ";
      maplocalleader = " ";
      have_nerd_font = true;
    };
    imports = [
      ./keymaps.nix
      ./options.nix
      ./autocmd.nix
      ./plugins
      ./ft
    ];
  };
}
