-- remap.lua
-- this file stores the remap related to vim native commands
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("n", "<leader>l", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Move by visual line when lines wrap.
vim.keymap.set({ "n", "x" }, "j", "gj")
vim.keymap.set({ "n", "x" }, "k", "gk")

-- terminal remap
vim.keymap.set("t", "<C-q>", [[<C-\><C-n>]])

-- quick fix remap
-- c for "cuick"
vim.keymap.set('n', '<leader>co', ':copen<CR>')
vim.keymap.set('n', '<leader>cc', ':cclose<CR>')
vim.keymap.set('n', '<leader>cn', ':cnext<CR>')
vim.keymap.set('n', '<leader>cp', ':cprev<CR>')
