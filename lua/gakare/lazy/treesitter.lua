return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		defaults = {
			lazy = false,
			version = nil,
		},
		config = function()
			require("nvim-treesitter.install").prefer_git = false
			local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

			--if vim.loop.os_uname().sysname == "Windows_NT" then
			--    require("nvim-treesitter.install").compilers = { "clang" }
			--end

			require("nvim-treesitter.configs").setup({
				-- A list of parser names, or "all" (the five listed parsers should always be installed)
				ensure_installed = { "c", "lua", "vim", "vimdoc", "python", "javascript", "rust", "cpp" },
				ignore_install = {},
				modules = {},
				-- Install parsers synchronously (only applied to `ensure_installed`)
				sync_install = false,

				-- Automatically install missing parsers when entering buffer
				-- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
				auto_install = true,

				indent = {
					enable = true,
				},

				highlight = {
					enable = true,
					-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
					-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
					-- Using this option may slow down your editor, and you may see some duplicate highlights.
					-- Instead of true it can also be a list of languages
					additional_vim_regex_highlighting = { "markdown" },
				},
			})

			-- PHP
			parser_config.blade = {
				install_info = {
					url = "https://github.com/EmranMR/tree-sitter-blade",
					files = { "src/parser.c" },
					branch = "main",
				},
				filetype = "blade",
			}

			require("nvim-treesitter.install").compilers = { "zig" }
		end,
	},
}
