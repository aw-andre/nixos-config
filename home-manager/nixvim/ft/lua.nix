{
  plugins = {
    lsp.servers.lua_ls.enable = true;
    none-ls.sources = {
      diagnostics.selene.enable = true;
      formatting.stylua.enable = true;
    };
  };
}
