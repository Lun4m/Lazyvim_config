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
    lazy = false, -- lazy-loading will disable inverse search
    config = function()
      vim.api.nvim_create_autocmd({ "FileType" }, {
        group = vim.api.nvim_create_augroup("lazyvim_vimtex_conceal", { clear = true }),
        pattern = { "bib", "tex" },
        callback = function()
          vim.wo.conceallevel = 2
        end,
      })

      vim.g.vimtex_mappings_disable = { ["n"] = { "K", "csc", "csd", "cse", "cs$", "dsc", "dsd", "dse", "ds$" } } -- disable `K` as it conflicts with LSP hover
      vim.g.vimtex_quickfix_method = vim.fn.executable("pplatex") == 1 and "pplatex" or "latexlog"
    end,
    init = function()
      vim.g.vimtex_compiler_method = "latexmk"
      vim.g.vimtex_compiler_latexmk = {
        options = {
          "-shell-escape",
          "-verbose",
          "-file-line-error",
          "-synctex=1",
          "-interaction=nonstopmode",
        },
      }
      vim.g.vimtex_view_method = "general"
      vim.g.vimtex_view_method = "zathura_simple"
      vim.g.vimtex_quickfix_mode = 0
      vim.g.vimtex_view_forward_search_on_start = 0
      vim.g.vimtex_syntax_conceal = { ["spacing"] = 0 }
    end,
  },
  {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup()
    end,
  },
  -- {
  --   "ahmedkhalf/project.nvim",
  --   enabled = false,
  -- },
  {
    "lonhattan007/project.nvim",
    opts = { use_git_files = true },
    event = "VeryLazy",
    config = function(_, opts)
      require("project_nvim").setup(opts)
      require("telescope").load_extension("projects")
    end,
    keys = {
      { "<leader>fp", "<Cmd>Telescope projects<CR>", desc = "Projects" },
    },
  },
  {
    "goolord/alpha-nvim",
    optional = true,
    opts = function(_, dashboard)
      local button = dashboard.button("p", " " .. " Projects", ":Telescope projects <CR>")
      button.opts.hl = "AlphaButtons"
      button.opts.hl_shortcut = "AlphaShortcut"
      table.insert(dashboard.section.buttons.val, 4, button)
    end,
  },
  {
    "echasnovski/mini.starter",
    optional = true,
    opts = function(_, opts)
      local items = {
        {
          name = "Projects",
          action = "Telescope projects",
          section = string.rep(" ", 22) .. "Telescope",
        },
      }
      vim.list_extend(opts.items, items)
    end,
  },
  {
    "NvChad/nvim-colorizer.lua",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      filetypes = {
        "*",
        -- Excluded filteypes.
        "!lazy", -- Commit hashes get highlighted sometimes.
      },
      user_default_options = {
        RGB = true,      -- #RGB hex codes.
        RRGGBB = true,   -- #RRGGBB hex codes.
        RRGGBBAA = true, -- #RRGGBBAA hex codes.
        AARRGGBB = true, -- 0xAARRGGBB hex codes.

        -- "Name" codes like Blue or blue. It is pretty annoying when you have maps with
        -- 'blue = color_hex': you get two previews, one for the key and one for the value.
        names = false,

        rgb_fn = true, -- CSS rgb() and rgba() functions.
        hsl_fn = true, -- CSS hsl() and hsla() functions.
        css = true,    -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB.
        css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn.
        tailwind = true,

        mode = "background",
        -- virtualtext = "■",
      },
    },
  },
}
