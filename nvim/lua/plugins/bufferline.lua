return {
  "akinsho/bufferline.nvim",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    require("bufferline").setup({
      options = {
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            text_align = "center",
            separator = true,
          },
        },
      },
    })

    local map = vim.keymap.set
    map("n", "<A-.>", "<CMD>BufferLineCycleNext<CR>")
    map("n", "<A-,>", "<CMD>BufferLineCyclePrev<CR>")
    map("n", "<A->>", "<CMD>BufferLineMoveNext<CR>")
    map("n", "<A-<>", "<CMD>BufferLineMovePrev<CR>")
    map("n", "<A-c>", "<CMD>BufferLinePickClose<CR>")
  end,
}
