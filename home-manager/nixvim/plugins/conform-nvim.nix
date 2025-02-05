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
        python = [ "black" ];
        "*" = [ "codespell" ];
        "_" = [ "trim_whitespace" ];
      };
      formatters = {
        shellharden.command = lib.getExe pkgs.shellharden;
        clang-format.command = lib.getExe pkgs.llvmPackages_19.clang-unwrapped;
        stylua.command = lib.getExe pkgs.stylua;
        nixfmt.command = lib.getExe pkgs.nixfmt-rfc-style;
        black.command = lib.getExe pkgs.black;
        codespell.command = lib.getExe pkgs.codespell;
      };
      format_after_save = # Lua
        ''
          function(bufnr)
            if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
              return
            end

            return { lsp_fallback = true }
          end
        '';
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
