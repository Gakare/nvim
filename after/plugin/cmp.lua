require("cmp").setup({
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
})
