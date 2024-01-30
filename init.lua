-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("danielo.globals") -- injects some global utils
pcall(require, "danielo_nvim") -- this comes from local package haxe-nvim
