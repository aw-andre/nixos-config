{
  plugins.none-ls = {
    enable = true;
    # enableLspFormat = true;
    settings.updateInInsert = false;
  };

  keymaps = [{
    mode = [ "n" "v" ];
    key = "=";
    action.__raw = ''
      function()
        vim.lsp.buf.format()
        vim.cmd("Trim")
      end
    '';
    options = {
      silent = true;
      desc = "Format Buffer";
    };
  }];

  autoCmd = [{
    event = "BufWritePre";
    callback.__raw = "vim.lsp.buf.format";
    desc = "Format when writing text";
  }];
}
