{
  plugins.neoscroll = {
    enable = true;
    lazyLoad.settings.lazy = true;
    settings = {
      easing_function = "quadratic";
      hide_cursor = false;
      mappings =
        [ "<C-u>" "<C-d>" "<C-b>" "<C-f>" "<C-y>" "<C-e>" "zt" "zz" "zb" ];
      respect_scrolloff = false;
      stop_eof = true;
    };
  };

  extraConfigLuaPost = ''
    if not vim.g.neovide then
      require('lz.n').trigger_load('neoscroll.nvim')
      require('neoscroll').setup({
        duration_multiplier = 0.2,
      })
    end
  '';
}
