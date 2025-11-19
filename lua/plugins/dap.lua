
return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")

      -- Example: C/C++/Rust debugger (lldb)
      dap.adapters.lldb = {
        type = "executable",
        command = "/usr/bin/lldb-vscode", -- adjust if needed
        name = "lldb"
      }

      dap.configurations.cpp = {
        {
          name = "Launch",
          type = "lldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
      }

      -- Reuse cpp config for C and Rust
      dap.configurations.c = dap.configurations.cpp
      dap.configurations.rust = dap.configurations.cpp
    end,
  },

  -- Optional nice UI
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "nvim-neotest/nvim-nio" },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },

  -- Optional virtual text
  {
    "theHamsta/nvim-dap-virtual-text",
    config = true,
  },
}
