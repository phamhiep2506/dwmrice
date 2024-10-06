local opt = vim.opt

-- Base
opt.autowrite = true
opt.number = true
opt.relativenumber = true
opt.mouse = "a"
opt.wrap = true
opt.cursorline = true
opt.clipboard = ""
opt.background = "dark"
opt.termguicolors = true
opt.backup = false
opt.writebackup = false
opt.swapfile = false
opt.updatetime = 300
opt.hidden = true

-- Search
opt.hlsearch = true
opt.ignorecase = true

-- Split
opt.splitbelow = true
opt.splitright = true

-- Indent
opt.autoindent = true
opt.expandtab = true

-- Undo
opt.undofile = true

-- Map leader <Space>
vim.g.mapleader = " "
