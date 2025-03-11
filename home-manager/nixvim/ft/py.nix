{
  plugins = {
    dap-python.enable = true;
    lsp.servers.pyright.enable = true;
    none-ls.sources = {
      diagnostics.pylint.enable = true;
      formatting.black.enable = true;
    };
  };
}
