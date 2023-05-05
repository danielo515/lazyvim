return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    table.insert(opts.sections.lualine_x, "filetype")
    table.insert(opts.sections.lualine_x, "searchcount")
  end,
}
