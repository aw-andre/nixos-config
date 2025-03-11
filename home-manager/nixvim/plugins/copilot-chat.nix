{
  plugins.copilot-chat.enable = true;
  keymaps = [
    {
      mode = "n";
      key = "<leader>c";
      action.__raw = "require('CopilotChat').toggle";
      options.desc = "Toggle Copilot [C]hat";
    }
  ];
}
