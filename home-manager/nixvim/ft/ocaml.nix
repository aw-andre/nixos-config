{
  plugins = {
    lsp.servers.ocamllsp.enable = true;
    none-ls.sources.formatting.ocamlformat = {
      enable = true;
      settings.extra_filetypes = [ "ml" "mli" ];
    };
  };
}
