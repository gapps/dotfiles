-- https://github.com/Saghen/blink.cmp
return {
	"saghen/blink.cmp",
	lazy = false,
	enabled = true,
	dependencies = {
		"rafamadriz/friendly-snippets",
		"giuxtaposition/blink-cmp-copilot",
	},

	version = "*",
	opts = {
		keymap = {
			preset = "default",
			["<C-j>"] = { "select_next", "fallback" },
			["<C-k>"] = { "select_prev", "fallback" },
		},

		cmdline = {
			enabled = true,
			-- preset = "default",
			-- ["<C-j>"] = { "select_next", "fallback" },
			-- ["<C-k>"] = { "select_prev", "fallback" },
		},

		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},

		completion = {
			menu = {
				border = "single",
				auto_show = true,
				draw = {
					columns = {
						{ "label", "label_description", gap = 1 },
						{ "kind_icon", "kind" },
					},
				},
			},
			documentation = {
				auto_show = true,
				window = { border = "single" },
			},
		},

		signature = {
			enabled = false,
			window = { border = "single" },
		},

		sources = {
			default = { "lsp", "path", "snippets", "buffer", "copilot" },
			-- default = { "lsp", "path", "snippets", "buffer", "copilot" },
			-- default = { "copilot" },
			providers = {
				copilot = {
					name = "copilot",
					enabled = true,
					module = "blink-cmp-copilot",
					score_offset = 100,
					async = true,
				},
			},
		},
	},
}
