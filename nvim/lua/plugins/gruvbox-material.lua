return {
  "sainnhe/gruvbox-material",
  config = function()
    local g = vim.g
    g.gruvbox_material_foreground = "original"
    g.gruvbox_material_background = "hard"
    g.gruvbox_material_diagnostic_virtual_text = "colored"
    g.gruvbox_material_enable_bold = true
    g.gruvbox_material_enable_italic = true
    g.gruvbox_material_better_performance = true
    vim.cmd.colorscheme("gruvbox-material")
  end,
}
