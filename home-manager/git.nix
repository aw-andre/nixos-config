{
  programs.git = {
    enable = true;
    userName = "aw-andre";
    userEmail = "aw.andregerard@gmail.com";
    aliases = {
      rebasei = "rebase -i HEAD~10";
      loga = "log --oneline --graph --all";
      resets = "reset --soft";
      reseth = "reset --hard";
      pushm = "push origin master";
      pushmf = "push --force origin master";
    };
    extraConfig.core = {
      editor = "nvim";
      pager = "nvim +Man!";
    };
  };
}
