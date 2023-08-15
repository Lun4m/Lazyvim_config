-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")

local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- Go to previous or next hunk
map(
  "n",
  "<leader>gj",
  "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>",
  { desc = "Next Hunk" }
)
map(
  "n",
  "<leader>gk",
  "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>",
  { desc = "Prev Hunk" }
)

-- QTconsole
-- map("n", "<leader>j", { name = "Nvim-IPy" })
map("n", "<leader>jo", "<cmd>IPython<cr>", { desc = "Run IPython inside nvim" })
map(
  "n",
  "<leader>jp",
  "<cmd>call jobstart('jupyter qtconsole --JupyterWidget.include_other_output=True --JupyterQtConsoleApp.hide_menubar=True') | :wincmd p<cr>",
  { desc = "Run python QTconsole" }
)

map("n", "<leader>jk", "<cmd>IPython --existing --no-window<cr>", { desc = "Connect to existing kernel" })
map("n", "<leader>jc", "<Plug>(IPy-RunCell)<cr>", { desc = "Run current cell" })
map("n", "<leader>ja", "<Plug>(IPy-RunAll)<cr>", { desc = "Run all cells" })

-- Easily move visual selection lines up and down
map("v", "J", ":move '>+1<CR>gv-gv", { desc = "Move lines down in visual mode" })
map("v", "K", ":move '<-2<CR>gv-gv", { desc = "Move lines up in visual mode" })
map("v", "p", '"_dP"', { desc = "Keep same clipboard when pasting" })

-- Set key map for lazyterm
local lazyterm = function()
  Util.float_term(nil, { cwd = Util.get_root(), border = "rounded" })
end

map("n", "<C-t>", lazyterm)
map("t", "<C-t>", "<cmd>close<cr>")
