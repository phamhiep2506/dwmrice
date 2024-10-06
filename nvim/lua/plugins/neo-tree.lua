vim.api.nvim_set_hl(0, "NeoTreeNormal", {bg = "#000000"})
vim.api.nvim_set_hl(0, "NeoTreeNormalNC", {bg = "#000000"})
vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", {bg = "#000000"})
return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { "<C-n>", "<CMD>Neotree toggle<CR>", desc = "Neotree Toggle" },
  },
  config = function()
  end,
}
