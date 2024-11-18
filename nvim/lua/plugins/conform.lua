return {
  "stevearc/conform.nvim",
  tag = "v7.1.0",
  config = function()
    require("conform").setup({
      default_format_opts = {
        timeout_ms = "5000",
      },
      formatters_by_ft = {
        lua = { "stylua" },
        c = { "clang-format" },
        cpp = { "clang-format" },
        cs = { "csharpier" },
        cmake = { "cmake_format" },
        html = { "prettier" },
        css = { "prettier" },
        sass = { "prettier" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        python = { "black" },
        kotlin = { "ktfmt" },
      },
    })
  end,
}
