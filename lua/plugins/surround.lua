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
    n_lines = 90, -- Number of lines within which surrounding is searched,
    mappings = {
      add = "ys",
      delete = "ds",
      find = "gsf",
      find_left = "gsF",
      highlight = "gsh",
      replace = "cs",
      update_n_lines = "gsn",
    },
  },
}
