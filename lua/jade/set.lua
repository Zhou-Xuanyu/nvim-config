-- Intro
-- config file for vim native configs
vim.o.nu = true
vim.o.relativenumber = true

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.smartindent = true

vim.o.colorcolumn = "80"

vim.o.wrap = false
vim.o.linebreak = true
vim.o.breakindent = true

vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.o.undofile = true

vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.termguicolors = true

vim.o.scrolloff = 4
vim.o.signcolumn = "yes"

vim.o.updatetime = 50
vim.o.clipboard = "unnamedplus"
vim.o.laststatus = 0

-- load per-project .nvim.lua (asks before trusting a new/changed file)
vim.o.exrc = true
