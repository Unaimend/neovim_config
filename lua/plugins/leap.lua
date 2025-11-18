

return {
  'ggandor/leap.nvim',
  enabled = true,
  -- Recommended default mappings
   config = function()
     vim.keymap.set({'n', 'x', 'o'}, 's', '<Plug>(leap-forward)')
     vim.keymap.set({'n', 'x', 'o'}, 'S', '<Plug>(leap-backward)')
     vim.keymap.set('n', '<leader>s', '<Plug>(leap-from-window)')
   end
}
