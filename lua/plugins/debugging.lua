return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "leoluz/nvim-dap-go",
    "rcarriga/nvim-dap-ui",
    "jonboh/nvim-dap-rr",
  },
  config = function()
    require("dapui").setup()
    require("dap-go").setup()

    local dap, dapui = require("dap"), require("dapui")
    local rr_dap = require("nvim-dap-rr")

    local cpptools_path = vim.fn.stdpath("data")
    .. "/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7"

    dap.adapters.cppdbg = {
      id = "cppdbg",
      type = "executable",
      command = cpptools_path,
    }

    dap.configurations.rust = { rr_dap.get_rust_config() }
    dap.configurations.cpp = { rr_dap.get_config() }

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
    vim.keymap.set("n", "<Leader>dt", ":DapToggleBreakpoint<CR>")
    vim.keymap.set("n", "<Leader>dc", ":DapContinue<CR>")
    vim.keymap.set("n", "<Leader>dx", ":DapTerminate<CR>")
    vim.keymap.set("n", "<Leader>do", ":DapStepOver<CR>")
  end,
}
