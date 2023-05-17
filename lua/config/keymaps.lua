-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
require("danielo.globals")
local nmap = require("user.keymap").nmap
local vmap = require("user.keymap").vmap
local del = function(...)
  return pcall(vim.keymap.del, ...)
end
del("n", "<leader>ww")
del("n", "<leader>wd")
del("n", "<leader>w-")
del("n", "<leader>w|")
del("n", "<leader>-")
del("n", "<leader>|")

--Cleanups
del("i", "jj")
del("i", "kj")
del("i", "jk")
del("n", "gp")
del("n", "<A-k>")
del("n", "<M-k>")
del("n", "kj")
del("n", "jk")

nmap("<C-C>", function()
  vim.api.nvim_win_close(0, false)
end, "Close current window")

nmap("<Tab>", function()
  require("telescope.builtin").buffers({
    layout_strategy = "vertical",
    layout_config = { height = 0.65, mirror = true, prompt_position = "top", anchor = "N" },
  })
end, "Open buffers in telescope")

nmap("<S-Tab>", function()
  require("telescope.builtin").find_files()
end, "Find finles telescope")

nmap("<S-X>", function()
  require("mini.bufremove").delete(0, false)
end, "Close current buffer")

nmap("<C-s>", ":%s/\\v", "Search and replace whole file", false)
nmap("<M-Tab>", ":b#<cr>", "Alternate file", true)
nmap("<c-g>", ":cnext!<cr>", "Next in quickfix", true)
nmap("<A-k>", ":cnext!<cr>", "Next in quickfix", true)
nmap("<C-n>", ":Neotree focus<cr>", "Neotree focus", true)
nmap("<C-f>", D.fzf_find, "Search then refine", true)
nmap("<leader>w", "<cmd>wa<cr>", "Save all", true)
nmap("<leader>fy", D.yank_file_name, "Yank current file path")
nmap("<leader>fY", D.yank_full_file_name, "Yank full file path")
nmap(",h", ":Gitsigns next_hunk<cr>", "Next git hunk")
nmap(",c", ":cNext!<cr>", "Prev item in quickfix")
nmap(",n", "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next error")
nmap(",s", ":s/\\v", "Search/replace local line", false)
vmap(",s", ":s/\\v", "Search/replace local line", false)

local map = vim.keymap.set;
-- Normal mode mappings
map("n", "<S-l>", ":BufferLineCycleNext<CR>", { desc = "Cycle to next buffer" })
map("n", "<S-h>", ":BufferLineCyclePrev<CR>", { desc = "Cycle to previous buffer" })
map("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", { desc = "Rename symbol using LSP" })
map("n", "<M-cr>", "<cmd>lua vim.lsp.buf.code_action()<cr>", { desc = "Trigger LSP code action" })
map("n", "<M-f>", "<cmd>lua require('fzf-lua').files()<cr>", { desc = "Find files using FZF-Lua" })
map("n", "<S-Tab>", ":Neotree float reveal<cr>", { desc = "Toggle Neotree file explorer" })
map("n", "<C-N>", ":Neotree reveal<cr>", { desc = "Find the current file in Neotree" })
map("n", "<C-;>", ":Telescope command_history<cr>", { desc = "Show command history using Telescope" })
map("n", ",n", "<cmd>lua vim.diagnostic.goto_next()<cr>", { desc = "Go to the next diagnostic" })
map("n", "+", "<cmd>3wincmd > <cr>", { desc = "Increase the current window width" })
map("n", "-", "<cmd>3wincmd < <cr>", { desc = "Decrease the current window width" })
map("n", "tk", ":tabclose<cr>", { desc = "Close the current tab" })
map("n", "tn", ":tabnew<cr>", { desc = "Create a new tab" })
map("n", "th", ":tabprev<cr>", { desc = "Navigate to the previous tab" })

-- Visual mode mappings
map("v", "s", "<cmd>Pounce<cr>", { noremap = true, silent = true })
map("v", "<M-cr>", "<cmd>lua vim.lsp.buf.range_code_action()<cr>", { noremap = true, silent = true })
map("v", "p", '"_dP', { noremap = true, silent = true })

-- Insert mode mappings
map("i", "<C-f>", "<cmd>lua require('user.find').fzf_find()<cr>", { noremap = true, silent = true })
map("i", "<C-u>", "<cmd>lua require('luasnip.extras.select_choice')()<cr>", { noremap = true, silent = true })

-- Navigation
vim.keymap.set("n", "s", ":Pounce<CR>", { noremap = true, silent = true, desc = "Extend visual selection with Pounce" })
vim.keymap.set(
  "n",
  "<M-f>",
  ':lua require("fzf-lua").files()<CR>',
  { noremap = true, silent = true, desc = "FZF find files" }
)
