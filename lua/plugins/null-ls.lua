return {
  "null-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    local open_lets = {
      method = null_ls.methods.CODE_ACTION,
      filetypes = { "reason" },
      name = "open-lets",
      generator = {
        fn = function(context)
          local letsOpen = "open Lets;"

          local current_line_content = context.content[context.row]
          local contains_lets_binding = current_line_content:match("let%.(%w+)")

          local first_line = context.content[1]
          -- checks that lets is not open already but we have a lets binding in current line
          if first_line ~= letsOpen and contains_lets_binding then
            return {
              {
                title = "Open lets at the top",
                action = function()
                  local lines = { letsOpen, "", first_line }

                  vim.api.nvim_buf_set_lines(context.bufnr, 0, 1, false, lines)
                end,
              },
            }
          end
        end,
      },
    }

    null_ls.register({ open_lets })
  end,
}
