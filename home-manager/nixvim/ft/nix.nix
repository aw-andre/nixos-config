{
  plugins = {
    lsp.servers.nixd.enable = true;
    none-ls.sources = {
      code_actions.statix.enable = true;
      diagnostics.statix.enable = true;
      formatting.nixpkgs_fmt.enable = true;
    };
  };
}
