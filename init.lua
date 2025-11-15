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
-- Execute current file
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Reload current file (config/settings)" })
--execite curent line
vim.keymap.set("n", "<leader>x", ":.lua<CR>", { desc = "Enter Lua command in Normal mode" })
--vim.keymap.set("v", "<leader>x", ":.lua<CR>", { desc = "Enter Lua command in Visual mode" })

vim.keymap.set("n", "<leader>wh", "<CMD> :split<CR>", { desc = "Horizontal split" })
vim.keymap.set("n", "<leader>wv", "<CMD> :vsplit<CR>", { desc = "Vertical split" })

vim.keymap.set('n', '<Leader>bl', ':bnext<CR>', { desc = 'Go to Next Buffer' })
vim.keymap.set('n', '<Leader>bh', ':bprev<CR>', { desc = 'Go to Previous Buffer' })

-- Close the current buffer
vim.keymap.set('n', '<Leader>bc', ':bdelete<CR>', { desc = 'Close Current Buffer' })

-- Listing buffers is often done with 'b'
vim.keymap.set('n', '<Leader>bb', ':ls<CR>', { desc = 'List all Buffers' })

vim.keymap.set('n', '<Leader>h', '<C-w>h', { desc = 'Move to Left Split' })
vim.keymap.set('n', '<Leader>j', '<C-w>j', { desc = 'Move to Down Split' })
vim.keymap.set('n', '<Leader>k', '<C-w>k', { desc = 'Move to Up Split' })
vim.keymap.set('n', '<Leader>l', '<C-w>l', { desc = 'Move to Right Split' })

-- Highlight when yanking (copying) text
-- Try it with `yap` in normal mode
-- See :help vim.highlight.on_yank()
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- TELESCOPE
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set("n", "<leader>fd", "<CMD>Telescope lsp_definitions<CR>")
vim.keymap.set("n", "<leader>fd", "<CMD>Telescope lsp_document_symbols<CR>")

vim.keymap.set("n", "<leader>fc", function()
  require('telescope.builtin').find_files {
    cwd = vim.fn.stdpath("config")
  }
end)

-- Essential core Neovim configuration for diagnostics display
vim.diagnostic.config({
  virtual_text = true, -- **This is the key for inline messages**
  signs = true,        -- Enables icons in the sign column (the gutter)
  underline = true,    -- Underlines the faulty code
  update_in_insert = false, -- Only update when exiting Insert mode or saving
  -- You can add more visual settings here
})


-- require('leap').opts.preview = function (ch0, ch1, ch2)
--   return not (
--     ch1:match('%s')
--     or (ch0:match('%a') and ch1:match('%a') and ch2:match('%a'))
--   )
-- end
-- 
-- -- Define equivalence classes for brackets and quotes, in addition to
-- -- the default whitespace group:
-- require('leap').opts.equivalence_classes = {
--   ' \t\r\n', '([{', ')]}', '\'"`'
-- }
-- 
-- -- Use the traversal keys to repeat the previous motion without
-- -- explicitly invoking Leap:
-- require('leap.user').set_repeat_keys('<enter>', '<backspace>')
-- 
