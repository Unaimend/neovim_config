

return {
  'ggandor/leap.nvim',
  enabled = false,
  -- Recommended default mappings
   config = function()
     require('leap').add_default_mappings(false) -- Disable default mappings
     vim.keymap.set({'n', 'x', 'o'}, 's', '<Plug>(leap)')
     vim.keymap.set('n', 'S', '<Plug>(leap-from-window)')
   end
}
