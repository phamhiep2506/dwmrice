return {
  "lewis6991/gitsigns.nvim",
  config = function()
    local gitsigns = require('gitsigns')

    gitsigns.setup({
      preview_config = {
        border = "rounded",
      },
    })

    local map = vim.keymap.set
    map("n", "<leader>g]", gitsigns.next_hunk)
    map("n", "<leader>g[", gitsigns.prev_hunk)
    map("n", "<leader>gp", gitsigns.preview_hunk)
    map("n", "<leader>gd", gitsigns.diffthis)
    map("n", "<leader>gb", gitsigns.blame_line)
  end,
}
