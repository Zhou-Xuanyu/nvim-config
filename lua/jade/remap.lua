-- remap.lua
-- this file stores the remap related to vim native commands
vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Move by visual line when lines wrap.
vim.keymap.set({ "n", "x" }, "j", "gj", { desc = "Down by visual line" })
vim.keymap.set({ "n", "x" }, "k", "gk", { desc = "Up by visual line" })

-- terminal remap
vim.keymap.set("t", "<C-q>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

-- quick fix remap
-- c for "cuick"
vim.keymap.set('n', '<leader>co', ':copen<CR>', { desc = 'Open quickfix list' })
vim.keymap.set('n', '<leader>cc', ':cclose<CR>', { desc = 'Close quickfix list' })
vim.keymap.set('n', '<leader>cn', ':cnext<CR>', { desc = 'Next quickfix item' })
vim.keymap.set('n', '<leader>cp', ':cprev<CR>', { desc = 'Previous quickfix item' })
