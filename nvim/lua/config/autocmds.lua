local hl = vim.api.nvim_set_hl
local autocmd = vim.api.nvim_create_autocmd

-- ColorScheme
autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    hl(0, "Normal", { bg = "#000000" })
    hl(0, "NormalNC", { bg = "#000000" })
    hl(0, "CursorLine", { fg = "NONE", bg = "NONE" })
    hl(0, "CursorLineNR", { fg = "#d79921", bg = "NONE", bold = true })
  end,
})

-- Float
autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    hl(0, "NormalFloat", { bg = "#000000" })
    hl(0, "FloatBorder", { bg = "#000000" })
  end,
})

-- NeoTree
autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    hl(0, "NeoTreeNormal", { bg = "#000000" })
    hl(0, "NeoTreeNormalNC", { bg = "#000000" })
    hl(0, "NeoTreeEndOfBuffer", { bg = "#000000" })
  end,
})

-- Lsp
autocmd("LspAttach", {
  callback = function(args)
    local opts = { silent = true, buffer = args.buf }
    local map = vim.keymap.set
    local lsp = vim.lsp.buf

    map("n", "gd", lsp.definition, opts)
    map("n", "gi", lsp.implementation, opts)
    map("n", "gr", lsp.references, opts)
    map("n", "<leader>sh", lsp.signature_help, opts)
    map("n", "<leader>ca", lsp.code_action, opts)
    map("n", "<leader>h", lsp.hover, opts)
    map("n", "<leader>fm", lsp.format, opts)
  end,
})
