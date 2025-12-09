return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "leoluz/nvim-dap-go", -- Especial para Go
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    require("dap-go").setup()
    dapui.setup()

    dap.listeners.before.attach.dapui_config = function() dapui.open() end
    dap.listeners.before.launch.dapui_config = function() dapui.open() end
    dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
    dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

    vim.keymap.set("n", "<leader>bp", dap.toggle_breakpoint, {desc = "Toggle Breakpoint"})
    vim.keymap.set("n", "<leader>dc", dap.continue, {desc = "Start/Continue Debug"})
  end,
}
