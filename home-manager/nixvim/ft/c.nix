{
  plugins = {
    dap-lldb.enable = true;
    lsp.servers.clangd.enable = true;
    none-ls.sources = {
      diagnostics.cppcheck.enable = true;
      formatting.clang_format.enable = true;
    };
  };
}
