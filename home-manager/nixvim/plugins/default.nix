{
  imports = [
    ./luasnip.nix
    ./none-ls.nix
    ./rainbow-delimiters.nix
    ./treesitter-context.nix
    ./nvim-surround.nix
    ./neoscroll.nix
    ./dap.nix
    ./lsp.nix
    ./telescope.nix
    ./nvim-ufo.nix
    ./lualine.nix
    ./blink-cmp.nix
    ./copilot-chat.nix
    ./oil.nix
    ./treesitter.nix
    ./yanky.nix
    ./obsidian.nix
  ];
  plugins = {
    direnv.enable = true;
    copilot-lua.enable = true;
    web-devicons.enable = true;
    which-key.enable = true;
    comment.enable = true;
    markdown-preview.enable = true;
    neotest.enable = true;
  };
}
