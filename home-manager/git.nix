{
  programs.git = {
    enable = true;
    userName = "aw-andre";
    userEmail = "aw.andregerard@gmail.com";
    aliases = {
      la = "log --oneline --graph --all";
      pf = "push --force origin master";
      ps = "push origin master";
      rh = "reset --hard";
      ri = "rebase -i HEAD~10";
      rs = "reset --soft";
    };
    extraConfig.core = {
      editor = "nvim";
      pager = "nvim +Man!";
    };
  };
}
