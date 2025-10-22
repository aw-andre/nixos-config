{
  plugins.copilot-chat = {
    enable = true;
    settings = {
      model = "grok-code-fast-1";
      context = "buffers";
      window.layout.__raw = ''
        string.find(
          vim.fn.system("hyprctl monitors -j | jq 'any(.transform == 3)'"),
          "true"
        )
        and
          "vertical"
        or
          "horizontal"
      '';
    };
  };
  keymaps = [{
    mode = "n";
    key = "<leader>c";
    action.__raw = "require('CopilotChat').toggle";
    options.desc = "Toggle Copilot [C]hat";
  }];
  autoCmd = [
    {
      event = "BufEnter";
      pattern = "copilot-chat";
      callback.__raw = ''
        function()
          vim.opt_local.relativenumber = true
          vim.opt_local.number = true
          vim.opt_local.conceallevel = 0
          vim.opt_local.signcolumn = "yes"
          vim.opt_local.foldcolumn = "0"
          vim.opt_local.cursorline = false
        end
      '';
      desc = "Configure CopilotChat buffer";
    }
    {
      event = "BufEnter";
      pattern = "copilot-overlay";
      callback.__raw = ''
        function()
          vim.opt_local.relativenumber = true
          vim.opt_local.number = true
          vim.opt_local.conceallevel = 0
          vim.opt_local.signcolumn = "yes"
          vim.opt_local.foldcolumn = "0"
          vim.opt_local.cursorline = false
        end
      '';
      desc = "Configure CopilotChat help buffer";
    }
  ];
}
