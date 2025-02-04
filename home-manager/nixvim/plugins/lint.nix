{ pkgs, lib, ... }:
{
  plugins.lint = {
    enable = true;
    lintersByFt = {
      bash = [ "shellcheck" ];
      c = [ "cppcheck" ];
      lua = [ "luacheck" ];
      nix = [ "statix" ];
      python = [ "ruff" ];
    };
    linters = {
      shellcheck.command = lib.getExe pkgs.shellcheck;
      cppcheck.command = lib.getExe pkgs.cppcheck;
      luacheck.command = lib.getExe pkgs.luajitPackages.luacheck;
      statix.command = lib.getExe pkgs.statix;
      ruff.command = lib.getExe pkgs.ruff;
    };
  };
}
