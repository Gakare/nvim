local harpoon = require("harpoon")

harpoon:setup()

vim.keymap.set("n", "<leader>ha", function() harpoon:list():append() end)
vim.keymap.set("n", "<leader>hu", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<leader>hh", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>ht", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>hn", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>hs", function() harpoon:list():select(4) end)
vim.keymap.set("n", "<leader>th", function() harpoon:list():select(5) end)
vim.keymap.set("n", "<leader>tt", function() harpoon:list():select(6) end)
vim.keymap.set("n", "<leader>tn", function() harpoon:list():select(7) end)
vim.keymap.set("n", "<leader>ts", function() harpoon:list():select(8) end)
