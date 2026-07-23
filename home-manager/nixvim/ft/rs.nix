{
  plugins = {
    dap-lldb.enable = true;
    lsp.servers.rust_analyzer = {
      enable = true;
      package = null;
      settings = {
        cargo.buildScripts.enable = true;
        check.command = "clippy";
      };
    };
  };
}
