local M = {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    {
      "hrsh7th/cmp-nvim-lsp",
      event = "InsertEnter",
    },
    {
      "hrsh7th/cmp-buffer",
      event = "InsertEnter",
    },
    {
      "hrsh7th/cmp-path",
      event = "InsertEnter",
    },
  },
}

function M.config()
  local cmp = require "cmp"

  local check_backspace = function()
    local col = vim.fn.col "." - 1
    return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
  end

  local icons = require "user.icons"

  cmp.setup {
    mapping = cmp.mapping.preset.insert {
      ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
      ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
      ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
      ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
      ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
      ["<C-e>"] = cmp.mapping {
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      },
      -- Accept currently selected item. If none selected, `select` first item.
      -- Set `select` to `false` to only confirm explicitly selected items.
      ["<CR>"] = cmp.mapping.confirm { select = true },
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif check_backspace() then
          fallback()
          -- require("neotab").tabout()
        else
          fallback()
          -- require("neotab").tabout()
        end
      end, {
        "i",
        "s",
      }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),
    },
    formatting = {
      fields = { "kind", "abbr", "menu" },
      format = function(entry, vim_item)
        vim_item.kind = icons.kind[vim_item.kind]
        vim_item.menu = ({
          nvim_lsp = "",
          buffer = "",
          path = "",
        })[entry.source.name]

        return vim_item
      end,
    },
    sources = {
      { name = "nvim_lsp" },
      { name = "buffer" },
      { name = "path" },
    },
    confirm_opts = {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    },
    window = {
      completion = {
--        border = "rounded",
        side_padding = 0,
        scrollbar = false,
      },
      documentation = {
--        border = "rounded",
      },
    },
    experimental = {
      ghost_text = false,
    },
  }
end

return M
