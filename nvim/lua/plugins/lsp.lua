return {
  "neovim/nvim-lspconfig",
  event = "VeryLazy",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason-lspconfig").setup()
    require("mason-lspconfig").setup_handlers({
      function(server_name)
        require("lspconfig")[server_name].setup({})
      end,
    })
    -- Icon
    local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = "󰋽 " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl })
    end
    -- Border
    vim.diagnostic.config({
      float = {
        border = "rounded",
      },
    })
    local lsp = vim.lsp
    lsp.handlers["textDocument/signatureHelp"] = lsp.with(lsp.handlers.signature_help, {
      border = "rounded",
    })
    lsp.handlers["textDocument/hover"] = lsp.with(lsp.handlers.hover, {
      border = "rounded",
    })
  end,
}
