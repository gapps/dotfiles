-- https://github.com/stevearc/conform.nvim
return { -- Autoformat
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		require("conform").setup({
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 500,
				lsp_format = "fallback",
			},
			formatters_by_ft = {
				ruby = { "rubocop" },
				-- ruby = { "rufo" }, --rubocop, standardrb, rufo
				-- eruby = { "erb_format" },
				go = { "goimports", "gofmt" },
				lua = { "stylua" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				css = { "prettierd" },
				scss = { "prettierd" },
				json = { "prettierd" },
				yaml = { "prettierd" },
				-- markdown = { "prettierd" },
				-- html = { "htmlbeautifier" },
				tf = { "terraform" },
			},
		})
		vim.keymap.set("n", "<leader>cf", function()
			require("conform").format()
		end, { desc = "[C]ode [F]ormat" })
	end,
}
