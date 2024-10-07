return {
  "sainnhe/gruvbox-material",
  config = function()
    vim.g.gruvbox_material_foreground = "original"
    vim.g.gruvbox_material_background = "hard"
    vim.g.gruvbox_material_visual = "reverse"
    vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
    vim.g.gruvbox_material_enable_bold = true
    vim.g.gruvbox_material_enable_italic = true
    vim.g.gruvbox_material_better_performance = true
    vim.cmd.colorscheme("gruvbox-material")
  end,
}
