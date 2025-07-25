local ls = require("luasnip")
local s = ls.snippet
--local sn = ls.snippet_node
--local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node
local fmt = require("luasnip.extras.fmt").fmt

-- Grabbed from s1n7ax
local function get_root()
	local parser = vim.treesitter.get_parser(0, "typescript")
	local syntax_trees = parser:parse(true)
	return syntax_trees[1]:root()
end

local function has_react_import()
	local query_str = [[
    (import_statement
    (import_clause
    (identifier) @cap (#eq? @cap "React")
 ) 
 ) 
]]

	local query = vim.treesitter.query.parse("typescript", query_str)

	local match = query:iter_matches(get_root(), 0, nil, nil, {
		match_limit = 1,
	})

	if match() then
		return true
	else
		return false
	end
end

-- Initial React Component
ls.add_snippets("typescriptreact", {
	s(
		"rafce",
		fmt(
			[[
            const {1} = ({3}) => {{
                return (
                    <div>{2}</div>
                )
            }}

            export default {1};
                ]],
			{
				f(function()
					if not has_react_import() then
						vim.api.nvim_buf_set_lines(0, 0, 0, false, { "import React from 'react';" })
					end
					local file = vim.fn.expand("%:t:r")
					local fl = string.sub(file, 1, 1)
					local upper_fl = string.upper(fl)
					return upper_fl .. string.sub(file, 2, string.len(file))
				end),
				i(1),
				i(2),
			}
		)
	),
})

ls.add_snippets("typescriptreact", {
	ls.parser.parse_snippet("<>", "<$1>$2</$1>$0"),
})
