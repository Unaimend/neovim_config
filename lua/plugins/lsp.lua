return {
  {
    "neovim/nvim-lspconfig",
    lazy = true,                         -- marks plugin for lazy-loading
    event = { "BufReadPre", "BufNewFile" }, -- load on buffer open
  },
}
