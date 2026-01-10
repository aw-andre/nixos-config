{
  plugins.smear-cursor = {
    enable = true;
    lazyLoad.settings.lazy = true;
    settings = {
      distance_stop_animating = 1.0e-2;
      stiffness = 0.6;
      trailing_stiffness = 0.3;
    };
  };

  extraConfigLuaPost = ''
    if vim.env.WAYLAND_DISPLAY == nil or vim.env.WAYLAND_DISPLAY == "wayland-0" then
      require('lz.n').trigger_load('smear-cursor.nvim')
    end
  '';
}
