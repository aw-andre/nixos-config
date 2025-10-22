{
  plugins.none-ls = {
    enable = true;
    # enableLspFormat = true;
    settings.updateInInsert = false;
  };
  keymaps = [{
    mode = [ "n" "v" ];
    key = "=";
    action.__raw = "vim.lsp.buf.format";
    options = {
      silent = true;
      desc = "Format Buffer";
    };
  }];
  autoCmd = [{
    event = "BufWritePre";
    callback.__raw = "function () vim.lsp.buf.format() end";
    desc = "Format when writing text";
  }];
}
