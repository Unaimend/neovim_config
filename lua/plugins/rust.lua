
-- lua/plugins/rust.lua
return {
  {
    "mrcjkb/rustaceanvim",
    version = "^6",
    lazy = false, --Plugin is already lazy
    ft = { "rust" },
    config = function()
      -- optional: set keymaps via LspAttach
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("RustLSP", { clear = true }),
        callback = function(args)
          local bufnr = args.buf
          if vim.lsp.get_client_by_id(args.data.client_id).name == "rust-analyzer" then
            vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, {desc = 'go to defintion'})
            vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, {desc = ''})
            vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, {desc = 'show references'})
            vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, {desc = 'rename'})
          end
        end,
      })
    end,
  },
}
