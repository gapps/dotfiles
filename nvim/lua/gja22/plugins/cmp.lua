-- Core completion engine
-- https://github.com/hrsh7th/nvim-cmp
return {
	{
		"hrsh7th/nvim-cmp",
		lazy = false,
		priority = 100,
		dependencies = {
			"onsails/lspkind.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			{ "L3MON4D3/LuaSnip", build = "make install_jsregexp" },
			-- dependencies = {
			-- 	-- `friendly-snippets` contains a variety of premade snippets.
			-- 	--    See the README about individual language/framework/plugin snippets:
			-- 	--    https://github.com/rafamadriz/friendly-snippets
			-- 	{
			-- 		"rafamadriz/friendly-snippets",
			-- 		config = function()
			-- 			require("luasnip.loaders.from_vscode").lazy_load()
			-- 		end,
			-- 	},
			-- },
			"saadparwaiz1/cmp_luasnip", -- snippet completions
			-- Adds other completion capabilities.
			--  nvim-cmp does not ship with all sources by default. They are split
			--  into multiple repos for maintenance purposes.
			-- {
			-- 	config = function()
			-- 		require("lspkind").init()
			-- 	end,
			-- },
		},
		opts = {
			-- Still ecperimenting with these settings
			-- also considering turning completion off by defaulf and then
			-- on[y invoking it when needed using C-space
			performance = {
				debounce = 0, -- default is 60ms
				throttle = 0, -- default is 30ms
			},
		},
		config = function()
			vim.opt.completeopt = "menu,menuone,noselect"
			vim.opt.shortmess:append("c") -- Don't pass messages to |ins-completion-menu|

			local lspkind = require("lspkind")
			lspkind.init({})

			local cmp = require("cmp")

			cmp.setup({
				sources = {
					{ name = "nvim_lsp" },
					{ name = "path" },
					{ name = "buffer" },
				},

				mapping = cmp.mapping.preset.insert({
					["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
					["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
					-- ["<C-b>"] = cmp.mapping.scroll_docs(-4),
					-- ["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-e>"] = cmp.mapping.abort(),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-y>"] = cmp.mapping(
						cmp.mapping.confirm({
							behavior = cmp.ConfirmBehavior.Insert, -- default behavior
							-- behavior = cmp.ConfirmBehavior.Replace,
							select = true,
						}),
						{ "i", "c" }
					),
				}),

				-- Enable lussnip to handle snippet expansion for nvim-cmp
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
						-- vim.snippet.expand(args.body)
					end,
				},
			})

			local ls = require("luasnip")
			ls.config.set_config({
				history = false,
				updateevents = "TextChanged,TextChangedI",
			})

			vim.keymap.set({ "i", "s" }, "<C-k>", function()
				if ls.expand_or_jumpable() then
					ls.expand_or_jump()
				end
			end, { silent = true })

			vim.keymap.set({ "i", "s" }, "<C-j>", function()
				if ls.jumpable(-1) then
					ls.jump(-1)
				end
			end, { silent = true })

			---@diagnostic disable-next-line: missing-fields
			-- local kind = require("lspkind")
			-- formatting = {
			-- 	format = function(entry, vim_item)
			-- 		vim_item.kind = kind.presets.default[vim_item.kind] .. " " .. vim_item.kind
			-- 		-- vim_item.kind = kind.presets.default[vim_item.kind]
			-- 		vim_item.menu = ({
			-- 			nvim_lsp = "[LSP]",
			-- 			luasnip = "[LuaSnip]",
			-- 			path = "[Path]",
			-- 			buffer = "[Buffer]",
			-- 		})[entry.source.name]
			-- 		return vim_item
			-- 	end,
			-- },
		end,
	},
}
