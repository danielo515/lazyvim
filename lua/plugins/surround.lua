vim.filetype.add({
  extension = {
    re = function(path, bufnr)
      vim.b.minisurround_config = {
        custom_surroundings = {
          a = {
            input = { "%[%|().-()%|%]" },
            output = { left = "[|", right = "|]" },
          },
          j = {
            input = { "%{%j%|().-()%|%j%}" },
            output = { left = "{j|", right = "|j}" },
          },
        },
      }
    end,
  },
})
return {
  "echasnovski/mini.surround",
  opts = {
    mappings = {
      add = "ys",
      delete = "gsd",
      find = "gsf",
      find_left = "gsF",
      highlight = "gsh",
      replace = "gsr",
      update_n_lines = "gsn",
    },
  },
}
