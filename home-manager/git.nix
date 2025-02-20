{
  programs.git = {
    enable = true;
    userName = "aw-andre";
    userEmail = "aw.andregerard@gmail.com";
    aliases = {
      basei = "rebase -i HEAD~10";
      loga = "log --oneline --graph --all";
      sets = "reset --soft";
      seth = "reset --hard";
    };
    extraConfig.core = {
      editor = "nvim";
      pager = "nvim +Man!";
    };
  };
}
