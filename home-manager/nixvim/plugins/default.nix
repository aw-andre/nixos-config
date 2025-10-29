let
  # Read all files in the current directory
  files = builtins.readDir ./.;

  # Filter out default.nix and non-.nix files
  nixFiles = builtins.filter
    (name: name != "default.nix" && builtins.match ".*\\.nix" name != null)
    (builtins.attrNames files);

  # Create a list of import statements
  imports = map (name: ./. + "/${name}") nixFiles;
in {
  # Import all configuration modules automatically
  inherit imports;
  plugins = {
    direnv.enable = true;
    copilot-lua.enable = true;
    web-devicons.enable = true;
    which-key.enable = true;
    comment = {
      enable = true;
      settings = {
        opleader = {
          line = "gc";
          block = "gC";
        };
        toggler = {
          line = "gcc";
          block = "gCC";
        };
        extra = {
          above = "gcO";
          below = "gco";
          eol = "gcA";
        };
      };
      # luaConfig.post = ''
      #   vim.keymap.del("o", "gc")
      #   vim.keymap.del("o", "gC")
      # '';
    };
    markdown-preview.enable = true;
    lz-n.enable = true;
  };
}
