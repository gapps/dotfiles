vim.pack.add({ "https://github.com/folke/which-key.nvim" })

require("which-key").setup()

require("which-key").add({
	{ "<leader>c", group = "Code" },
	{ "<leader>f", group = "Find" },
	{ "<leader>h", group = "Hunk" },
	{ "<leader>g", group = "Git" },
	{ "<leader>t", group = "Toggle" },
})

vim.keymap.set("n", "<leader>?", function()
	require("which-key").show({ global = true })
end, { desc = "Buffer Local Keymaps (which-key)" })
