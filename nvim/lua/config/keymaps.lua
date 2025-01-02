local nmap = function(keys, func, desc)
	vim.keymap.set("n", keys, func, { desc = desc })
end

local imap = function(keys, func, desc)
	vim.keymap.set("i", keys, func, { desc = desc })
end

local vmap = function(keys, func, desc)
	vim.keymap.set("v", keys, func, { desc = desc })
end

--Space as my leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- nmap("<C-s>", ":w<cr>", "Save file")

-- Toggling of various settings
-- also <leader>ti is used to toggle the indentline plugin
-- and <leader>tc is used to toggle CoPilot
nmap("<leader>tr", ":set relativenumber!<CR>", "Toggle relativenumber")
nmap("<leader>tw", ":set wrap!<CR>", "Toggle wrap")
nmap("<leader>tl", ":set list!<CR>", "Toggle listchars")
nmap("<leader>tn", ":set number!<CR>", "Toggle number")
nmap("<leader>tt", function()
	vim.cmd.split()
	vim.cmd.term()
end, "Toggle Terminal")

-- Leave insert mode in the terminal
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Exit terminal" })

-- Move Lines
-- copied from Lazyvim
vim.keymap.set("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
vim.keymap.set("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
vim.keymap.set("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
vim.keymap.set("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- use arrow keys to move between windows
nmap("<C-h>", "<C-w>h", "Move to left window")
nmap("<C-l>", "<C-w>l", "Move to right window")

-- move cursor line to center of screen when scrolling down and up
nmap("<C-d>", "<C-d>zz", "Scroll down and center")
nmap("<C-u>", "<C-u>zz", "Scroll up and center")

-- move cursor line to center of screen when jumping to next search
nmap("n", "nzz", "Find next and center")
nmap("N", "Nzz", "Find prev and center")

-- Redraw long lines to stay within width
-- gq takes a text object, ip being inside paragraph
nmap("<leader>r", "gqip", "Redraw long lines")

-- Better paste
--keymap("v", "p", '"_dP', opts)
