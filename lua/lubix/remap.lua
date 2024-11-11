vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- In normal remap W & w by Z & z
vim.api.nvim_set_keymap('n', 'Z', 'W', {noremap = true})
vim.api.nvim_set_keymap('n', 'z', 'w', {noremap = true})

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

--Cursor stay in the middle when searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Nav window 
vim.keymap.set('n', '<leader>h', '<C-w>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "*", "*N", { noremap = true })

-- Only for windows
--vim.api.nvim_set_keymap('n', '<C-q>', '<C-v>', { noremap = true })

vim.api.nvim_set_keymap("n", "<Esc>", ":noh<CR><Esc>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>CF", "<cmd>e ~/.config/nvim/lua/lubix/plugins/lsp.lua<CR>");

