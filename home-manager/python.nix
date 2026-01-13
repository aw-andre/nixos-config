{ pkgs, ... }: {
  home = {
    packages = with pkgs.python313Packages; [ ipython python ];
    file."ipython_config.py" = {
      text = ''
        c = get_config()
        c.TerminalInteractiveShell.editing_mode = 'vi'
        c.TerminalInteractiveShell.confirm_exit = False
        c.TerminalInteractiveShell.autoindent = True
        c.TerminalInteractiveShell.highlight_matching_brackets = True
        c.TerminalInteractiveShell.display_page = True
      '';
      target = ".ipython/profile_default/ipython_config.py";
    };
  };
}
