local function colorscheme(color)
<<<<<<< HEAD
	color = color or "default"
	vim.cmd.colorscheme(color)
=======
<<<<<<< HEAD
	color = color or "default"
	vim.cmd.colorscheme(color)
=======
    color = color or "default"
    vim.cmd.colorscheme(color)
>>>>>>> 8387906d15823b76dc4fd81fa44b98139bdf1163
>>>>>>> 345736af08d3a6d96914f7728800b7aaadadb6d2

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	vim.api.nvim_set_hl(0, "Comment", { bg = "none" })
end

return {
<<<<<<< HEAD
=======
<<<<<<< HEAD
>>>>>>> 345736af08d3a6d96914f7728800b7aaadadb6d2
	{
		"EdenEast/nightfox.nvim",
		lazy = false,
		opts = {},
		priority = 1000,
		config = function()
			colorscheme("carbonfox")
		end,
	},
	{
<<<<<<< HEAD
=======
		"dasupradyumna/midnight.nvim",
		lazy = false,
		opts = {},
		priority = 1000,
		config = function()
			colorscheme()
		end,
	},
	{
>>>>>>> 345736af08d3a6d96914f7728800b7aaadadb6d2
		"brenoprata10/nvim-highlight-colors",
		lazy = false,
		config = function()
			require("nvim-highlight-colors").setup({})
		end,
	},
<<<<<<< HEAD
=======
=======
    {
        "EdenEast/nightfox.nvim",
        lazy = false,
        opts = {},
        priority = 1000,
        config = function()
            colorscheme("carbonfox")
        end,
    },
    {
        "norcalli/nvim-colorizer.lua",
        lazy = false,
        config = function()
            require("colorizer").setup({ "*" })
        end,
    },
    {
        "dasupradyumna/midnight.nvim",
        lazy = false,
        opts = {},
        priority = 1000,
        config = function()
            colorscheme()
        end,
    },
    {
        "brenoprata10/nvim-highlight-colors",
        lazy = false,
        config = function()
            require("nvim-highlight-colors").setup({})
        end,
    },
>>>>>>> 8387906d15823b76dc4fd81fa44b98139bdf1163
>>>>>>> 345736af08d3a6d96914f7728800b7aaadadb6d2
}
