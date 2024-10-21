local ls = require("luasnip")

ls.add_snippets("html", {
    ls.parser.parse_snippet("<>", "<$1>$0</$1>"),
})

--ls.add_snippets("html", {
--    ls.parser.parse_snippet("!!!",
--        "<!DOCTYPE html>\n",
--        "<html lang=\"en\">",
--        "<head>",
--        "<meta charset=\"utf-8\">",
--        "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">",
--        "<title>$1</title>",
--        "<link rel=\"stylesheet\" href=\"$2\">",
--        "</head>",
--
--        "<body>",
--        "$0",
--        "</body>",
--        "</html>"),
--})
