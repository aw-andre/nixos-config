{
    plugins.oil.enable = true;
    keymaps = [
      {
        mode = "n";
        key = "-";
        action.__raw = "require('oil').open";
        options.desc = "Open File Explorer";
      }
    ];
}
