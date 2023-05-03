-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.filetype.add({
  extension = {
    zsh = "bash", -- used for zsh configuration files
    sh = "bash",
    tf = "terraform",
    tfvars = "terraform",
    hcl = "hcl",
    tfstate = "json",
    eslintrc = "json",
    prettierrc = "json",
    mdx = "markdown",
    re = "reason",
    rei = "reason",
  },
  filename = {
    ["kitty.conf"] = "kitty",
  },
  pattern = {
    [".*/etc/foo/.*"] = "fooscript",
  },
})
vim.o.winbar = "%{%v:lua.require'user.winbar'.statusline()%}"
