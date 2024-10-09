return {
  "folke/flash.nvim",
  config = function()
    local map = vim.keymap.set
    map({ "n", "x" }, "s", function()
      require("flash").jump()
    end)
  end,
}
