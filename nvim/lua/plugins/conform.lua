return {
  "stevearc/conform.nvim",
  config = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
      },
    })
  end,
}
