local o = vim.opt
local g = vim.g

-- Base
o.number = true
o.relativenumber = true
o.mouse = "a"
o.wrap = false
o.cursorline = true
o.clipboard = ""

-- Search
o.hlsearch = true
o.ignorecase = true

-- Split
o.splitbelow = true
o.splitright = true

-- Indent
o.autoindent = true
o.expandtab = true

-- Undo
o.undofile = true

-- Map leader <Space>
g.mapleader = " "
