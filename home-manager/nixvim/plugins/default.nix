{
  imports = [
    #./undotree.nix
    #./nvim-surround.nix
    #./oil.nix
    ./conform-nvim.nix
    #./neoscroll.nix
    #./which-key.nix
    #./blink-cmp.nix
    #./comment.nix
    #./debug.nix
    #./lint.nix
    ./lsp.nix
    ./telescope.nix
    #./treesitter.nix
    ./nvim-ufo.nix
    #./markdown-preview.nix
  ];
  plugins = {
    #undotree.enable = true;
    nvim-surround.enable = true;
    oil.enable = true;
    #conform-nvim.enable = true;
    neoscroll.enable = true;
    which-key.enable = true;
    blink-cmp.enable = true;
    comment.enable = true;
    dap.enable = true;
    lint.enable = true;
    lsp.enable = true;
    treesitter.enable = true;
    markdown-preview.enable = true;
  };
}
