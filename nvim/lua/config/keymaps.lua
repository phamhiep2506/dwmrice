local map = vim.keymap.set

-- Navigation
map("n", "<C-h>", "<C-w>h", {silent = true})
map("n", "<C-j>", "<C-w>j", {silent = true})
map("n", "<C-k>", "<C-w>k", {silent = true})
map("n", "<C-l>", "<C-w>l", {silent = true})

-- Jump center screen
map("n", "j", "jzz", {silent = true})
map("n", "k", "kzz", {silent = true})
map("n", "J", "5jzz", {silent = true})
map("n", "K", "5kzz", {silent = true})

-- Next & Previous highlight search
map("n", "n", "nzz", {silent = true})
map("n", "N", "Nzz", {silent = true})

-- Indent block
map("v", ">", ">gv", {silent = true})
map("v", "<", "<gv", {silent = true})

-- Split window
map("n", "<leader>_", "<CMD>split<CR>", {silent = true})
map("n", "<leader>|", "<CMD>vsplit<CR>", {silent = true})

-- Copy & Paste
map("n", "<leader>p", '"+p', {silent = true})
map("v", "<leader>p", '"+p', {silent = true})
map("v", "<leader>y", '"+y', {silent = true})

-- Disable highlight search
map("n", "<leader><Enter>", "<CMD>nohlsearch<CR>", {silent = true})
