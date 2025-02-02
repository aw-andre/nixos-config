{
  imports = [
    #./undotree.nix
    ./nvim-surround.nix
    ./oil.nix
    ./conform-nvim.nix
    ./neoscroll.nix
    ./dap.nix
    #./lint.nix
    ./lsp.nix
    ./telescope.nix
    ./nvim-ufo.nix
  ];
  plugins = {
    which-key.enable = true;
    blink-cmp.enable = true;
    comment.enable = true;
    lint.enable = true;
    treesitter.enable = true;
    markdown-preview.enable = true;
  };
}
