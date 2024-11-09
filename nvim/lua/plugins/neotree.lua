return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      filesystem = {
        follow_current_file = { enabled = true },
      },
      enable_diagnostics = false,
      popup_border_style = "rounded",
    })

    local map = vim.keymap.set
    map("n", "<C-n>", "<CMD>Neotree toggle<CR>")
  end,
}
