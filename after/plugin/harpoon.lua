local harpoon = require("harpoon")

harpoon:setup()

vim.keymap.set("n", "<leader>a", function()
	harpoon:list():add()
end)

vim.keymap.set("n", "<leader>u", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)

vim.keymap.set("n", "<leader><c-h>1", function()
	harpoon:list():select(1)
end)

vim.keymap.set("n", "<leader><c-h>2", function()
	harpoon:list():select(2)
end)

vim.keymap.set("n", "<leader><c-h>3", function()
	harpoon:list():select(3)
end)

vim.keymap.set("n", "<leader><c-h>4", function()
	harpoon:list():select(4)
end)

vim.keymap.set("n", "<leader><c-h>5", function()
	harpoon:list():select(5)
end)

vim.keymap.set("n", "<leader><c-h>6", function()
	harpoon:list():select(6)
end)

vim.keymap.set("n", "<leader><c-h>7", function()
	harpoon:list():select(7)
end)

vim.keymap.set("n", "<leader><c-h>8", function()
	harpoon:list():select(8)
end)

vim.keymap.set("n", "<leader><c-h>9", function()
	harpoon:list():select(9)
end)

vim.keymap.set("n", "<leader><c-h>0", function()
	harpoon:list():select(10)
end)
