local hl = vim.api.nvim_set_hl
local autocmd = vim.api.nvim_create_autocmd

-- ColorScheme
autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
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

-- Lsp
autocmd("LspAttach", {
  callback = function(args)
    local opts = { silent = true, buffer = args.buf }
    local map = vim.keymap.set
    local lsp = vim.lsp.buf
    local diagnostic = vim.diagnostic
    map("n", "]d", diagnostic.goto_next, opts)
    map("n", "[d", diagnostic.goto_prev, opts)
    map("n", "<leader>e", diagnostic.open_float, opts)
    map("n", "<leader>q", diagnostic.setloclist, opts)
    map("n", "gd", lsp.definition, opts)
    map("n", "gi", lsp.implementation, opts)
    map("n", "gr", lsp.references, opts)
    map("n", "<leader>h", lsp.hover, opts)
    map("n", "<leader>sh", lsp.signature_help, opts)
    map({ "n", "v" }, "<leader>ca", lsp.code_action, opts)
    map("n", "<leader>rn", lsp.rename, opts)
    map("n", "<leader>fm", function()
      require("conform").format({ bufnr = args.buf })
    end, opts)
  end,
})
