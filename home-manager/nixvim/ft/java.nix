{
  plugins = {
    jdtls = {
      enable = true;
      settings.cmd =
        [ "jdtls" "-data" "/home/andreaw/.cache/nvim/jdtls/workspace/" ];
    };
    none-ls.sources.formatting.google_java_format.enable = true;
  };
}
