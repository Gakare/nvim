-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Facing a bug right now that every time I packerSync it keeps throwing an error
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		-- or                            , branch = '0.1.x',
		requires = {
            { 'nvim-lua/plenary.nvim' },
            { 'sharkdp/fd' },
            { 'BurntSushi/ripgrep' },
        }
    }

	use ({ "miikanissi/modus-themes.nvim" })

	use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

	use {
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		requires = { {"nvim-lua/plenary.nvim"} }
	}

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {

			 {'williamboman/mason.nvim'},
			 {'williamboman/mason-lspconfig.nvim'},

			-- LSP Support
			{'neovim/nvim-lspconfig'},
			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'L3MON4D3/LuaSnip'},
		}
	}

    use 'tpope/vim-fugitive'

    use {
        'akinsho/toggleterm.nvim', tag = '*', config = function()
            require("toggleterm").setup()
        end
    }

end)
