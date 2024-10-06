vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter" }, {
    pattern = "*",
    callback = function ()
        vim.api.nvim_set_hl(0, "Normal", {bg = "#000000"})
        vim.api.nvim_set_hl(0, "NormalNC", {bg = "#000000"})
        vim.api.nvim_set_hl(0, "CursorLine", {fg = "NONE", bg = "NONE"})
        vim.api.nvim_set_hl(0, "CursorLineNR", {fg = "#d79921", bg = "NONE", bold = true})
    end
})

-- vim.api.nvim_create_autocmd({ "NeoTree" }, {
--     pattern = "*",
--     callback = function ()
--         vim.api.nvim_set_hl(0, "NeoTreeNormal", {bg = "#000000"})
--         vim.api.nvim_set_hl(0, "NeoTreeNormalNC", {bg = "#000000"})
--         vim.api.nvim_set_hl(0, "NeoTreeEndOfBuffer", {bg = "#000000"})
--     end
-- })
