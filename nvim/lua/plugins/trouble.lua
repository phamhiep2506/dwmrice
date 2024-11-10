return {
  "folke/trouble.nvim",
  config = function()
    require("trouble").setup()

    local map = vim.keymap.set
    map("n", "<leader>q", "<CMD>Trouble diagnostics toggle filter.buf=0<CR>")
  end,
}
