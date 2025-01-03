-- Utility function for key mappings
-- Modes
--   normal = "n",
--   insert = "i",
--   visual = "v",
--   visual_block = "x",
--   term = "t",
--   command = "c",

local nmap = function(keys, func, desc)
	vim.keymap.set("n", keys, func, { desc = desc })
end

--Space as my leader key
-- vim.g.mapleader = " "

-- NORMAL MODE MAPPINGS --

-- Windows, save, and quit
-- nmap("<leader>w", ":echo 'disabled, use space-s instead'<CR>", "OLD Save file")
-- nmap("<leader>w", ":w<cr>", "Save file")
-- nmap("<leader>q", ":q<cr>", "Quit")
-- nmap("<leader>c", ":close<cr>", "Close window")
-- nmap("<leader>o", ":only<cr>", "Only window")

-- Use arrow keys to move between windows
-- nmap("<left>", "<C-w>h", "Move to window on left")
-- nmap("<down>", "<C-w>j", "Move to window below")
-- nmap("<down>", "<C-w>k", "Move to window above")
-- nmap("<right>", "<C-w>l", "Move to window on right ")

-- Toggling of various settings
-- also <leader>ti is used to toggle the indentline plugin
nmap("<leader>tr", ":set relativenumber!<CR>", "Toggle relativenumber")
nmap("<leader>tw", ":set wrap!<CR>", "Toggle wrap")
nmap("<leader>tn", ":set number!<CR>", "Toggle number")
nmap("<leader>tl", ":set list!<CR>", "Toggle listchars")
-- nmap("<leader>s", ":Neotree toggle<CR>", "Toggle file tree")
nmap("<leader>tt", function()
	vim.cmd.split()
	vim.cmd.term()
end, "Toggle Terminal")
-- Leave insert mode in the terminal
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Exit terminal" })

-- Clear search highlighting
-- nmap("<leader><Space>", ":nohlsearch<CR>", "Clear search highlighting")

-- Navigation
-- move cursor line to center of screen when scrolling down and up
nmap("<C-d>", "<C-d>zz", "Scroll down and center")
nmap("<C-u>", "<C-u>zz", "Scroll up and center")
-- move cursor line to center of screen when jumping to next search
nmap("n", "nzz", "Find next and center")
nmap("N", "Nzz", "Find prev and center")

-- Writing
-- Redraw long lines to stay within width
-- gq takes a text object, ip being inside paragraph
nmap("<leader>r", "gqip", "Redraw long lines")

-- Better paste
--keymap("v", "p", '"_dP', opts)

-- INSERT MODE MAPPINGS --
-- keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
-- keymap("v", "<", "<gv", opts)
-- keymap("v", ">", ">gv", opts)
