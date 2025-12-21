let
  files = builtins.readDir ./.;

  nixFiles = map (name: ./. + "/${name}") (builtins.filter (name:
    name != builtins.baseNameOf
    (builtins.unsafeGetAttrPos "dummy" { dummy = null; }).file
    && builtins.match ".*\\.nix" name != null) (builtins.attrNames files));
in {
  imports = nixFiles;

  plugins = {
    direnv.enable = true;
    copilot-lua.enable = true;
    web-devicons.enable = true;
    which-key.enable = true;
    markdown-preview.enable = true;
    lz-n.enable = true;
  };
}
