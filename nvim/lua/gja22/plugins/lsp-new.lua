return {
	{
		"neovim/nvim-lspconfig",
		enabled = false,
		dependencies = {
			"saghen/blink.cmp",
			{
				"folke/lazydev.nvim",
				ft = "lua", -- only load on lua files
				opts = {
					library = {
						{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
					},
				},
			},
		},
		config = function()
			-- 			local capabilities = require("blink.cmp").get_lsp_capabilities()
			-- 			require("lspconfig").lua_ls.setup({ capabilities = capabilities })
		end,
	},
}
