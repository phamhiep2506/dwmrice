return {
  "nvim-treesitter/nvim-treesitter",
  version = "0.9.3",
  event = "VeryLazy",
  opts = {
    auto_install = true,
    highlight = {
      enable = true,
    },
  },
  config = function (_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end
}
