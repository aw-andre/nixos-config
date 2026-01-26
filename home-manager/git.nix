{
  programs.git = {
    enable = true;
    lfs.enable = true;
    userName = "aw-andre";
    userEmail = "aw.andregerard@gmail.com";
    settings = {
      alias = {
        la = "log --oneline --graph --all";
        lg = "log --graph --all";
      };
      core = {
        editor = "nvim";
        pager = "vimpage";
      };
      pull.rebase = true;
    };
  };
}
