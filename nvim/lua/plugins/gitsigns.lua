return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  opts = {
    preview_config = {
      border = "rounded",
    },
  },
  config = function(_, opts)
    require("gitsigns").setup(opts)
  end,
}
