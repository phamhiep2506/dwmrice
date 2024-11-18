return {
  "nvim-treesitter/nvim-treesitter",
  event = "VeryLazy",
  version = "0.9.3",
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
