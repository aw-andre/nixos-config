{
  plugins.oil = {
    enable = true;
    settings = {
      delete_to_trash = true;
      experimental_watch_for_changes = true;
      view_options.show_hidden = true;
    };
  };
  keymaps = [{
    mode = "n";
    key = "-";
    action.__raw = "require('oil').open";
    options.desc = "Open File Explorer";
  }];
}
