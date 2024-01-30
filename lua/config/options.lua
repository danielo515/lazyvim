-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
require("config.filetype")
vim.o.winbar = "%{%v:lua.require'user.winbar'.statusline()%}"
vim.opt.pumheight = 30 -- 0 will use all available space, but could cause performance issues
vim.o.splitkeep = "screen"
vim.cmd("set noswapfile")
vim.o.conceallevel = 0
