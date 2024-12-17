return {
	{
		"VonHeikemen/lsp-zero.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-path",
			"stevearc/conform.nvim",
			"mfussenegger/nvim-lint",
		},
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					php = { "pint" },
					blade = { "blade-formatter" },
					c = { "clang-format" },
					cpp = { "clang-format" },
					rust = { "rustfmt" },
					javascript = { "prettier" },
					html = { "prettier" },
					css = { "prettier" },
					typescript = { "prettier" },
				},

				format_on_save = {
					lsp_format = "fallback",
					timeout_ms = 1500,
				},
			})

			require("lint").linters_by_ft = {
				cpp = { "clangtidy" },
				c = { "clangtidy" },
			}

			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})

			local lsp_zero = require("lsp-zero")
			local cmp = require("cmp")
			local cmp_select = { behavior = cmp.SelectBehavior.Select }

			cmp.setup({
				cmp_select,
				snippet = {
					expand = function(a)
						require("luasnip").lsp_expand(a.body)
					end,
				},
				sources = {
					{ name = "luasnip" },
					{ name = "nvim_lsp" },
				},

				-- Taken from Icheylus @ SO
				formatting = {
					format = function(entry, vim_item)
						vim_item.menu = ({
							nvim_lsp = "[LSP]",
							luasnip = "[Snippet]",
							buffer = "[Buffer]",
						})[entry.source.name]
						vim_item.dup = ({
							luasnip = 0,
						})[entry.source.name] or 0
						return vim_item
					end,
				},
				preselect = "none",
				completion = {
					completopt = "menu,menuone,noinsert",
				},
				mapping = cmp.mapping.preset.insert({
					["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item()),
					["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item()),
					["<C-y>"] = cmp.mapping.confirm({ select = true }),
					["<C-space>"] = cmp.mapping.complete(),
					["<C-u>"] = cmp.mapping.scroll_docs(-4),
					["<C-d>"] = cmp.mapping.scroll_docs(4),
				}),
			})

			lsp_zero.on_attach(function(_, bufnr)
				-- see :help lsp-zero-keybindings
				-- to learn the available actions
				local opts = { buffer = bufnr, remap = false }
				vim.keymap.set("n", "gd", function()
					vim.lsp.buf.definition()
				end, opts)
				vim.keymap.set("n", "K", function()
					vim.lsp.buf.hover()
				end, opts)
				vim.keymap.set("n", "[d", function()
					vim.diagnostic.goto_prev()
				end, opts)
				vim.keymap.set("n", "]d", function()
					vim.diagnostic.goto_next()
				end, opts)
				vim.keymap.set("n", "<leader>vws", function()
					vim.lsp.buf.workspace_symbol(vim.fn.input("Query: "), {})
				end, opts)
				vim.keymap.set("n", "<leader>vd", function()
					vim.diagnostic.open_float()
				end, opts)
				vim.keymap.set("n", "<leader>vca", function()
					vim.lsp.buf.code_action()
				end, opts)
				vim.keymap.set("n", "<leader>vrr", function()
					vim.lsp.buf.references()
				end, opts)
				vim.keymap.set("n", "<leader>vrn", function()
					vim.lsp.buf.rename()
				end, opts)
				vim.keymap.set("i", "<C-h>", function()
					vim.lsp.buf.signature_help()
				end, opts)
			end)

			lsp_zero.default_keymaps()

			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "rust_analyzer", "clangd" },
				handlers = {
					lsp_zero.default_setup,
				},
				automatic_installation = {},
			})

			local lspconfig = require("lspconfig")
			--local configs = require("lspconfig.configs")

			lsp_zero.setup()

			lspconfig.lua_ls.setup({
				settings = {
					Lua = {
						runtime = {
							-- Tell the language server which version of Lua you"re using
							-- (most likely LuaJIT in the case of Neovim)
							version = "LuaJIT",
						},
						diagnostics = {
							-- Get the language server to recognize the `vim` global
							globals = {
								"vim",
							},
						},
						workspace = {
							-- Make the server aware of Neovim runtime files
							library = vim.api.nvim_get_runtime_file("", true),
						},
						telemetry = {
							enable = false,
						},
					},
				},
			})

			lspconfig.phpactor.setup({})

			lspconfig.rust_analyzer.setup({
				settings = {
					checkOnSave = {
						allFeatures = true,
						command = "cargo-clippy",
					},
				},
			})

			lspconfig.glsl_analyzer.setup({
				filetypes = { "vert", "frag" },
			})

			lspconfig.verible.setup({
				cmd = { "verible-verilog-ls", "--rules_config_search" },
				root_dir = function()
					local root_file = ".git"
					return vim.fs.dirname(vim.fs.find(root_file, { upward = true })[1])
				end,
			})

			lspconfig.hls.setup({
				cmd = { "haskell-language-server-wrapper", "--lsp" },
			})

			local ls = require("luasnip")
			--local types = require('luasnip.util.types')

			ls.config.set_config({
				-- Allows LuaSnip to remember to keep around the last snippet
				history = true,

				-- If you have dynamic snippets, it updates as you type
				updateevents = "TextChanged,TextChangedI",

				-- Autosnippets:
				enable_autosnippets = true,
			})

			-- Setting up kepymaps
			-- Jumping forward the snippet.
			vim.keymap.set({ "i", "s" }, "<c-t>", function()
				if ls.expand_or_jumpable() then
					ls.jump(1)
				end
			end)

			-- Jumping backward the snippet.
			vim.keymap.set({ "i", "s" }, "<c-j>", function()
				if ls.jumpable(-1) then
					ls.jump(-1)
				end
			end, { silent = true })

			-- Selecting within a list of options.
			vim.keymap.set({ "i", "s" }, "<c-l>", function()
				if ls.choice_active() then
					ls.change_choice(1)
				end
			end)

			-- Sources my luasnip
			vim.keymap.set("n", "<leader><leader>s", function()
				local path = vim.fn.stdpath("config") .. "/after/plugin/luasnip.lua"
				return path
			end)

			-- Sources my snippets
			require("luasnip.loaders.from_lua").lazy_load({
				paths = { vim.fn.stdpath("config") .. "/after/plugin/snippets" },
			})
		end,
	},
}
