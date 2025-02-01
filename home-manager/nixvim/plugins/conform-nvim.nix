{ pkgs, ... }:
{
  programs.nixvim = {
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
      };
    };
    keymaps = [
      {
        mode = "n";
        key = "=";
        action.__raw = "function() require('conform').format({ async = true, lsp_fallback = true }) end";
        options = {
          desc = "Format buffer";
        };
      }
    ];
  };
  home.packages = with pkgs; [
    shellharden
    llvmPackages_19.clang-unwrapped
    stylua
    nixfmt-rfc-style
    codespell
  ];
}
