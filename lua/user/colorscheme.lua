local M = {
    "LunarVim/darkplus.nvim",
    lazy = false,
    priority = 1000,
}
function M.config()
    vim.cmd.colorscheme "darkplus"
    -- vim.cmd.colorscheme "gruvbox"

--     local hl_groups = vim.api.nvim_get_hl(0, {})
-- 
--     for key, hl_group in pairs(hl_groups) do
--         if hl_group.italic then
--             vim.api.nvim_set_hl(0, key, vim.tbl_extend("force", hl_group, {
--                 italic = false,
--             }))
--         end
--     end
 local groups = vim.fn.getcompletion('', 'highlight')
  for _, group in ipairs(groups) do
    local ok, def = pcall(vim.api.nvim_get_hl, 0, { name = group, link = false })
    if ok then
      vim.api.nvim_set_hl(0, group, vim.tbl_extend("force", def, {
        bold = false,
        italic = false,
      }))
    end
  end
end

return M
