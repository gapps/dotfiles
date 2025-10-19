-- nvim options

-- Search
vim.opt.incsearch = true
vim.opt.ignorecase = true -- ignore case when searching and completing
vim.opt.smartcase = true
vim.opt.hlsearch = true
-- :set hlsearch! to toggle within nvim
vim.opt.inccommand = "split" -- Show substitutions in a split below

-- Display
vim.opt.cursorline = true -- highlight the current line
vim.opt.termguicolors = true -- allow 24-bit RGB colors in the TUI
vim.opt.guicursor = "a:block" -- block cursor in all modes
vim.opt.number = true -- set numbered lines
vim.opt.relativenumber = true -- no relative numbering
vim.opt.textwidth = 80 -- text width when wrapping enabled
vim.opt.colorcolumn = "80" -- visually indicate line width
vim.opt.signcolumn = "yes" -- show sign column (errors, etc.)
vim.opt.wrap = false -- display lines as one long line
vim.opt.linebreak = true -- split on whitespace, no broken words
vim.opt.showmatch = true -- show matching brackets
vim.opt.showmode = true -- show INSERT, VISUAL, etc. mode on command line
vim.opt.showcmd = true -- show active command on the command line
vim.opt.scrolloff = 2 -- lines above/below when scrolling
vim.opt.sidescrolloff = 2
vim.opt.cmdheight = 1 -- space for displaying messages
vim.opt.listchars = { -- listchars
  eol = "↲",
  tab = "» ",
  nbsp = "␣",
  trail = "•",
  extends = "⟩",
  precedes = "⟨",
}

-- Cut and paste
vim.opt.clipboard = "unnamedplus" -- use system clipboard

-- Backup
vim.opt.swapfile = false -- no swapfile
vim.opt.backup = false -- no backup file
--vim.opt.writebackup = false                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.undofile = true -- enable persistent undo
-- vim.opt.backupdir = "~/.vim/backup"
-- vim.opt.directory = "~/.vim/swp"
-- vim.opt.undodir = "~/.vim/undo"

-- Save and quit
vim.opt.hidden = true -- don't force buffer saves

-- Tabs and indenting
-- set backspace=indent,eol,start               -- from old config, not sure if still needed
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.tabstop = 2 -- insert 4 spaces for a t
vim.opt.iskeyword:append("-")
