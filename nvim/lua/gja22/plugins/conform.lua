-- https://github.com/stevearc/conform.nvim
return { -- Autoformat
	"stevearc/conform.nvim",
	-- opts = {
	-- 	notify_on_error = false,
	-- 	format_on_save = {
	-- 		timeout_ms = 3000,
	-- 		lsp_fallback = true,
	-- 	},
	-- 	formatters_by_ft = {
	-- 		lua = { "stylua" },
	-- 		-- Conform will run multiple formatters sequentially
	-- 		go = { "goimports", "gofmt" },
	-- 		-- Use a sub-list to run only the first available formatter
	-- 		javascript = { { "prettierd", "prettier" } },
	-- 		ruby = { "rubocop" },
	-- 		tf = { "terraform" },
	-- 		-- have not figured out hcl file formatting yet
	-- 		-- hcl = { "terraform" },
	-- 	},
	-- 	formatters = {
	-- 		rubocop = {
	-- 			args = { "-a", "-f", "quiet", "--stderr", "--stdin", "$FILENAME" },
	-- 		},
	-- 	},
	-- },
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
