{
  colorschemes.gruvbox = {
    enable = true;
    # settings.transparent_mode.__raw = "not vim.g.neovide";
    settings.transparent_mode = true;
  };
  highlightOverride = {
    folded.link = "Normal";
    error.link = "GruvboxRedBold";
    todo.link = "GruvboxYellowBold";
    diagnosticdeprecated.link = "DiagnosticUnderlineHint";
    pmenu.link = "Normal";
    pmenuthumb.link = "Normal";
    pmenusbar.link = "Normal";
    statusline.link = "Normal";
    statuslinenc.link = "Normal";
    telescopeselection.link = "Normal";
    copilotchatannotation.link = "Normal";
    copilotchatannotationheader.link = "GruvboxAqua";
  };
  # highlightOverride =
  #   let normtmp = "vim.api.nvim_get_hl(0, { name = 'normal' }).bg";
  #   in {
  #     folded.link = "Normal";
  #     signcolumn.bg.__raw = "vim.api.nvim_get_hl(0, { name = 'linenr' }).bg";
  #     comment.fg.__raw = "vim.api.nvim_get_hl(0, { name = 'string' }).fg";
  #     error = {
  #       fg.__raw = "vim.api.nvim_get_hl(0, { name = 'error' }).bg";
  #       bg.__raw = normtmp;
  #       bold = true;
  #     };
  #     todo = {
  #       fg.__raw = "vim.api.nvim_get_hl(0, { name = 'todo' }).bg";
  #       bg.__raw = normtmp;
  #       bold = true;
  #     };
  #     diagnosticsignerror.link = "diagnosticerror";
  #     diagnosticsignwarn.link = "diagnosticwarn";
  #     diagnosticsigninfo.link = "diagnosticinfo";
  #     diagnosticsignhint.link = "diagnostichint";
  #     normalfloat.link = "Normal";
  #     pmenu.link = "Normal";
  #   };

  opts = {
    # Line numbers
    number = true;
    relativenumber = true;

    # Always show the signcolumn, otherwise text would be shifted when displaying error icons
    signcolumn = "yes";

    # Enable mouse
    mouse = "a";

    # Search
    ignorecase = true;
    smartcase = true;

    # Configure how new splits should be opened
    splitright = true;
    splitbelow = true;

    list = true;
    listchars.__raw = "{ tab = '» ', trail = '·', nbsp = '␣' }";
    fillchars.__raw = "{ eob = ' ' }";

    # Tab defaults (might get overwritten by an LSP server)
    tabstop = 2;
    shiftwidth = 2;
    softtabstop = 0;
    expandtab = true;
    smarttab = true;

    # Matchpairs
    matchpairs = "(:),[:],{:},<:>";

    conceallevel = 0;

    # Save undo history
    undofile = true;

    # Highlight the current line for cursor
    # cursorline = true;
    ls = 0;
    statusline = "%{repeat('─',winwidth('.'))}";

    # Show line and column when searching
    # ruler = true;

    # Start scrolling when the cursor is X lines away from the top/bottom
    scrolloff = 10;

    hlsearch = true;
    incsearch = true;
    wrap = true;
    breakindent = true;
    linebreak = true;
    virtualedit = "block";
    timeoutlen = 300;
    shada = "'1000,<100000,s100,h";

    # neovide
    linespace = 14;
    guifont = "Comic Code:h14";
  };

  globals = {
    # neovide_opacity = 0.5;
    neovide_normal_opacity = 0.7;
    neovide_hide_mouse_when_typing = true;
    neovide_padding_top = 2;
    neovide_padding_bottom = 2;
  };
}
