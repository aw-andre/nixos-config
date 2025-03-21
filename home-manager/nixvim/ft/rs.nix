{
  plugins = {
    dap-lldb.enable = true;
    lsp.servers.rust_analyzer = {
      enable = true;
      installCargo = true;
      installRustc = true;
      installRustfmt = true;
      settings = {
        cargo.buildScripts.enable = true;
        check.command = "clippy";
      };
    };
    neotest.adapters.rust.enable = true;
  };
}
