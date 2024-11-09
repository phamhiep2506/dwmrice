return {
  "nvim-telescope/telescope.nvim",
  dependencies = "nvim-lua/plenary.nvim",
  config = function()
    require("telescope").setup({
      defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
      },
    })

    local map = vim.keymap.set
    map("n", "<leader>ff", "<CMD>Telescope find_files<CR>")
    map("n", "<leader>fg", "<CMD>Telescope live_grep<CR>")
    map("n", "<leader>fb", "<CMD>Telescope buffers<CR>")
    map("n", "<leader>fc", "<CMD>Telescope commands<CR>")
  end,
}
