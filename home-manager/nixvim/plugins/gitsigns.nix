{
  plugins.gitsigns.enable = true;
  keymaps = [
    {
      mode = "n";
      key = "]h";
      action.__raw = "require('gitsigns').next_hunk";
      options.desc = "Go to Next Git [H]unk";
    }
    {
      mode = "n";
      key = "[h";
      action.__raw = "require('gitsigns').prev_hunk";
      options.desc = "Go to Prev Git [H]unk";
    }
  ];
}
