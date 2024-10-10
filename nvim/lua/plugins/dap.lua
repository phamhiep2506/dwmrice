return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "jay-babu/mason-nvim-dap.nvim",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")
    local vscode = require("dap.ext.vscode")
    local json = require("plenary.json")

    dapui.setup()

    -- Auto open & close dapui
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

    -- Auto setup adapters
    require("mason-nvim-dap").setup({
      handlers = {
        function(config)
          require("mason-nvim-dap").default_setup(config)
        end,
      },
    })

    -- Load launch.json
    vscode.json_decode = function(str)
      return vim.json.decode(json.json_strip_comments(str))
    end
    if vim.fn.filereadable(".vscode/launch.json") then
      vscode.load_launchjs()
    end

    local map = vim.keymap.set
    map("n", "<leader>dc", dap.continue)
    map("n", "<leader>db", dap.toggle_breakpoint)
    map("n", "<leader>ds", dap.terminate)
    map("n", "<leader>dr", dap.restart)
    map("n", "<leader>dO", dap.step_over)
    map("n", "<leader>di", dap.step_into)
    map("n", "<leader>do", dap.step_out)
    map("n", "<leader>de", dapui.eval)
  end,
}
