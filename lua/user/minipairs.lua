local M = {
    "echasnovski/mini.pairs",
    version = false,
    event = "InsertEnter",
}

M.config = function()
    require("mini.pairs").setup()
end

return M
