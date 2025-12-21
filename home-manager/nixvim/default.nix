let
  files = builtins.readDir ./.;

  nixFiles = map (name: ./. + "/${name}") (builtins.filter (name:
    name != builtins.baseNameOf
    (builtins.unsafeGetAttrPos "dummy" { dummy = null; }).file
    && builtins.match ".*\\.nix" name != null) (builtins.attrNames files));
in {
  programs.nixvim = {
    imports = nixFiles ++ [ ./plugins ./ft ];

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
        standalonePlugins =
          [ "nvim-jdtls" "rustaceanvim" "copilot.lua" "blink.cmp" ];
      };
    };
    luaLoader.enable = true;
    clipboard = {
      providers.wl-copy.enable = true;
      register = "unnamedplus";
    };
    globals = {
      mapleader = " ";
      maplocalleader = " ";
      have_nerd_font = true;
    };
  };

  xdg = {
    desktopEntries.nvim = {
      name = "Neovim";
      exec = "kitty -e nvim %f";
      terminal = true;
      type = "Application";
      mimeType = [ "text/plain" ];
      categories = [ "Utility" "TextEditor" ];
    };
    desktopEntries.neovide = {
      name = "Neovide";
      exec = "neovide %f";
      terminal = true;
      type = "Application";
      mimeType = [ "text/plain" ];
      categories = [ "Utility" "TextEditor" ];
    };
    mimeApps.enable = true;
    mimeApps.defaultApplications = {
      "text/plain" = "neovide.desktop";
      "text/x-shellscript" = "neovide.desktop";
      "text/markdown" = "neovide.desktop";
      "application/x-shellscript" = "neovide.desktop";
    };
  };
}
