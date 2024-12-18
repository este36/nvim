local M = {
  "nvim-lualine/lualine.nvim",
}

function M.config()
  require("lualine").setup {
    options = {
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      ignore_focus = { "NvimTree" },
    },
    sections = {
      lualine_a = { 'branch' },
      lualine_b = { 'filename' },
      lualine_c = {},
      lualine_x = { 'filetype' },
      lualine_y = {},
      lualine_z = {},
    },
--     extensions = { "quickfix", "man", "fugitive" },
  }
end

return M
