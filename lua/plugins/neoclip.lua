return {
  "AckslD/nvim-neoclip.lua",
  dependencies = { "tami5/sqlite.lua" },
  config = function()
    local neoclip = require("neoclip")

    neoclip.setup({
      history = 50,
      enable_persistent_history = true,
      db_path = vim.fn.stdpath("data") .. "/neoclip.sqlite3",
      keys = {
        telescope = {
          i = { select = "<c-p>", paste = "<CR>", paste_behind = "<c-k>" },
          n = { select = "p", paste = "<CR>", paste_behind = "P" },
        },
      },
    })
    local function clip()
      local opts = {
        winblend = 10,
        layout_strategy = "flex",
        layout_config = {
          prompt_position = "top",
          width = 0.8,
          height = 0.6,
          horizontal = { width = { padding = 0.15 } },
          vertical = { preview_height = 0.70 },
        },
        borderchars = {
          prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
          results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
          preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        },
        border = {},
        shorten_path = false,
      }
      local dropdown = require("telescope.themes").get_dropdown(opts)
      require("telescope").extensions.neoclip.default(dropdown)
    end
    local whk_status, whk = pcall(require, "which-key")
    if not whk_status then
      vim.notify("Could not load which-key")
      return
    end
    whk.register({
      ["<leader>y"] = { clip, "neoclip: open yank history" },
    }, { mode = { "n", "v" } })
  end,
}