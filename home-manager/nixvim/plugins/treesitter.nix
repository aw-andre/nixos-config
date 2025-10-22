{
  plugins.treesitter = {
    enable = true;
    settings = {
      highlight.enable = true;
      incremental_selection = {
        enable = true;
        keymaps = {
          init_selection = "gin";
          node_incremental = "giu";
          node_decremental = "gid";
          scope_incremental = "gis";
        };
        indent.enable = true;
      };
    };
  };
}
