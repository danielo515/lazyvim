return {
  "AckslD/nvim-neoclip.lua",
  dependencies = { "tami5/sqlite.lua", 'nvim-telescope/telescope.nvim' },
  config = function()
    local neoclip = require("neoclip")

    neoclip.setup({
      history = 1000,
      enable_persistent_history = true,
      length_limit = 1048576,
      continuous_sync = true,
      db_path = vim.fn.stdpath("data") .. "/neoclip.sqlite3",
      preview = true,
      default_register = { '"', '+', '*' },
      default_register_macros = 'q',
      enable_macro_history = true,
      content_spec_column = false,
      disable_keycodes_parsing = false,
      on_select = {
        move_to_front = true,
        close_telescope = false,
      },
      on_paste = {
        set_reg = true,
        move_to_front = true,
        close_telescope = true,
      },
      on_replay = {
        set_reg = false,
        move_to_front = false,
        close_telescope = true,
      },
      on_custom_action = {
        close_telescope = true,
      },
      keys = {
        telescope = {
          i = {
            select = '<tab>',
            paste = '<c-p>',
            paste_behind = '<cr>',
            replay = '<c-q>', -- replay a macro
            delete = '<c-d>', -- delete an entry
            edit = '<c-e>',   -- edit an entry
            custom = {},
          },
          n = {
            select = '<tab>',
            paste = 'P',
            paste_behind = { 'p', '<c-p>' },
            replay = 'q',
            delete = 'd',
            edit = 'e',
            custom = {},
          },
        },
        fzf = {
          select = 'default',
          paste = 'ctrl-p',
          paste_behind = 'ctrl-k',
          custom = {},
        },
      },
    })
    require('telescope').load_extension('neoclip')
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
    vim.keymap.set("i", "<M-r>", clip, { silent = true, desc = "neoclip: open yank history" })
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
