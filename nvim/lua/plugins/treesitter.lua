return {
  "nvim-treesitter/nvim-treesitter",
  tag = "v0.9.3",
  config = function()
    require("nvim-treesitter.configs").setup({
      auto_install = true,
      highlight = {
        enable = true,
      },
    })
  end,
}
