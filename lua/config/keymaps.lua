-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
require("danielo.globals")
local nmap = require("user.keymap").nmap
local vmap = require("user.keymap").vmap
local del = function(...)
  return pcall(vim.api.nvim_del_keymap, ...)
end
del("n", "<leader>ww")
del("n", "<leader>wd")
del("n", "<leader>w-")
del("n", "<leader>w|")
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
nmap("<leader>w", ":wa<cr>", "Save all", true)
nmap("<leader>fy", D.yank_file_name, "Yank current file path")
nmap("<leader>fY", D.yank_full_file_name, "Yank full file path")
nmap(",h", ":Gitsigns next_hunk<cr>", "Next git hunk")
nmap(",c", ":cNext!<cr>", "Prev item in quickfix")
nmap(",n", "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next error")
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
