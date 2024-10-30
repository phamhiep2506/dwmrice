local hl = vim.api.nvim_set_hl
local autocmd = vim.api.nvim_create_autocmd

autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    hl(0, "Normal", { bg = "NONE" })
    hl(0, "NormalNC", { bg = "NONE" })
    hl(0, "CursorLine", { fg = "NONE", bg = "NONE" })
    hl(0, "CursorLineNR", { fg = "#fabd2f", bg = "NONE", bold = true })
  end,
})
