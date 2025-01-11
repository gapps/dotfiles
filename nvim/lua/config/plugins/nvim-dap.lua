-- https://github.com/mfussenegger/nvim-dap
-- https://github.com/suketa/nvim-dap-ruby
return {
	"mfussenegger/nvim-dap",
	lazy = false,
	dependencies = {
		"suketa/nvim-dap-ruby",
		config = function()
			require("dap-ruby").setup()
		end,
	},
}
