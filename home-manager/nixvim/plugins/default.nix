{
  imports = [
    ./nvim-surround.nix
    ./oil.nix
    ./conform-nvim.nix
    ./neoscroll.nix
    ./dap.nix
    ./lint.nix
    ./lsp.nix
    ./telescope.nix
    ./nvim-ufo.nix
    ./auto-hlsearch.nix
    ./lualine.nix
    ./blink-cmp.nix
  ];
  plugins = {
    web-devicons.enable = true;
    which-key.enable = true;
    comment.enable = true;
    treesitter.enable = true;
    markdown-preview.enable = true;
  };
}
