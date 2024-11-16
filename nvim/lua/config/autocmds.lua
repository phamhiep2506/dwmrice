local hl = vim.api.nvim_set_hl
local autocmd = vim.api.nvim_create_autocmd
local fn = vim.fn

-- ColorScheme
autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    hl(0, "CursorLine", { fg = "NONE", bg = "NONE" })
    hl(0, "CursorLineNR", { fg = "#fabd2f", bg = "NONE", bold = true })
  end,
})

-- Float
autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    hl(0, "NormalFloat", { bg = "NONE" })
    hl(0, "FloatBorder", { bg = "NONE" })
  end,
})

-- Neotree
autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    hl(0, "NeoTreeFloatTitle", { bg = "NONE" })
  end,
})

-- Dap
autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    hl(0, "DapBreakpoint", { fg = "#fabd2f", bg = "NONE" })
    hl(0, "DapBreakpointRejected", { fg = "#fb4934", bg = "NONE" })
    hl(0, "DapStopped", { fg = "#b8bb26", bg = "NONE" })
  end,
})

autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    fn.sign_define("DapBreakpoint", { text = "", texthl = "DapBreakpoint" })
    fn.sign_define(
      "DapBreakpointRejected",
      { text = "", texthl = "DapBreakpointRejected" }
    )
    fn.sign_define("DapStopped", { text = "", texthl = "DapStopped" })
  end,
})

-- Lsp
autocmd("LspAttach", {
  callback = function(args)
    local opts = { silent = true, buffer = args.buf }
    local map = vim.keymap.set
    local lsp = vim.lsp.buf

    map("n", "]d", vim.diagnostic.goto_next, opts)
    map("n", "[d", vim.diagnostic.goto_prev, opts)
    map("n", "<leader>e", vim.diagnostic.open_float, opts)
    map("n", "gd", lsp.definition, opts)
    map("n", "gi", lsp.implementation, opts)
    map("n", "gr", lsp.references, opts)
    map("n", "<leader>h", lsp.hover, opts)
    map("n", "<leader>sh", lsp.signature_help, opts)
    map("n", "<leader>ca", lsp.code_action, opts)
    map("n", "<leader>rn", lsp.rename, opts)
  end,
})
