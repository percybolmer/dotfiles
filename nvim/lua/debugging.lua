-- fetch the dap plugin
local dap = require('dap')
-- Setup DapUI
local dapui = require('dapui')
local nvimtree = require('nvim-tree')
-- set it up see more configs in their repo
dapui.setup()

-- dap fires events, we can listen on them to open UI on certain events
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
  nvimtree.toggle()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  nvimtree.toggle()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  nvimtree.toggle()
  dapui.close()
end

-- Add adapter to delve
dap.adapters.delve = {
  type = 'server',
  port = '${port}',
  executable = {
    command = 'dlv',
    args = {'dap', '-l', '127.0.0.1:${port}'},
  }
}

-- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
  {
    type = "delve",
    name = "Debug",
    request = "launch",
    program = "${file}"
  },
  {
    type = "delve",
    name = "Debug test", -- configuration for debugging test files
    request = "launch",
    mode = "test",
    program = "${file}"
  },
  -- works with go.mod packages and sub packages 
  {
    type = "delve",
    name = "Debug test (go.mod)",
    request = "launch",
    mode = "test",
    program = "./${relativeFileDirname}"
  } 
}
