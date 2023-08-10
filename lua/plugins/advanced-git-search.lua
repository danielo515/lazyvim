return {
  "aaronhallaert/advanced-git-search.nvim",
  config = function()
    -- optional: setup telescope before loading the extension
    require("telescope").setup {
      -- move this to the place where you call the telescope setup function
      extensions = {
        advanced_git_search = {
          -- fugitive or diffview
          diff_plugin = "diffview",
          -- customize git in previewer
          -- e.g. flags such as { "--no-pager" }, or { "-c", "delta.side-by-side=false" }
          git_flags = {},
          -- customize git diff in previewer
          -- e.g. flags such as { "--raw" }
          git_diff_flags = {},
          -- Show builtin git pickers when executing "show_custom_functions" or :AdvancedGitSearch
          show_builtin_git_pickers = false,
        }
      }
    }

    require("telescope").load_extension("advanced_git_search")
  end,
  dependencies = {
    "nvim-telescope/telescope.nvim",
    -- to show diff splits and open commits in browser
    "tpope/vim-fugitive",
    -- to open commits in browser with fugitive
    "tpope/vim-rhubarb",
    -- OPTIONAL: to replace the diff from fugitive with diffview.nvim
    -- (fugitive is still needed to open in browser)
    "sindrets/diffview.nvim",
  },
}
