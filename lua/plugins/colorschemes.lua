return {
  {
    -- "eddyekofo94/gruvbox-flat.nvim",
    "jgottzen/gruvbox-flat.nvim",
    opts = {
      style = "dark",
      transparent = true,
      italics = {
        functions = true,
      },
      theme = { Conceal = { fg = "#d4be98" } },
    },
    priority = 1000,
  },
  {
    "ellisonleao/gruvbox.nvim",
    opts = {
      undercurl = true,
      underline = true,
      bold = false,
      italic = {
        strings = true,
        comments = true,
        operators = false,
        folds = true,
      },
      strikethrough = true,
      invert_selection = false,
      invert_signs = false,
      invert_tabline = false,
      invert_intend_guides = false,
      inverse = true, -- invert background for search, diffs, statuslines and errors
      contrast = "soft", -- can be "hard", "soft" or empty string
      palette_overrides = {},
      overrides = {},
      dim_inactive = false,
      transparent_mode = true,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
