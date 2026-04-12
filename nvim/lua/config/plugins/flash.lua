vim.pack.add({ "https://github.com/folke/flash.nvim" })

require("flash").setup({
	-- Remove q and p to avoid pinky stretch
	labels = "asdfghjklwertyuiozxcvbnm",
	modes = {
		char = {
			jump_labels = true,
		},
	},
})

-- keymaps
vim.keymap.set({ "n", "x", "o" }, "s", function()
	require("flash").jump()
end, { desc = "Flash" })

vim.keymap.set({ "n", "x", "o" }, "S", function()
	require("flash").treesitter()
end, { desc = "Flash Treesitter" })

vim.keymap.set({ "o" }, "r", function()
	require("flash").remote()
end, { desc = "Remote Flash" })

vim.keymap.set({ "x", "o" }, "R", function()
	require("flash").treesitter_search()
end, { desc = "Treesitter Search" })

vim.keymap.set({ "o" }, "<c-s>", function()
	require("flash").toggle()
end, { desc = "Toggle Flash Search" })
