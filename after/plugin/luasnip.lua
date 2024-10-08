local ls = require("luasnip")
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
vim.keymap.set("i", "<c-t>", function()
	if ls.expand_or_jumpable() then
		ls.jump(1)
	end
end)

-- Jumping backward the snippet.
vim.keymap.set({ "i", "s" }, "<c-h>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })

-- Selecting within a list of options.
vim.keymap.set("i", "<c-l>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end)

-- Sources my luasnip
vim.keymap.set("n", "<leader><leader>s", "<cmd>source $HOME/.config/nvim/after/plugin/luasnip.lua<CR>")

-- Sources my snippets
require("luasnip.loaders.from_lua").lazy_load({
	paths = { vim.fn.stdpath("config") .. "/after/plugin/snippets" },
})
