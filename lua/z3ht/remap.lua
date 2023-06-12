vim.g.mapleader = " "

-- select + move code
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- move below line into current line
vim.keymap.set("n", "J", "mzJ`z")

-- move up + down half page
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- find terms stay in the middle
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- dont press it
vim.keymap.set("n", "Q", "<nop>")

-- dir mode remap
vim.keymap.set("n", "<leader>sf", vim.cmd.Ex)

-- prev/next loc remap
vim.keymap.set("n", "<leader>j", "<C-o>")
vim.keymap.set("n", "<leader>k", "<C-i>")

