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
})
