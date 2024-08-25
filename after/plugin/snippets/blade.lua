local ls = require("luasnip")

-- [[ For tags support ]]
ls.add_snippets("blade", {
	ls.parser.parse_snippet("<", "<$1>$0</$1>"),
})

ls.add_snippets("blade", {
	ls.parser.parse_snippet("@if", "@if ($$1 $2 $3)\n" .. "\t$0\n" .. "@endif\n"),
})

ls.add_snippets("blade", {
	ls.parser.parse_snippet(
		"@el-if",
		"@if ($1 $2 $3)\n" .. "\t$4\n" .. "@elseif ($5 $6 $7)\n" .. "\t$0\n" .. "@endif\n"
	),
})

ls.add_snippets("blade", {
	ls.parser.parse_snippet("@for", "@for ($$1 = $2; $$1 $3 $4; $$1$5)\n" .. "\t$6\n" .. "@endfor\n"),
})
