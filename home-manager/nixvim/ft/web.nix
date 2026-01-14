{ pkgs, ... }: {
  filetype.extension.j2 = "html";
  plugins = {
    lsp.servers = {
      html = {
        enable = true;
        filetypes = [ "html" "htmldjango" "htmlangular" "htmlcheetah" ];
      };
      jinja-lsp = {
        enable = true;
        package = pkgs.jinja-lsp;
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
