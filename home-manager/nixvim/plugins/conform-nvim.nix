{
  plugins.conform-nvim = {
    enable = true;
    settings.default_format_opts.quiet = true;
  };
  keymaps = [
    {
      mode = "n";
      key = "=";
      action.__raw = "function() require('conform').format({ async = true, lsp_fallback = true }) end";
      options = { desc = "Format buffer"; };
    }
  ];
}
