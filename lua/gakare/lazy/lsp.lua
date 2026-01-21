return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/nvim-cmp",
			"hrsh7th/cmp-nvim-lsp",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-path",
			"stevearc/conform.nvim",
			"mfussenegger/nvim-lint",
			"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
			"phpactor/phpactor", -- Oh yeah serious php time
		},
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					php = { "pint" },
					python = { "black" },
					blade = { "blade-formatter" },
					c = { "clang-format" },
					cpp = { "clang-format" },
					rust = { "rustfmt" },
					javascript = { "prettier" },
					json = { "prettier" },
					html = { "prettier" },
					css = { "prettier" },
					typescript = { "prettier" },
					sql = { "sleek" },
					typescriptreact = { "prettier" },
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

			vim.lsp.config("lua_ls", {
				on_init = function(client)
					if client.workspace_folders then
						local path = client.workspace_folders[1].name
						if
							path ~= vim.fn.stdpath("config")
							and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
						then
							return
						end
					end

					client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
						runtime = {
							version = "LuaJIT",
							path = {
								"lua/?.lua",
								"lua/?/init.lua",
							},
						},
						-- Make the server aware of Neovim runtime files
						workspace = {
							checkThirdParty = false,
							library = {
								vim.env.VIMRUNTIME,
							},
						},
					})
				end,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})

			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})

			local ls = require("luasnip")
			local cmp = require("cmp")
			local cmp_select = { behavior = cmp.SelectBehavior.Select }

			cmp.setup({
				cmp_select,
				snippet = {
					expand = function(a)
						ls.lsp_expand(a.body)
					end,
				},
				sources = {
					{ name = "luasnip" },
					{ name = "nvim_lsp" },
					{ name = "path" },
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
					completopt = "menu,menuone,noselect,preview",
				},
				mapping = cmp.mapping.preset.insert({
					["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item()),
					["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item()),
					["<C-y>"] = cmp.mapping.confirm({
						--behavior = cmp.ConfirmBehavior.Insert,
						select = false,
					}, { "i", "c" }),
					["<C-space>"] = cmp.mapping.complete(),
					["<C-u>"] = cmp.mapping.scroll_docs(-4),
					["<C-d>"] = cmp.mapping.scroll_docs(4),
				}),
			})

			cmp.setup.filetype({ "sql" }, {
				sources = {
					{ name = "vim-dadbod-completion" },
					{ name = "buffer" },
				},
			})

			vim.diagnostic.config({ virtual_text = true, virtual_lines = false })
			require("lsp_lines").setup({})
			vim.keymap.set("n", "<leader>l", function()
				local config = vim.diagnostic.config() or {}
				if config.virtual_text then
					vim.diagnostic.config({ virtual_text = false, virtual_lines = true })
				else
					vim.diagnostic.config({ virtual_text = true, virtual_lines = false })
				end
			end)

			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "clangd" },
				automatic_installation = {},
				automatic_enable = true,
			})

			-- local capabilities = require("cmp_nvim_lsp").default_capabilities()

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

			vim.keymap.set({ "i", "s" }, "<c-k>", function()
				if ls.expand_or_jumpable() then
					ls.expand_or_jump()
				end
			end, { silent = true })
			--
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
