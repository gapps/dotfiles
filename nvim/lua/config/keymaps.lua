--Space as my leader key
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Toggling of various settings
-- much of what used to be here is now covered by the mini.basics plugin
-- also <leader>ti is used to toggle the indentline plugin
-- also <leader>tu is used to toggle the undotree plugin
-- also <leader>tb is used to toggle git blame for each line
-- vim.keymap.set("n", "<leader>tt", function()
-- 	vim.cmd.split()
-- 	vim.cmd.term()
-- end, { desc = "Toggle Terminal" })

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

-- Move between windows
-- I find that I can make better use of these combos elsewhere.
-- I don't often use multiple windows in Vim
-- vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
-- vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to bottom window" })
-- vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to top window" })
-- vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

-- move cursor line to center of screen when scrolling down and up
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })

-- move cursor line to center of screen when jumping to next search
vim.keymap.set("n", "n", "nzz", { desc = "Find next and center" })
vim.keymap.set("n", "N", "Nzz", { desc = "Find prev and center" })

-- Redraw long lines to stay within width
-- gq takes a text object, ip being inside paragraph
vim.keymap.set("n", "<leader>r", "gqip", { desc = "Redraw long lines" })

-- Better paste
--keymap("v", "p", '"_dP', opts)

-- These have been replaced by `\` mappings in mini.basics
-- vim.keymap.set("n", "<leader>tr", ":set relativenumber!<CR>", { desc = "Toggle relativenumber" })
-- vim.keymap.set("n", "<leader>tw", ":set wrap!<CR>", { desc = "Toggl}e wrap" })
-- vim.keymap.set("n", "<leader>tl", ":set list!<CR>", { desc = "Toggle listchars" })
-- vim.keymap.set("n", "<leader>tn", ":set number!<CR>", { desc = "Toggle number" })
