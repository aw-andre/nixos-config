{ pkgs, lib, ... }:
{
  plugins.conform-nvim = {
    enable = true;
    settings = {
      default_format_opts.quiet = true;
      formatters_by_ft = {
        bash = [ "shfmt" ];
        c = [ "clang-format" ];
        lua = [ "stylua" ];
        nix = [ "nixfmt" ];
        python = [ "black" ];
        "_" = [ "trim_whitespace" ];
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
  extraPackages = with pkgs; [
    shfmt
    llvmPackages_19.clang-unwrapped
    stylua
    nixfmt-rfc-style
    black
  ];
  keymaps = [
    {
      mode = "n";
      key = "=";
      action.__raw = "function() require('conform').format({ async = true, lsp_fallback = true }) end";
      options.desc = "Format buffer";
    }
  ];
}
