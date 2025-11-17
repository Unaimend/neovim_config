return {
  "folke/zen-mode.nvim",
  window = {
    width = .95
  },
  keys = {
    { "<leader>z", function() require("zen-mode").toggle() end }
  }
}

