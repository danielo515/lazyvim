return {
  "mrjones2014/legendary.nvim",
  version = "v2.1.0",
  -- since legendary.nvim handles all your keymaps/commands,
  -- its recommended to load legendary.nvim before other plugins
  priority = 10000,
  lazy = false,
  opts = { lazy_nvim = { auto_register = true } },
}
