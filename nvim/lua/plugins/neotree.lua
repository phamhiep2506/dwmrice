return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { "<C-n>", "<CMD>Neotree toggle<CR>", desc = "Explorer toggle" },
  },
  opts = {
    filesystem = {
      follow_current_file = { enabled = true },
    },
  },
}
