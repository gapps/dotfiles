-- https://github.com/echasnovski/mini.nvim
return {
	{
		"echasnovski/mini.nvim",
		version = false,
		config = function()
			-- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-ai.md
			-- require("mini.ai").setup({ n_lines = 500 })
			require("mini.ai").setup()

			-- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-surround.md
			require("mini.surround").setup()

			-- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-statusline.md
			-- Simple and easy statusline.
			--  You could remove this setup call if you don't like it,
			--  and try some other statusline plugin
			local statusline = require("mini.statusline")
			-- set use_icons to true if you have a Nerd Font
			statusline.setup({ use_icons = vim.g.have_nerd_font })

			-- You can configure sections in the statusline by overriding their
			-- default behavior. For example, here we set the section for
			-- cursor location to LINE:COLUMN
			---@diagnostic disable-next-line: duplicate-set-field
			statusline.section_location = function()
				return "%2l:%-2v"
			end
		end,
	},
}
