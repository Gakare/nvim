-- The very basic way to set up my own snippets
local ls = require("luasnip")
--local s = ls.s
--local i = ls.insert_node
--local t = ls.text_node
--local fmt = require("luasnip.extras.fmt").fmt

-- Setting up my snippets
-- To create more snippets using a snippet. Snippetception
ls.add_snippets("lua", {
	ls.parser.parse_snippet(
		"as",
		'ls.add_snippets("$1", {\n' .. '\tls.parser.parse_snippet("$2",\n' .. '\t"$0"),\n' .. "})"
	),
})
