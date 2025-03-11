{
  plugins.blink-cmp = {
    enable = true;
    settings.sources.providers = {
      buffer = {
        enabled = true;
        score_offset = -10;
      };
      lsp.enabled = true;
    };
  };
}
