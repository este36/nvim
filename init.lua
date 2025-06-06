require "user.lspservers"
require "user.launch"
require "user.options"
require "user.customcmds"
require "user.autocmds"
require "user.keymaps"
require "user.terminal"

spec "user.colorscheme"
spec "user.devicons"
spec "user.mason"
spec "user.treesitter"
-- spec "user.wichkey"
spec "user.lspconfig"
spec "user.cmp"
spec "user.telescope"
spec "user.nvimtree"
spec "user.lualine"
spec "user.illuminate"
spec "user.gitsigns"
spec "user.toggleterm"
spec "user.minipairs"
spec "user.comment"
-- spec "user.minicomment"
-- spec "user.bufferline"
-- spec "user.vim-visual-multi"

require "user.lazy"

local project_path = vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":p:h:h:h")

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()

parser_config.svelte = {
    install_info = {
        url = "/home/esteban/forks/tree-sitter-svelte",
        branch = "fix-issue-14",
        files = {"src/parser.c", "src/scanner.c"},
        maintainers = {'@este36',},
    },
    filetype = "svelte"
}

-- Charger les fichiers de requêtes (ex: highlights.scm, injections.scm) pour Svelte
local query_files = vim.fn.globpath(project_path, "queries/svelte/**", nil, true)

for _, query_file in ipairs(query_files) do
    local query_name = vim.fn.fnamemodify(query_file, ":t:r")
    local query_content = table.concat(vim.fn.readfile(query_file), "\n")

    -- Enregistrer chaque requête pour le parser Svelte dans Neovim
    vim.treesitter.set_query("svelte", query_name, query_content)
end

require'lspconfig'.omnisharp.setup {
  cmd = {"C:\\Users\\esteban\\Local\\omnisharp-win-x64\\OmniSharp.exe", "--hostPID", tostring(vim.fn.getpid())},
}

vim.cmd "cnoremap <C-f> <C-f>"
