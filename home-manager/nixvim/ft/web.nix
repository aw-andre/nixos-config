{ pkgs, ... }: {
  filetype.extension.j2 = "htmldjango";

  plugins = {
    lsp.servers = {
      #   html = {
      #     enable = true;
      #     filetypes = [ "html" "htmldjango" "jinja" ];
      #   };
      #   htmx.enable = true;

      jinja-lsp = {
        enable = true;
        package = pkgs.jinja-lsp;
        filetypes = [ "htmldjango" "jinja" ];
      };

      jsonls.enable = true;
      ts_ls.enable = true;

      phpactor.enable = true;
    };
    none-ls.sources.formatting = {
      djlint.enable = true;
      prettier = {
        enable = true;
        disableTsServerFormatter = true;
        settings.disabled_filetypes = [ "htmldjango" "jinja" ];
      };
    };
  };
}
