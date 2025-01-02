-- https://github.com/echasnovski/mini.ai
--
-- Extends the builtin text objects. I like:
-- `ciq` for change inside quotes
-- `cib` for change inside brackets
--
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
