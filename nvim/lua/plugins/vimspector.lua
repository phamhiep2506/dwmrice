return {
  "puremourning/vimspector",
  config = function()
    local map = vim.keymap.set
    map("n", "<leader>dc", "<Plug>VimspectorContinue")
    map("n", "<leader>ds", "<Plug>VimspectorStop")
    map("n", "<leader>dr", "<Plug>VimpectorRestart")
    map("n", "<leader>db", "<Plug>VimspectorToggleBreakpoint")
    map("n", "<leader>dO", "<Plug>VimspectorStepOver")
    map("n", "<leader>di", "<Plug>VimspectorStepInto")
    map("n", "<leader>do", "<Plug>VimspectorStepOut")
    map("n", "<leader>de", "<Plug>VimspectorBalloonEval")
  end,
}
