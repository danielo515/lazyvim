-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local command = vim.api.nvim_create_autocmd
--#region I am using the builtin chezmoi extension from LazyVim, so I will disable this for now
-- local chezmoi = require("user.chezmoi")
-- command("BufWritePost", {
--   pattern = "*/.config/*",
--   callback = function()
--     local file = vim.fn.expand("%:p")
--     chezmoi.re_add(file)
--   end,
-- })
-- command("BufWritePost", {
--   pattern = chezmoi.get_chezmoi_dir() .. "/*",
--   callback = function()
--     local file = vim.fn.expand("%:p")
--     chezmoi.executeChezmoi({ "apply", "-v", "--refresh-externals=false", "--source-path", file })
--   end,
-- })
--#endregion

command("FileType", {
  pattern = "reason",
  callback = function()
    vim.cmd("setlocal commentstring=//%s")
  end,
})
