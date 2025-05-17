KEYMAP = vim.keymap.set
OPTS = { noremap = true, silent = true }

KEYMAP("n", "<Space>", "", OPTS)
--KEYMAP("n", ":", ":<C-f>", OPTS)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

KEYMAP("n", "<C-i>", "<C-i>", OPTS)

-- Better window navigation
KEYMAP("n", "<m-h>", "<C-w>h", OPTS)
KEYMAP("n", "<m-j>", "<C-w>j", OPTS)
KEYMAP("n", "<m-k>", "<C-w>k", OPTS)
KEYMAP("n", "<m-l>", "<C-w>l", OPTS)
KEYMAP("n", "<m-tab>", "<c-6>", OPTS)

-- KEYMAP("n", "n", "nzz", OPTS)
-- KEYMAP("n", "N", "Nzz", OPTS)
KEYMAP("n", "*", "*zz", OPTS)
KEYMAP("n", "#", "#zz", OPTS)
KEYMAP("n", "g*", "g*zz", OPTS)
KEYMAP("n", "g#", "g#zz", OPTS)

-- Stay in indent mode
KEYMAP("v", "<", "<gv", OPTS)
KEYMAP("v", ">", ">gv", OPTS)

KEYMAP("x", "p", [["_dP]])

vim.cmd [[:amenu 10.100 mousemenu.Goto\ Definition <cmd>lua vim.lsp.buf.definition()<CR>]]
vim.cmd [[:amenu 10.110 mousemenu.References <cmd>lua vim.lsp.buf.references()<CR>]]
-- vim.cmd [[:amenu 10.120 mousemenu.-sep- *]]

KEYMAP("n", "<RightMouse>", "<cmd>:popup mousemenu<CR>")
-- KEYMAP("n", "<Tab>", "<cmd>:popup mousemenu<CR>")

-- tailwind bearable to work with
KEYMAP({ "n", "x" }, "j", "gj", OPTS)
KEYMAP({ "n", "x" }, "k", "gk", OPTS)

KEYMAP("n", "<leader>w", ":lua vim.wo.wrap = not vim.wo.wrap<CR>", OPTS)

KEYMAP("n", "<leader>r", ":source % <CR>") 
 -- KEYMAP("n", "<leader>x", "<cmd>!chmod +x %<CR>")

KEYMAP("v", "<A-k>", ":m '<-2<CR>gv=gv", OPTS)  -- Déplacer vers le haut
KEYMAP("v", "<A-j>", ":m '>+1<CR>gv=gv", OPTS)  -- Déplacer vers le bas

KEYMAP("n", "<leader>t", ":tabnew<CR>", OPTS)
KEYMAP("n", "<leader>j", ":tabprevious<CR>", OPTS)
KEYMAP("n", "<leader>k", ":tabnext<CR>", OPTS)

KEYMAP("n", "<leader>v", ":vsplit <CR>", OPTS)
KEYMAP("n", "<leader>s", ":split <CR>", OPTS)

KEYMAP("n", "<C-left>", ":vertical resize +3<CR>", OPTS)
KEYMAP("n", "<C-Right>", ":vertical resize -3<CR>", OPTS)

-- KEYMAP("n", "<Leader>e", ":Lex <CR>")

KEYMAP("i", "'", "''<left>", OPTS)
KEYMAP("i", "\"", "\"\"<left>", OPTS)
-- KEYMAP("i", "(", "()<left>", OPTS)
-- KEYMAP("i", "[", "[]<left>", OPTS)
-- KEYMAP("i", "{", "{}<left>", OPTS)
-- KEYMAP("i", "/*", "/**/<left><left>", OPTS)

KEYMAP("v", "<leader>r", "\"hy:%s/<C-r>h//g<left><left>", OPTS)
KEYMAP("v", "<C-s>", ":sort<CR>", OPTS)
