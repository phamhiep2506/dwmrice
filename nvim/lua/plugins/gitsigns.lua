return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  keys = {
    { "]g", "<CMD>Gitsigns next_hunk<CR>", desc = "Next hunk" },
    { "[g", "<CMD>Gitsigns prev_hunk<CR>", desc = "Previous hunk" },
    { "<leader>gp", "<CMD>Gitsigns preview_hunk<CR>", desc = "Preview hunk" },
    { "<leader>gd", "<CMD>Gitsigns diffthis<CR>", desc = "Show diff" },
    { "<leader>gd", "<CMD>Gitsigns diffthis<CR>", desc = "Show blame line" },
  },
  config = function()
    require("gitsigns").setup()
  end,
}
