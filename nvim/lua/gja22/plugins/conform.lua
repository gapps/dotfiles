-- https://github.com/stevearc/conform.nvim
return { -- Autoformat
	"stevearc/conform.nvim",
	opts = {
		notify_on_error = false,
		format_on_save = {
			timeout_ms = 3000,
			lsp_fallback = true,
		},
		formatters_by_ft = {
			lua = { "stylua" },
			-- Conform will run multiple formatters sequentially
			go = { "goimports", "gofmt" },
			-- Use a sub-list to run only the first available formatter
			javascript = { { "prettierd", "prettier" } },
			ruby = { "rubocop" },
			tf = { "terraform" },
			-- have not figured out hcl file formatting yet
			-- hcl = { "terraform" },
		},
		formatters = {
			rubocop = {
				args = { "-a", "-f", "quiet", "--stderr", "--stdin", "$FILENAME" },
			},
		},
	},
}
