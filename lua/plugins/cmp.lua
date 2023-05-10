return {
  dependencies = { "hrsh7th/cmp-emoji", "lukas-reineke/cmp-rg" },
  "hrsh7th/nvim-cmp",
  ---@param opts cmp.ConfigSchema
  opts = function(_, opts)
    local cmp = require("cmp")
    local sources = {
      {
        name = "rg",
        keyword_length = 4,
        max_item_count = 5,
        priority_weight = 60,
        option = {
          additional_arguments = "--smart-case --hidden",
        },
      }

    }
    vim.list_extend(opts.sources, sources)
    local format = opts.formatting.format
    opts.formatting.format = function(c, item)
      item.menu = c.source.name
      return format(_, item)
    end

    opts.window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    }
  end,
}
