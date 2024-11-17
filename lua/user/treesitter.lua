local M = {
    "nvim-treesitter/nvim-treesitter",
--    event = { "BufReadpos", "BufNewFile" },
    build = ":TSUpdate",
}

 function M.config()
     require("nvim-treesitter.configs").setup ({
         -- ensure_installed = {"css", "lua", "c","html", "typescript", "javascript"}, 
         -- auto_install = true,
         highlight = {
             enable = true,
             additional_vim_regex_highlighting = false
         },
         indent = {
             enable = false,
             disable = { "php" },
         }
     })
 end

return M
