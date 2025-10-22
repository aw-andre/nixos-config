{
  plugins = {
    lsp.servers.gopls.enable = true;
    dap-go.enable = true;
    none-ls.sources = {
      formatting.gofmt.enable = true;
      diagnostics = {
        golangci_lint.enable = true;
        staticcheck.enable = true;
      };
    };
  };
}
