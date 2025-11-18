

return {
  'ggandor/leap.nvim',
  enabled = true,
  -- Recommended default mappings
   config = function()
     vim.keymap.set({'n', 'x', 'o'}, 's', '<Plug>(leap)')
     vim.keymap.set('n', 'S', '<Plug>(leap-from-window)')
   end
}
