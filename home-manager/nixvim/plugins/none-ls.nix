{
  plugins.none-ls = {
    enable = true;
    enableLspFormat = true;
    settings.updateInInsert = false;
    sources.completion.luasnip.enable = true;
  };
  keymaps = [
    {
      mode = [
        "n"
        "v"
      ];
      key = "=";
      action.__raw = "vim.lsp.buf.format";
      options = {
        silent = true;
        desc = "Format Buffer";
      };
    }
  ];
}
