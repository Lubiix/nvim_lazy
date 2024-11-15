vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- In normal remap W & w by Z & z
vim.api.nvim_set_keymap('n', 'Z', 'W', {noremap = true})
vim.api.nvim_set_keymap('n', 'z', 'w', {noremap = true})

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "<leader>q", ":q<CR>")
--Cursor stay in the middle when searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

--Move up and down the page and th cursor doesn't move
vim.keymap.set("n", "<leader>j", "<C-d>zz")
vim.keymap.set("n", "<leader>k", "<C-u>zz")

-- Nav window 
vim.keymap.set('n', '<leader>h', '<C-w>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "*", "*N", { noremap = true })

-- Only for windows
--vim.api.nvim_set_keymap('n', '<C-q>', '<C-v>', { noremap = true })

vim.api.nvim_set_keymap("n", "<Esc>", ":noh<CR><Esc>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>CF", "<cmd>e ~/.config/nvim/lua/lubix/plugins/lsp.lua<CR>");

-- Désactiver le clic gauche et droit dans les différents modes
vim.keymap.set('n', '<LeftMouse>', '<Nop>')
vim.keymap.set('i', '<LeftMouse>', '<Nop>')
vim.keymap.set('v', '<LeftMouse>', '<Nop>')
vim.keymap.set('n', '<RightMouse>', '<Nop>')
vim.keymap.set('i', '<RightMouse>', '<Nop>')
vim.keymap.set('v', '<RightMouse>', '<Nop>')

vim.keymap.set('', '<Up>', '<Nop>')
vim.keymap.set('', '<Down>', '<Nop>')
vim.keymap.set('', '<Left>', '<Nop>')
vim.keymap.set('', '<Right>', '<Nop>')

