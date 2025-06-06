-- LSP Configuration & Plugins
return {
	"neovim/nvim-lspconfig",
	enabled = true,
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"j-hui/fidget.nvim",
		"saghen/blink.cmp",
		{
			"folke/lazydev.nvim",
			-- ft = "lua", -- only load on lua files
			opts = {
				library = {
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
	},
	config = function()
		--  This function gets run when an LSP attaches to a particular buffer.
		--  Every time a new file is opened that is associated with an lsp
		--  this function will be executed to configure the current buffer.
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc)
					vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				map("gd", require("telescope.builtin").lsp_definitions, "Goto Definition")
				map("gr", require("telescope.builtin").lsp_references, "Goto References")
				map("gI", require("telescope.builtin").lsp_implementations, "Goto Implementation")
				map("[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", "Previous Diagnostic")
				map("]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", "Next Diagnostic")
				map("<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", "Error  Details")
				-- map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type Definition")
				-- map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "Document Symbols")
				-- map("<leader>d", require("telescope.builtin").lsp_document_symbols, "Document Symbols")
				-- map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Workspace Symbols")
				-- map("<leader>w", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Workspace Symbols")
				map("<leader>cr", vim.lsp.buf.rename, "Rename")
				map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
				map("K", vim.lsp.buf.hover, "Hover Documentation")
				map("gD", vim.lsp.buf.declaration, "Goto Declaration")

				-- The following two autocommands are used to highlight references of the
				-- word under your cursor when your cursor rests there for a little while.
				-- When you move your cursor, the highlights will be cleared (the second autocommand).
				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client.server_capabilities.documentHighlightProvider then
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = event.buf,
						callback = vim.lsp.buf.document_highlight,
					})

					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = event.buf,
						callback = vim.lsp.buf.clear_references,
					})
				end
			end,
		})

		-- LSP servers and clients are able to communicate to each other what features they support.
		--  By default, Neovim doesn't support everything that is in the LSP Specification.
		--  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
		--  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities())

		-- Enable the following language servers
		--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
		--
		--  Add any additional override configuration in the following tables. Available keys are:
		--  - cmd (table): Override the default command used to start the server
		--  - filetypes (table): Override the default list of associated filetypes for the server
		--  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
		--  - settings (table): Override the default settings passed when initializing the server.
		--        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
		local servers = {
			clangd = {},
			gopls = {},
			pyright = {},
			pylsp = {},
			terraformls = {},
			cssls = {},
			html = {},
			-- ts_ls = {},
			-- ruby_lsp = {},
			ruby_lsp = {
				mason = false,
				cmd = { vim.fn.expand("~/.asdf/shims/ruby-lsp") },
			},
			-- rubocop = {
			-- 	mason = false,
			-- 	cmd = { vim.fn.expand("~/.asdf/shims/rubocop"), "--lsp" },
			-- },
			-- solargraph = {},
			lua_ls = {
				-- cmd = {...},
				-- filetypes { ...},
				-- capabilities = {},
				settings = {
					Lua = {
						-- This prevents the annoying undeclared vim global warning
						diagnostics = { globals = { "vim" } },
						completion = {
							callSnippet = "Replace",
						},
						-- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
						-- diagnostics = { disable = { 'missing-fields' } },
					},
				},
				-- These are my old settings, keeping them here for reference
				-- settings = {
				-- 	Lua = {
				-- 		runtime = { version = "LuaJIT" },
				-- 		workspace = {
				-- 			checkThirdParty = false,
				-- 			-- Tells lua_ls where to find all the Lua files that you have loaded
				-- 			-- for your neovim configuration.
				-- 			library = {
				-- 				"${3rd}/luv/library",
				-- 				unpack(vim.api.nvim_get_runtime_file("", true)),
				-- 			},
				-- 			-- If lua_ls is really slow on your computer, you can try this instead:
				-- 			-- library = { vim.env.VIMRUNTIME },
				-- 		},
				-- 		telemetry = { enable = false },
				-- 		diagnostics = { globals = { "vim" } },
				-- 		completion = {
				-- 			callSnippet = "Replace",
				-- 		},
				-- 		-- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
				-- 		-- diagnostics = { disable = { 'missing-fields' } },
				-- 	},
				-- },
			},
		}

		-- Ensure the servers and tools above are installed
		--  To check the current status of installed tools and/or manually install
		--  other tools, you can run
		--    :Mason
		--
		--  You can press `g?` for help in this menu
		require("mason").setup()

		-- You can add other tools here that you want Mason to install
		-- for you, so that they are available from within Neovim.
		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			"stylua", -- Used to format lua code
		})
		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					-- This handles overriding only values explicitly passed
					-- by the server configuration above. Useful when disabling
					-- certain features of an LSP (for example, turning off formatting for tsserver)
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})
	end,
}
