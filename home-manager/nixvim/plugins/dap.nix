{ pkgs, lib, ... }:
{
  plugins.dap = {
    enable = true;
    extensions = {
      dap-ui.enable = true;
      dap-virtual-text.enable = true;
      dap-python.enable = true;
    };
    adapters = {
      executables = {
        lldb.command = "${pkgs.lldb_19}/bin/lldb-dap";
      };
      # servers = {
      #   delve = {
      #     host = "127.0.0.1";
      #     port = "\${port}";
      #
      #     executable = {
      #       command = lib.getExe pkgs.delve;
      #       args = [
      #         "dap"
      #         "-l"
      #         "127.0.0.1:\${port}"
      #         "--log"
      #         "--log-output=dap"
      #       ];
      #     };
      #   };
      # };
    };

    configurations = {
      c = [
        {
          name = "lldb";
          type = "lldb";
          request = "launch";
          program.__raw = ''
            function()
                return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. '/', "file")
            end'';
        }
      ];
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<F4>";
      action.__raw = "function() require('dap').continue() end";
      options.desc = "Debug: Start/Continue";
    }
    {
      mode = "n";
      key = "<F1>";
      action.__raw = "function() require('dap').step_into() end";
      options.desc = "Debug: Step Into";
    }
    {
      mode = "n";
      key = "<F2>";
      action.__raw = "function() require('dap').step_over() end";
      options.desc = "Debug: Step Over";
    }
    {
      mode = "n";
      key = "<F3>";
      action.__raw = "function() require('dap').step_out() end";
      options.desc = "Debug: Step Out";
    }
    {
      mode = "n";
      key = "<leader>b";
      action.__raw = "function() require('dap').toggle_breakpoint() end";
      options.desc = "Debug: Toggle Breakpoint";
    }
    {
      mode = "n";
      key = "<leader>B";
      action.__raw = "function() require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ') end";
      options.desc = "Debug: Set Breakpoint";
    }
    {
      mode = "n";
      key = "<leader>d";
      action.__raw = "function() require('dapui').toggle() end";
      options.desc = "Debug: See last session result";
    }
  ];

  extraConfigLua = ''
    require('dap').listeners.after.event_initialized['dapui_config'] = require('dapui').open
    require('dap').listeners.before.event_terminated['dapui_config'] = require('dapui').close
    require('dap').listeners.before.event_exited['dapui_config'] = require('dapui').close
  '';
}
