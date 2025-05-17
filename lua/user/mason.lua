local M = {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
  },
}

function M.config()
  local servers = LSP_SERVERS

  require("mason").setup {
    ui = {
      border = "rounded",
    },
  }

  require("mason-lspconfig").setup {
    ensure_installed = servers,
    automatic_enable = false,
  }
end

return M
