return {
  "L3MON4D3/LuaSnip",
  config = function(_, config)
    require("luasnip.loaders.from_lua").lazy_load()
    return config
  end,
}
