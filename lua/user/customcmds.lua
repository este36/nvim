vim.api.nvim_create_user_command('OpenInNotepadPlusPlus', function()

  local line = vim.fn.line('.')  -- Obtient la ligne actuelle
  local file = vim.fn.expand('%')  -- Obtient le chemin du fichier actuel
  vim.cmd('!start notepad++ -n' .. line .. ' ' .. vim.fn.shellescape(file))  -- Ouvre Notepad++ à cette ligne
end, {})

vim.api.nvim_create_user_command("Cmd", function(opts)
  local output = vim.api.nvim_exec2("silent " .. opts.args, { output = true }).output
  vim.cmd("new")
  vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(output, "\n"))
end, { nargs = "+" })

vim.api.nvim_create_user_command("Files", function()
    vim.cmd('Cmd !find . -type f')
end, {})

vim.api.nvim_create_user_command("Config", function()
    vim.cmd('exe \'e \' . $MYVIMRC')
end, {})
