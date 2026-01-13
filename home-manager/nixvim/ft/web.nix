{
  plugins = {
    lsp.servers = {
      html = {
        enable = true;
        filetypes = [ "j2" "html" "htmldjango" "htmlangular" "htmlcheetah" ];
      };
      htmx.enable = true;
      jsonls.enable = true;
      ts_ls.enable = true;
      phpactor.enable = true;
    };
    none-ls.sources.formatting.prettier = {
      enable = true;
      disableTsServerFormatter = true;
    };
  };
}
