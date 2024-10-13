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
    map("n", "<leader>b.", "<CMD>bnext<CR>")
    map("n", "<leader>b,", "<CMD>bprevious<CR>")
    map("n", "<leader>bc", "<CMD>Bdelete<CR>")
  end,
}
