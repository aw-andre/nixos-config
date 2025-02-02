{ pkgs, lib, ... }:
{
  plugins.conform-nvim = {
    enable = true;
    settings = {
      default_format_opts.quiet = true;
      formatters_by_ft = {
        bash = [ "shellharden" ];
        c = [ "clang-format" ];
        lua = [ "stylua" ];
        nix = [ "nixfmt" ];
        "*" = [ "codespell" ];
        "_" = [ "trim_whitespace" ];
      };
      formatters = {
        shellharden.command = lib.getExe pkgs.shellharden;
        clang-format.command = lib.getExe pkgs.llvmPackages_19.clang-unwrapped;
        stylua.command = lib.getExe pkgs.stylua;
        nixfmt.command = lib.getExe pkgs.nixfmt-rfc-style;
        codespell.command = lib.getExe pkgs.codespell;
      };
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "=";
      action.__raw = "function() require('conform').format({ async = true, lsp_fallback = true }) end";
      options.desc = "Format buffer";
    }
  ];
}
