-- https://github.com/echasnovski/mini.ai
return {
	{
		"echasnovski/mini.ai",
		version = "*",
		lazy = false,
		config = function()
			require("mini.ai").setup()
		end,
	},
}
