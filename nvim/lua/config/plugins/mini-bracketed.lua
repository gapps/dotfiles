-- https://github.com/echasnovski/mini.bracketed
--
return {
	{
		"echasnovski/mini.bracketed",
		version = "*",
		lazy = false,
		config = function()
			require("mini.bracketed").setup()
		end,
	},
}
