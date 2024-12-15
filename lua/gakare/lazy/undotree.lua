return {
    {
        "mbbill/undotree",
        config = function()
             vim.keymap.set("n", "<leader><c-u>", vim.cmd.UndotreeToggle)
         end
    }
}
