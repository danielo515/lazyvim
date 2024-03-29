local whichMaps = {
  ["<space>"] = { ":Telescope command_history<cr>", "Command history" },
  c = { name = "code" },
  -- extend search
  s = {
    d = { "<cmd>lua require('user.telescope').dotfiles()<cr>", "Search dotfiles" },
    q = { "<cmd>Telescope quickfix<cr>", "QuickFix" },
    C = { "<cmd>Telescope command_history<cr>", "Commands history" },
    s = { "<cmd>Telescope lsp_workspace_symbols<cr>", "Workspace symbols" },
    j = { "<cmd>Telescope jumplist<cr>", "Jump list" },
    o = { "<cmd>FzfLua lines<cr>", "Grep lines on open files" },
    ["."] = { "<cmd>Telescope resume<cr>", "Repeat search" },
    K = {
      name = "Keymaps by mode",
      i = {
        function()
          require("telescope.builtin").keymaps({ modes = { "i" } })
        end,
        "insert mode keymaps",
      },
      n = {
        function()
          require("telescope.builtin").keymaps({ modes = { "n" } })
        end,
        "normal mode keymaps",
      },
    },
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
    b = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame curent line" },
    d = { "<cmd>DiffviewOpen<cr>", "Open git diff" },
    h = { "<cmd>DiffviewFileHistory %<cr>", "Open file history" },
    H = { "<cmd>DiffviewFileHistory<cr>", "Open file history for current branch" },
    g = { "<cmd>lua require 'lazygit'.lazygit()<cr>", "Open git diff" },
    f = { "<cmd>Telescope git_status<cr>", "Search changed files" },
  },
  -- file section
  f = {
    name = "Files",
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
  r = require("danielo.replace-snippets").keymap.r,
}

return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  dependencies = { "legendary.nvim" },
  opts = {
    plugins = { spelling = true },
    defaults = {
      ["<leader>w"] = { name = "Save all" },
      ["<leader>ww"] = false,
      ["<leader>wd"] = false,
      ["<leader>w-"] = false,
      ["<leader>w|"] = false,
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    opts.defaults["<leader><Space>"] = nil
    opts.defaults["<leader><tab>"] = nil
    opts.defaults["<leader>w"] = nil
    opts.defaults["<leader>gh"] = nil
    -- wk.register(opts.defaults)
    wk.setup(opts)
    wk.register(whichMaps, { prefix = "<leader>" })
  end,
}
