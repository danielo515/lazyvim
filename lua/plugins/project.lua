return {
  "ahmedkhalf/project.nvim",
  config = function()
    require("project_nvim").setup {
      patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },
      -- Don't calculate root dir on specific directories
      -- Ex: { "~/.cargo/*", ... }
      exclude_dirs = {
        "~/.local/share/chezmoi/*"
      },

      -- Show hidden files in telescope
      show_hidden = true,

      -- When set to false, you will get a message when project.nvim changes your
      -- directory.
      silent_chdir = false,

      -- What scope to change the directory, valid options are
      -- * global (default)
      -- * tab
      -- * win
      scope_chdir = 'global',
    }
  end,
}
