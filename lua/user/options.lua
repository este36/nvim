vim.opt.shadafile = "NONE"
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.langmenu = "en_US.UTF-8"
--vim.opt.guifont = "Iosevka:h17"
vim.cmd('set wildmenu')
vim.opt.virtualedit = "block"
vim.opt.backup = false -- creates a backup file
-- vim.opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
vim.opt.cmdheight = 1 -- more space in the neovim command line for displaying messages
vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8" -- the encoding written to a file
vim.opt.hlsearch = false-- highlight all matches on previous search pattern
vim.opt.ignorecase = false -- ignore case in search patterns
vim.opt.inccommand = "split"
vim.opt.mouse = "a" -- allow the mouse to be used in neovim
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.pumblend = 10
vim.opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 1 -- always show tabs
vim.opt.smartcase = true -- smart case

vim.opt.autoindent = true
vim.opt.smartindent = false -- make indenting smarter again
vim.opt.cindent = false
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.shiftwidth = 4 -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4 -- insert 4 spaces for a tab

vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false -- creates a swapfile
vim.opt.timeoutlen = 1000 -- time to wait for a mapped sequence to complete (in milliseconds)
-- vim.opt.undofile = true -- enable persistent undo
vim.opt.updatetime = 50 -- faster completion (4000ms default)
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.cursorline = true -- highlight the current line
vim.opt.number = true -- set numbered lines
vim.opt.laststatus = 3
vim.opt.showcmd = false
vim.opt.ruler = false
vim.opt.relativenumber = true -- set relative numbered lines
-- vim.opt.numberwidth = 4 -- set number column width {default 4}
-- vim.opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
vim.opt.wrap = true
vim.opt.scrolloff = 4
vim.opt.sidescrolloff = 8
vim.opt.completeopt = { "menuone", "noselect" }
-- vim.opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
vim.opt.title = false
-- colorcolumn = "80",
-- colorcolumn = "120",
vim.opt.fillchars = vim.opt.fillchars + "eob: "
vim.opt.fillchars:append {
  stl = " ",
}

vim.opt.shortmess:append "c"

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]

vim.opt.tabline = "%!v:lua.TabLine()"

function _G.TabLine()
  local s = ''
  local total_tabs = vim.fn.tabpagenr('$')

  for i = 1, total_tabs do
    local buflist = vim.fn.tabpagebuflist(i)
    local win_idx = vim.fn.tabpagewinnr(i)
    local buf = buflist[win_idx]

    local name = '[No Name]'
    local modified = ''
    if buf and vim.fn.bufexists(buf) == 1 then
      local bufname = vim.fn.bufname(buf)
      name = bufname ~= '' and vim.fn.fnamemodify(bufname, ':t') or '[No Name]'
      modified = vim.fn.getbufvar(buf, '&modified') == 1 and ' [+]' or ''
    end

    local is_current = (i == vim.fn.tabpagenr())
    s = s .. '%' .. i .. 'T'
    s = s .. (is_current and '%#TabLineSel#' or '%#TabLine#')
    s = s .. ' ' .. name .. modified .. ' '
  end

  s = s .. '%#TabLineFill#%T'
  return s
end
