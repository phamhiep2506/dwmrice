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
    map("n", "<A-.>", "<CMD>bnext<CR>")
    map("n", "<A-,>", "<CMD>bprevious<CR>")
    map("n", "<A-c>", "<CMD>Bdelete<CR>")
  end,
}
