return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = function(_, opts)
    table.insert(opts.sections.lualine_x, "filetype")
    table.insert(opts.sections.lualine_x, "searchcount")
    opts.sections.lualine_z = {
      function()
        return vim.api.nvim_buf_line_count(0)
      end,
    }
  end,
}
