vim.pack.add({ "https://github.com/neovim/nvim-lspconfig" })
vim.pack.add({ "https://github.com/mason-org/mason.nvim" })
vim.pack.add({ "https://github.com/mason-org/mason-lspconfig.nvim" })
vim.pack.add({ "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" })

require("mason").setup()
require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
	ensure_installed = {
		"lua_ls",
		"stylua",
		"gopls",
	},
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim", "require" },
			},
		},
	},
})
