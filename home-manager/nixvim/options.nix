{
  colorschemes.gruvbox = {
    enable = true;
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

  opts = {
    number = true;
    relativenumber = true;

    signcolumn = "yes";

    mouse = "a";

    ignorecase = true;
    smartcase = true;

    splitright = true;
    splitbelow = true;

    list = true;
    listchars.__raw = "{ tab = '» ', trail = '·', nbsp = '␣' }";
    fillchars.__raw = "{ eob = ' ' }";

    tabstop = 2;
    shiftwidth = 2;
    softtabstop = 0;
    expandtab = true;
    smarttab = true;

    conceallevel = 0;

    undofile = true;

    ls = 0;
    statusline = "%{repeat('─',winwidth('.'))}";
    winborder = "rounded";

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
    linespace = 17;
    guifont = "Comic Code:h17";

    exrc = true;
    secure = true;

    grepprg = "rg --vimgrep --hidden --smart-case";
  };

  globals = {
    neovide_normal_opacity = 0.7;
    neovide_hide_mouse_when_typing = true;
  };
}
