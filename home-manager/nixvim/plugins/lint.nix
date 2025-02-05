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
  };
  extraPackages = with pkgs; [
    shellcheck
    cppcheck
    luajitPackages.luacheck
    statix
    ruff
  ];
}
