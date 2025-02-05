{
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
    # NOTE: .__raw here means that this field is raw lua code
    listchars.__raw = "{ tab = '» ', trail = '·', nbsp = '␣' }";

    # Tab defaults (might get overwritten by an LSP server)
    tabstop = 2;
    shiftwidth = 2;
    softtabstop = 0;
    expandtab = true;
    smarttab = true;

    # System clipboard support, needs xclip/wl-clipboard
    clipboard.providers.wl-copy.enable = true; # Wayland

    # Save undo history
    undofile = true;

    # Highlight the current line for cursor
    cursorline = true;

    # Show line and column when searching
    ruler = true;

    # Global substitution by default
    gdefault = true;

    # Start scrolling when the cursor is X lines away from the top/bottom
    scrolloff = 5;

    showmode = false;
    hlsearch = true;
    incsearch = true;
    wrap = true;
    breakindent = true;
    linebreak = true;
    virtualedit = "block";
    timeoutlen = 300;
    shada = "'1000,<100000,s100,h";
    #      fillchars = {
    #        eob = " ";
    #      };
  };
}
