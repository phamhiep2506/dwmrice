return {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup({
      preview_config = {
        border = "rounded",
      },
    })

    local map = vim.keymap.set
    map("n", "<leader>hn", "<CMD>Gitsigns next_hunk<CR>")
    map("n", "<leader>hp", "<CMD>Gitsigns prev_hunk<CR>")
    map("n", "<leader>hP", "<CMD>Gitsigns preview_hunk<CR>")
    map("n", "<leader>hd", "<CMD>Gitsigns diffthis<CR>")
    map("n", "<leader>hb", "<CMD>Gitsigns blame_line<CR>")
  end,
}
