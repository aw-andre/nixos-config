{
  programs.git = {
    enable = true;
    user = {
      name = "aw-andre";
      email = "aw.andregerard@gmail.com";
    };
    settings = {
      alias = {
        la = "log --oneline --graph --all";
        pf = "push --force origin master";
        ps = "push origin master";
        rh = "reset --hard";
        ri = "rebase -i HEAD~10";
        rs = "reset --soft";
      };
      core = {
        editor = "nvim";
        pager = "vimp";
      };
      pull.rebase = false;
    };
  };
}
