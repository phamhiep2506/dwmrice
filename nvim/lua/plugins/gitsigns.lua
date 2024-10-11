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
    map("n", "]h", gitsigns.next_hunk)
    map("n", "[h", gitsigns.prev_hunk)
    map("n", "<leader>hp", gitsigns.preview_hunk)
    map("n", "<leader>hd", gitsigns.diffthis)
    map("n", "<leader>hb", gitsigns.blame_line)
  end,
}
