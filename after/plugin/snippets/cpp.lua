local ls = require("luasnip")
ls.add_snippets("cpp", {
	ls.parser.parse_snippet(
		"hc",
		"/*\n"
			.. " *\t Name: Patrick Chiong, 2002171805, CS $1, Assignment $2\n"
			.. " *\t Description: $3\n"
			.. " *\t Input: $4\n"
			.. " *\t Output: $5\n"
			.. " *\n"
			.. " */\n"
			.. "\n"
	),
})
