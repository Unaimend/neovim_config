-- lua/plugins/rust.lua

-- 1. GLOBAL SETTINGS: Configure rust-analyzer via rustaceanvim
vim.g.rustaceanvim = {
  server = {
    -- This section configures the rust-analyzer settings directly
    settings = {
      ["rust-analyzer"] = {
        check = {
          -- 🔑 Ensure we use 'cargo check' for full, comprehensive diagnostics
          command = "check",
          -- Optionally, force a workspace-wide check if you're working on a big project
          -- allTargets = false, -- or set to true if needed
        },
        -- Ensure that diagnostics (like the ones from 'cargo check') are run when saving
        checkOnSave = {
          enable = true,
          -- delay = 50, -- Optional: set a short delay
        },
        diagnostics = {
          -- This is often key for ensuring full coverage:
          disabled = { "unresolved-proc-macro" }, -- Example of common diagnostic to disable
        }
      },
    },
  },
}

-- 2. PLUGIN DEFINITION AND KEYMAPS
return {
  {
    "mrcjkb/rustaceanvim",
    version = "^6",
    lazy = false, -- Plugin is already lazy
    ft = { "rust" },
    config = function()
      -- optional: set keymaps via LspAttach
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("RustLSP", { clear = true }),
        callback = function(args)
          local bufnr = args.buf
          -- Ensure keymaps are set only for the rust-analyzer client
          if vim.lsp.get_client_by_id(args.data.client_id).name == "rust-analyzer" then
            -- Your existing keymaps
            vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, { desc = 'go to definition' })
            vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, { desc = 'show hover documentation' })
            vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, { desc = 'show references' })
            vim.keymap.set("n", "<leader>lR", vim.lsp.buf.rename, { desc = 'rename' })
            vim.keymap.set("n", "<leader>le", vim.diagnostic.open_float, { desc = 'show line diagnostic' })
            vim.keymap.set("n", "<leader>ll", vim.diagnostic.setloclist, { desc = 'Show buffer diagnostics in loclist' })
            
            -- Add a useful keymap for refreshing diagnostics
            vim.keymap.set("n", "<leader>lfc", ":RustLsp refreshWorkspace<CR>", { desc = 'Force Refresh Workspace (Full Check)' })
          end
        end,
      })
    end,
  },
}
