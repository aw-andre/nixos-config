{
  plugins.conform-nvim = {
    enable = true;
    settings = {
      default_format_opts.quiet = true;
      formatters_by_ft = {
        bash = [ "shellfmt" ];
        c = [ "clang-format" ];
        lua = [ "stylua" ];
        nix = [ "nixpkgs_fmt" ];
        "*" = [ "codespell" ];
        "_" = [ "trim_whitespace" ];
      };
    };
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
