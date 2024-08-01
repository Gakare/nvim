local harpoon = require("harpoon")

harpoon:setup()

vim.keymap.set("n", "<leader>a", function()
	harpoon:list():add()
end)

vim.keymap.set("n", "<leader>u", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set("n", "<leader><c-h>", function()
	harpoon:list():select(1)
end)

vim.keymap.set("n", "<leader><c-t>", function()
	harpoon:list():select(2)
end)

vim.keymap.set("n", "<leader><c-n>", function()
	harpoon:list():select(3)
end)

vim.keymap.set("n", "<leader><c-s>", function()
	harpoon:list():select(4)
end)
