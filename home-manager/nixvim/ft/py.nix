{
  plugins = {
    dap-python.enable = true;
    lsp.servers = {
      pyright.enable = true;
      ruff.enable = true;
    };
    none-ls.sources.formatting.black.enable = true;
  };
}
