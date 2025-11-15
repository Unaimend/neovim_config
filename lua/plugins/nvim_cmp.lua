return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter', -- Lazy load on entering insert mode
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',   -- LSP source (needed for rust-analyzer)
    'hrsh7th/cmp-buffer',     -- Buffer source
    'hrsh7th/cmp-path',       -- Path source
    'L3MON4D3/LuaSnip',       -- Snippet engine (highly recommended)
    'saadparwaiz1/cmp_luasnip', -- nvim-cmp source for LuaSnip
    'onsails/lspkind.nvim',   -- Add icons next to completion items
  },
  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')
    local lspkind = require('lspkind')

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body) -- Use luasnip to expand snippets
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept selected item.
        ['<Tab>'] = function(fallback)
          -- Custom <Tab> behavior to cycle or fallback
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end,
        ['<S-Tab>'] = function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end,
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
      }),
      formatting = {
        format = lspkind.cmp_format({
          mode = 'symbol_text',
          maxwidth = 50,
        }),
      },
    })
  end,
}
