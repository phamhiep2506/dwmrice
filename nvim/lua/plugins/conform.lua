return {
  "stevearc/conform.nvim",
  event = "VeryLazy",
  version = "7.1.0",
  opts = {
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
  },
}
