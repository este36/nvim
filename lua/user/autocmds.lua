vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  callback = function()
    vim.cmd "set formatoptions-=c"
    vim.cmd "set formatoptions-=r"
    vim.cmd "set formatoptions-=o"
    vim.cmd "set formatoptions-=b"
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "php",
  callback = function()
    -- Désactive l'indentexpr pour PHP (empêche l'utilisation de GetPhpIndent)
    vim.opt_local.indentexpr = ""
    vim.opt.autoindent = true
    vim.opt.cindent = true
  end
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {"javascript", "javascriptreact", "typescript", "typescriptreact", "html", "css" },
  callback = function ()
    vim.opt_local.shiftwidth = 2
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2 
  end
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = {
    "netrw",
    "Jaq",
    "qf",
    "git",
    "help",
    "man",
    "lspinfo",
    "oil",
    "spectre_panel",
    "lir",
    "DressingSelect",
    "tsplayground",
    "",
  },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR>
      set nobuflisted
    ]]
  end,
})

-- vim.api.nvim_create_autocmd({ "CmdWinEnter" }, {
  -- callback = function()
    -- vim.cmd "quit"
  -- end,
-- })

vim.api.nvim_create_autocmd({ "VimResized" }, {
  callback = function()
    vim.cmd "tabdo wincmd ="
  end,
})

-- vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  -- pattern = { "*" },
  -- callback = function()
    -- vim.cmd "checktime"
  -- end,
-- })

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 40 }
    require("user.simple_clipboard").send(vim.fn.getreg('"'))
  end,
})

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "Underlined", { underline = false })
  end,
})

