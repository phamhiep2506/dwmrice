return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup()

    local map = vim.keymap.set
    map("n", "<leader>gn", "<CMD>Gitsigns next_hunk<CR>")
    map("n", "<leader>gp", "<CMD>Gitsigns prev_hunk<CR>")
    map("n", "<leader>gP", "<CMD>Gitsigns preview_hunk<CR>")
    map("n", "<leader>gd", "<CMD>Gitsigns diffthis<CR>")
    map("n", "<leader>gb", "<CMD>Gitsigns blame_line<CR>")
  end,
}
