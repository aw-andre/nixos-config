{ pkgs, ... }: {
  plugins.rustaceanvim.enable = true;
  extraPackages = with pkgs; [ rustfmt ];
}
