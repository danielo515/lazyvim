local whichMaps = {
  ["<space>"] = { ":Telescope command_history<cr>", "Command history" },
  -- extend search
  s = {
    d = { "<cmd>lua require('user.telescope').dotfiles()<cr>", "Search dotfiles" },
    q = { "<cmd>Telescope quickfix<cr>", "QuickFix" },
    c = { "<cmd>Telescope commands<cr>", "Commands" },
    C = { "<cmd>Telescope command_history<cr>", "Commands history" },
    s = { "<cmd>Telescope lsp_workspace_symbols<cr>", "Workspace symbols" },
    g = { "<cmd>Telescope live_grep_args<cr>", "Live grep with rg" },
    j = { "<cmd>Telescope jumplist<cr>", "Jump list" },
    o = { "<cmd>FzfLua lines<cr>", "Grep lines on open files" },
    ["."] = { "<cmd>Telescope resume<cr>", "Repeat search" },
    S = {
      "<cmd>lua require('spectre').open_visual({select_word=true})<CR>",
      "Spectre search",
    },
  },
  ["t"] = {
    name = "+Trouble",
    r = { "<cmd>Trouble lsp_references<cr>", "References" },
    f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
    d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
    q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
    l = { "<cmd>Trouble loclist<cr>", "LocationList" },
    w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace diagnostics" },
  },
  -- extend git
  ["g"] = {
    S = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    s = { "<cmd>lua require 'gitsigns'.stage_buffer()<cr>", "Stage file" },
    B = { "<cmd>lua require 'gitsigns'.toggle_current_line_blame()<cr>", "Toggle blame" },
    d = { "<cmd>DiffviewOpen<cr>", "Open git diff" },
    h = { "<cmd>DiffviewFileHistory %<cr>", "Open file history" },
    H = { "<cmd>DiffviewFileHistory<cr>", "Open file history for current branch" },
    g = { "<cmd>lua require 'lazygit'.lazygit()<cr>", "Open git diff" },
    f = { "<cmd>Telescope git_status<cr>", "Search changed files" },
  },
  -- file section
  f = {
    name = "Files",
    -- f = { require("lvim.core.telescope.custom-finders").find_project_files, "Find project files" },
    f = { "<cmd>FzfLua files<cr>", "Find project files" },
    g = { "<cmd>FzfLua lines<cr>", "Search on open files" },
  },
  -- Contextual section. This will be filled from filetype functions
  x = {
    name = "contextual",
    u = { "gUiw", "Make word uppercase" },
    l = { "guiw", "Make word lowercase" },
    p = { "ysiw(", "Surryound word with parens" },
    r = { "viwP", "Replace word with clipboard content" },
  },
  ["?"] = { "<cmd>Cheat<CR>", " Cheat.sh" },
}
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    plugins = { spelling = true },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
    opts.defaults["<leader><Space>"] = nil
    opts.defaults["<leader><tab>"] = nil
    opts.defaults["<leader>w"] = nil
    wk.register(opts.defaults)
    vim.print(opts.defaults)
    wk.register(whichMaps, { prefix = "<leader>" })
  end,
}
