{
  plugins = {
    dap-lldb.enable = true;
    lsp.servers.rust_analyzer = {
      enable = true;
      installCargo = true;
      installRustc = true;
      installRustfmt = true;
      settings.check.command = "clippy";
    };
  };
}
