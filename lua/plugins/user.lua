return {
  {
    "bfredl/nvim-ipy",
  },
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    config = true,
  },
  {
    "lervag/vimtex",
    lazy = false,
    config = function()
      vim.g.vimtex_compiler_method = "latexmk"
      -- vim.g.vimtex_view_method = "general"
      vim.g.vimtex_view_method = "zathura_simple"
      vim.g.vimtex_quickfix_mode = 0
      vim.g.vimtex_view_forward_search_on_start = 0
    end,
    -- ft = { "tex", "bib" }
  },
  {
    -- lua with packer.nvim
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
  },
}
