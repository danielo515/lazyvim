-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local nmap = require("user.keymap").nmap
local vmap = require("user.keymap").vmap
nmap("<C-C>", function()
  vim.api.nvim_win_close(0, false)
end, "Close current window")
nmap("<Tab>", ":Telescope buffers<cr>", "Open command center")
nmap("<S-X>", function()
  require("mini.bufremove").delete(0, false)
end, "Buffer delete")
nmap("<C-s>", ":%s/\\v", "Search and replace whole file", false)
nmap("<M-Tab>", ":b#<cr>", "Alternate file", true)
nmap("<c-g>", ":cnext!<cr>", "Next in quickfix", true)
nmap("<A-k>", ":cnext!<cr>", "Next in quickfix", true)
nmap("<C-n>", ":Neotree focus<cr>", "Neotree focus", true)
nmap("<C-f>", ":FzFLua lines<cr>", "Live grep  lines", true)
nmap("<leader>w", ":wa<cr>", "Save all", true)
nmap(",h", ":Gitsigns next_hunk<cr>", "Next git hunk")
nmap(",c", ":cNext!<cr>", "Prev item in quickfix")
nmap(",s", ":s/\\v", "Search/replace local line", false)
vmap(",s", ":s/\\v", "Search/replace local line", false)

-- Navigation
vim.keymap.set("n", "s", ":Pounce<CR>", { noremap = true, silent = true, desc = "Extend visual selection with Pounce" })

vim.keymap.set(
  "n",
  "<M-f>",
  ':lua require("fzf-lua").files()<CR>',
  { noremap = true, silent = true, desc = "FZF find files" }
)
