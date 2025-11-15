require("config.lazy")


vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2 
vim.opt.softtabstop = 2

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.mouse = 'a'
	
-- Use system clipboard with y/p
vim.opt.clipboard = "unnamedplus"

vim.keymap.set('n', '<leader>bh', '<cmd>nohlsearch<CR>')
-- Switch to last buffer on <leader>tab
vim.keymap.set('n', '<leader><Tab>', '<C-^>', { noremap = true, desc = "Switch to last buffer" })
    

-- TELESCOPE 
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- Essential core Neovim configuration for diagnostics display
vim.diagnostic.config({
  virtual_text = true, -- **This is the key for inline messages**
  signs = true,        -- Enables icons in the sign column (the gutter)
  underline = true,    -- Underlines the faulty code
  update_in_insert = false, -- Only update when exiting Insert mode or saving
  -- You can add more visual settings here
})
