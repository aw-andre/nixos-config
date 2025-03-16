{
  plugins.neoscroll = {
    enable = true;
    luaConfig.pre = "require('neoscroll').setup({ duration_multiplier = 0.2 })";
    settings = {
      cursor_scrolls_alone = true;
      easing_function = "sine";
      hide_cursor = false;
      mappings = [
        "<C-u>"
        "<C-d>"
        "<C-b>"
        "<C-f>"
        "<C-y>"
        "<C-e>"
        "zt"
        "zz"
        "zb"
      ];
      respect_scrolloff = false;
      stop_eof = true;
    };
  };
}
