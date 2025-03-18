{
  plugins.blink-cmp = {
    enable = true;
    setupLspCapabilities = true;
    settings.sources = {
      default = [ "lsp" "path" "snippets" "buffer" ];
      providers = {
        buffer = {
          enabled = true;
          score_offset = -10;
        };
        lsp.enabled = true;
      };
    };
  };
  keymaps = [{
    mode = "c";
    key = "<C-S-i>";
    action.__raw = "require('blink.cmp').select_prev";
  }];
}
