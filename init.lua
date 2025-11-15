require("config.lazy")

vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 0 --leads to tabstop being used

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.mouse = 'a'
	
-- Use system clipboard with y/p
vim.opt.clipboard = "unnamedplus"

vim.keymap.set('n', '<leader>h', '<cmd>nohlsearch<CR>')
    
