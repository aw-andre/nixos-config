{
  imports = [
    #./undotree.nix
    ./nvim-surround.nix
    ./oil.nix
    ./conform-nvim.nix
    ./neoscroll.nix
    #./debug.nix
    #./lint.nix
    ./lsp.nix
    ./telescope.nix
    #./treesitter.nix
    ./nvim-ufo.nix
    #./markdown-preview.nix
  ];
  programs.nixvim.plugins = {
    which-key.enable = true;
    blink-cmp.enable = true;
    comment.enable = true;
    dap.enable = true;
    lint.enable = true;
    treesitter.enable = true;
    markdown-preview.enable = true;
  };
}
