-- https://github.com/zbirenbaum/copilot.lua
return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	-- build = ":Copilot auth",
	event = "InsertEnter",
	opts = {
		suggestion = {
			enabled = true,
			auto_trigger = false,
			hide_during_completion = true,
			debounce = 75,
			keymap = {
				-- this is a lie, can't get this working
				-- accept = false, -- handled by nvim-cmp / blink.cmp
				accept = "<Tab>",
				accept_word = false,
				accept_line = false,
				next = "<M-]>",
				prev = "<M-[>",
				dismiss = "<S-Tab>",
			},
		},
		panel = { enabled = false },
		filetypes = {
			yaml = false,
			markdown = false,
			help = false,
			gitcommit = false,
			gitrebase = false,
			["."] = false,
		},
	},
}
