return {
  "lukas-reineke/indent-blankline.nvim",
  dependencies = {
    "echasnovski/mini.indentscope",
  },
  config = function()
    require("ibl").setup({
      indent = {
        char = "▏",
      },
      scope = {
        enabled = false,
      },
    })

    require("mini.indentscope").setup({
      symbol = "▎",
    })
  end,
}
