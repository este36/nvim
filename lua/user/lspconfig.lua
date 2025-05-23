local M = {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {
      "folke/neodev.nvim",
    },
  },
}

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }
  local keymap = vim.api.nvim_buf_set_keymap
  keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
--   keymap(bufnr, "n", "<m-d>", "<cmd>lua vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.WARN })<CR>", opts)
  keymap(bufnr, "n", "<m-d>", "<cmd>lua vim.diagnostic.setqflist()<CR>", opts)
end

M.on_attach = function(client, bufnr)
  lsp_keymaps(bufnr)
  if client.format then
      client.format.enable = false
  end
end

function M.common_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  return capabilities
end

function M.config()

  local lspconfig = require "lspconfig"
  local icons = require "user.icons"

  vim.diagnostic.config({
    signs = false,  -- Désactive l'affichage des signes dans la marge
    values = { name = "DiagnosticsSignError", text = icons.diagnostics.Error },
    virtual_text = false,  -- Désactive l'affichage du texte virtuel
    virtual_lines = false,
    update_in_insert = false,  -- Ne met pas à jour les diagnostics pendant que tu es en mode Insert
    severity_sort = true,  -- Trie les diagnostics par sévérité (erreurs en premier)
    underline = true,  -- Sous-ligne les erreurs
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  })

  vim.diagnostic.config({
    float = {
       severity = { min = vim.diagnostic.severity.ERROR },
    },
    underline = { severity = vim.diagnostic.severity.ERROR },
  })

  for _, sign in ipairs(vim.tbl_get(vim.diagnostic.config(), "signs", "values") or {}) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
  end

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
  require("lspconfig.ui.windows").default_options.border = "rounded"

  for _, server in pairs(LSP_SERVERS) do
    local opts = {
      on_attach = M.on_attach,
      capabilities = M.common_capabilities(),
      document_highlight = {
          enabled = false,
      },
    }

    local require_ok, settings = pcall(require, "user.lspsettings." .. server)
    if require_ok then
      opts = vim.tbl_deep_extend("force", settings, opts)
    end

    if server == "lua_ls" then
      require("neodev").setup {}
	elseif server == "omnisharp" then
		cmd = {"C:\\Users\\esteban\\Local\\omnisharp-win-x64\\omnisharp.exe", "--hostPID", tostring(vim.fn.getpid())}
    end

    lspconfig[server].setup(opts)
  end
end

return M
