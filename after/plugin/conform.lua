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
