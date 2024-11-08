local M = {
    "nvim-treesitter/nvim-treesitter",
--    event = { "BufReadpos", "BufNewFile" },
    build = ":TSUpdate",
}

 function M.config()
     require("nvim-treesitter.configs").setup ({
         ensure_installed = { "lua", "c","html", "typescript", "javascript" }, 
         -- auto_install = true,
         highlight = {
             enable = true,
             additional_vim_regex_highlighting = false
         },
     })
 end

return M
